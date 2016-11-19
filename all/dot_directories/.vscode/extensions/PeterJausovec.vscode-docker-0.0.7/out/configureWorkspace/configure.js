"use strict";
const vscode = require('vscode');
const path = require('path');
const fs = require('fs');
const config_utils_1 = require('./config-utils');
const yesNoPrompt = [{
        "title": 'Yes',
        "isCloseAffordance": false
    },
    {
        "title": 'No',
        "isCloseAffordance": true
    }];
function genDockerFile(serviceName, imageName, platform, port, cmd) {
    switch (platform.toLowerCase()) {
        case 'nodejs':
            return `
FROM node:latest
COPY package.json /tmp/package.json
RUN cd /tmp && npm install --production
RUN mkdir -p /usr/src/app && mv /tmp/node_modules /usr/src
WORKDIR /usr/src/app
COPY . /usr/src/app
EXPOSE ${port}
CMD ${cmd}
`;
        case 'go':
            return `
# golang:onbuild automatically copies the package source, 
# fetches the application dependencies, builds the program, 
# and configures it to run on startup 
FROM golang:onbuild
EXPOSE ${port}

# For more control, you can copy and build manually
# FROM golang:latest 
# RUN mkdir /app 
# ADD . /app/ 
# WORKDIR /app 
# RUN go build -o main .
# EXPOSE ${port} 
# CMD ["/app/main"]
`;
        case '.net core':
            return `
FROM microsoft/aspnetcore:1.0.1
ARG source=.
WORKDIR /app
EXPOSE ${port}
COPY $source .
ENTRYPOINT dotnet ${serviceName}.dll
`;
        default:
            return `
FROM docker/whalesay:latest
RUN apt-get -y update && apt-get install -y fortunes
CMD /usr/games/fortune -a | cowsay
`;
    }
}
function genDockerCompose(serviceName, imageName, platform, port) {
    switch (platform.toLowerCase()) {
        case 'nodejs':
            return `
version: \'2\'

services:
  ${serviceName}:
    image: ${imageName}
    build:
      context: .
      dockerfile: dockerfile
    environment:
      NODE_ENV: production
    ports:
      - ${port}:${port}`;
        case 'go':
            return `
version: \'2\'

services:
  ${serviceName}:
    image: ${imageName}
    build:
      context: .
      dockerfile: dockerfile
    ports:
      - ${port}:${port}`;
        case '.net core':
            return `
version: \'2\'

services:
  ${serviceName}:
    image: ${imageName}
    build:
      context: .
      dockerfile: dockerfile
    ports:
      - ${port}:${port}`;
        default:
            return `
version: \'2\'

services:
  ${serviceName}:
    image: ${imageName}
    build:
      context: .
      dockerfile: dockerfile
    ports:
      - ${port}:${port}`;
    }
}
function genDockerComposeDebug(serviceName, imageName, platform, port, cmd) {
    switch (platform.toLowerCase()) {
        case 'nodejs':
            var cmdArray = cmd.split(' ');
            if (cmdArray[0].toLowerCase() === 'node') {
                cmdArray.splice(1, 0, '--debug=5858');
                cmd = 'command: ' + cmdArray.join(' ');
            }
            else {
                cmd = '## set your startup file here\n    command: node --debug=5858 app.js';
            }
            return `
version: \'2\'

services:
  ${serviceName}:
    image: ${imageName}
    build:
      context: .
      dockerfile: dockerfile
    environment:
      NODE_ENV: development
    ports:
      - ${port}:${port}
      - 5858:5858
    volumes:
      - .:/usr/src/app
    ${cmd}
`;
        case 'go':
            return `
version: \'2\'

services:
  ${serviceName}:
    image: ${imageName}
    build:
      context: .
      dockerfile: dockerfile
    ports:
        - ${port}:${port}
`;
        case '.net core':
            return `
version: '2'

services:
  ${serviceName}:
    build:
      args:
        source: obj/Docker/empty/
    labels:
      - "com.microsoft.visualstudio.targetoperatingsystem=linux"
    environment:
      - ASPNETCORE_ENVIRONMENT=Development
      - DOTNET_USE_POLLING_FILE_WATCHER=1
    volumes:
      - .:/app
      - ~/.nuget/packages:/root/.nuget/packages:ro
      - ~/clrdbg:/clrdbg:ro
    entrypoint: tail -f /dev/null
`;
        default:
            return `
version: \'2\'

services:
  ${serviceName}:
    image: ${imageName}
    build:
      context: .
      dockerfile: dockerfile
    ports:
      - ${port}:${port}
`;
    }
}
const launchJsonTemplate = `{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Docker: Attach to Node",
            "type": "node",
            "request": "attach",
            "port": 5858,
            "address": "localhost",
            "restart": false,
            "sourceMaps": false,
            "outFiles": [],
            "localRoot": "\${workspaceRoot}",
            "remoteRoot": "/usr/src/app"
        }
    ]
}`;
function hasWorkspaceFolder() {
    return vscode.workspace.rootPath ? true : false;
}
function getPackageJson() {
    if (!hasWorkspaceFolder()) {
        return Promise.resolve(null);
    }
    return Promise.resolve(vscode.workspace.findFiles('package.json', null, 1, null));
}
function getCommand() {
    // open package.json and look for main, scripts start
    return getPackageJson().then(function (uris) {
        var cmd = {
            npmStart: true,
            fullCommand: 'npm start',
            cmd: 'npm start'
        }; //default
        if (uris && uris.length > 0) {
            var json = JSON.parse(fs.readFileSync(uris[0].fsPath, 'utf8'));
            if (json.scripts && json.scripts.start) {
                cmd.npmStart = true;
                cmd.fullCommand = json.scripts.start;
                cmd.cmd = 'npm start';
            }
            else if (json.main) {
                cmd.npmStart = false;
                cmd.fullCommand = 'node' + ' ' + json.main;
                cmd.cmd = cmd.fullCommand;
            }
            else {
                cmd.fullCommand = '';
            }
        }
        return Promise.resolve(cmd);
    });
}
function configure() {
    if (!hasWorkspaceFolder()) {
        vscode.window.showErrorMessage('Docker files can only be generated if VS Code is opened on a folder.');
        return;
    }
    let dockerFile = path.join(vscode.workspace.rootPath, 'dockerfile');
    let dockerComposeFile = path.join(vscode.workspace.rootPath, 'docker-compose.yml');
    let dockerComposeDebugFile = path.join(vscode.workspace.rootPath, 'docker-compose.debug.yml');
    config_utils_1.quickPickPlatform().then((platform) => {
        return platform;
    }).then((platform) => {
        // user pressed Esc?
        if (!platform) {
            return;
        }
        config_utils_1.promptForPort().then((port) => {
            // user pressed Esc?
            if (!port) {
                return;
            }
            var portNum = port || '3000';
            var platformType = platform || 'node';
            var serviceName;
            getCommand().then((cmd) => {
                if (process.platform === 'win32') {
                    serviceName = vscode.workspace.rootPath.split('\\').pop().toLowerCase();
                }
                else {
                    serviceName = vscode.workspace.rootPath.split('/').pop().toLowerCase();
                }
                var imageName = serviceName + ':latest';
                if (fs.existsSync(dockerFile)) {
                    vscode.window.showErrorMessage('A dockerfile already exists. Overwrite?', ...yesNoPrompt).then((item) => {
                        if (item.title.toLowerCase() === 'yes') {
                            fs.writeFileSync(dockerFile, genDockerFile(serviceName, imageName, platformType, portNum, cmd.cmd), { encoding: 'utf8' });
                        }
                    });
                }
                else {
                    fs.writeFileSync(dockerFile, genDockerFile(serviceName, imageName, platformType, portNum, cmd.cmd), { encoding: 'utf8' });
                }
                if (fs.existsSync(dockerComposeFile)) {
                    vscode.window.showErrorMessage('A docker-compose.yml already exists. Overwrite?', ...yesNoPrompt).then((item) => {
                        if (item.title.toLowerCase() === 'yes') {
                            fs.writeFileSync(dockerComposeFile, genDockerCompose(serviceName, imageName, platformType, portNum), { encoding: 'utf8' });
                        }
                    });
                }
                else {
                    fs.writeFileSync(dockerComposeFile, genDockerCompose(serviceName, imageName, platformType, portNum), { encoding: 'utf8' });
                }
                if (fs.existsSync(dockerComposeDebugFile)) {
                    vscode.window.showErrorMessage('A docker-compose.debug.yml already exists. Overwrite?', ...yesNoPrompt).then((item) => {
                        if (item.title.toLowerCase() === 'yes') {
                            fs.writeFileSync(dockerComposeDebugFile, genDockerComposeDebug(serviceName, imageName, platformType, portNum, cmd.fullCommand), { encoding: 'utf8' });
                        }
                    });
                }
                else {
                    fs.writeFileSync(dockerComposeDebugFile, genDockerComposeDebug(serviceName, imageName, platformType, portNum, cmd.fullCommand), { encoding: 'utf8' });
                }
            });
        });
    });
}
exports.configure = configure;
function configureLaunchJson() {
    // contribute a launch.json configuration
    return launchJsonTemplate;
}
exports.configureLaunchJson = configureLaunchJson;
//# sourceMappingURL=configure.js.map