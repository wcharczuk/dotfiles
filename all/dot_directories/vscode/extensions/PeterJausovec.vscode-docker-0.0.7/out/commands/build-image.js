"use strict";
const vscode = require('vscode');
function hasWorkspaceFolder() {
    return vscode.workspace.rootPath ? true : false;
}
function getDockerFileUris() {
    if (!hasWorkspaceFolder()) {
        return Promise.resolve(null);
    }
    return Promise.resolve(vscode.workspace.findFiles('**/[dD]ocker[fF]ile', null, 9999, null));
}
function createItem(uri) {
    let length = vscode.workspace.rootPath.length;
    let label = uri.fsPath.substr(length);
    return {
        label: label,
        description: null,
        path: '.' + label.substr(0, label.length - '/dockerfile'.length),
        file: '.' + label
    };
}
function computeItems(uris) {
    let items = [];
    for (let i = 0; i < uris.length; i++) {
        items.push(createItem(uris[i]));
    }
    return items;
}
function buildImage() {
    getDockerFileUris().then(function (uris) {
        if (!uris || uris.length == 0) {
            vscode.window.showInformationMessage('Couldn\'t find any dockerfile in your workspace.');
        }
        else {
            let items = computeItems(uris);
            vscode.window.showQuickPick(items, { placeHolder: 'Choose Dockerfile to build' }).then(function (selectedItem) {
                if (selectedItem) {
                    // TODO: Prompt for name, prefill with generated name below...
                    var imageName;
                    if (process.platform === 'win32') {
                        imageName = selectedItem.path.split('\\').pop().toLowerCase();
                    }
                    else {
                        imageName = selectedItem.path.split('/').pop().toLowerCase();
                    }
                    if (imageName === '.') {
                        if (process.platform === 'win32') {
                            imageName = vscode.workspace.rootPath.split('\\').pop().toLowerCase();
                        }
                        else {
                            imageName = vscode.workspace.rootPath.split('/').pop().toLowerCase();
                        }
                    }
                    var opt = {
                        prompt: 'Tag image as...',
                        value: imageName + ':latest',
                        placeHolder: imageName + ':latest'
                    };
                    vscode.window.showInputBox(opt).then((value) => {
                        if (!value) {
                            return;
                        }
                        let terminal = vscode.window.createTerminal('Docker');
                        terminal.sendText(`docker build  -f ${selectedItem.file} -t ${value} ${selectedItem.path}`);
                        terminal.show();
                    });
                }
            });
        }
    });
}
exports.buildImage = buildImage;
//# sourceMappingURL=build-image.js.map