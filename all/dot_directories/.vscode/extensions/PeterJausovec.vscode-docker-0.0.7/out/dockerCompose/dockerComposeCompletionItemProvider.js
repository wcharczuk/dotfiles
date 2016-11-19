/*---------------------------------------------------------
 * Copyright (C) Microsoft Corporation. All rights reserved.
 *--------------------------------------------------------*/
'use strict';
const vscode_1 = require('vscode');
const helper = require('../helpers/suggestSupportHelper');
const dockerComposeKeyInfo_1 = require('./dockerComposeKeyInfo');
class DockerComposeCompletionItemProvider {
    constructor() {
        this.triggerCharacters = [];
        this.excludeTokens = [];
    }
    provideCompletionItems(document, position, token) {
        var yamlSuggestSupport = new helper.SuggestSupportHelper();
        // Get the line where intellisense was invoked on (e.g. 'image: u').
        var line = document.lineAt(position.line).text;
        if (line.length === 0) {
            // empty line
            return Promise.resolve(this.suggestKeys(''));
        }
        let range = document.getWordRangeAtPosition(position);
        // Get the text where intellisense was invoked on (e.g. 'u').
        let word = range && document.getText(range) || '';
        var textBefore = line.substring(0, position.character);
        if (/^\s*[\w_]*$/.test(textBefore)) {
            // on the first token
            return Promise.resolve(this.suggestKeys(word));
        }
        // Matches strings like: 'image: "ubuntu'
        var imageTextWithQuoteMatchYaml = textBefore.match(/^\s*image\s*\:\s*"([^"]*)$/);
        if (imageTextWithQuoteMatchYaml) {
            var imageText = imageTextWithQuoteMatchYaml[1];
            return yamlSuggestSupport.suggestImages(imageText);
        }
        // Matches strings like: 'image: ubuntu'
        var imageTextWithoutQuoteMatch = textBefore.match(/^\s*image\s*\:\s*([\w\:\/]*)/);
        if (imageTextWithoutQuoteMatch) {
            var imageText = imageTextWithoutQuoteMatch[1];
            return yamlSuggestSupport.suggestImages(imageText);
        }
        return Promise.resolve([]);
    }
    suggestKeys(word) {
        return Object.keys(dockerComposeKeyInfo_1.DOCKER_COMPOSE_KEY_INFO).map(ruleName => {
            var completionItem = new vscode_1.CompletionItem(ruleName);
            completionItem.kind = vscode_1.CompletionItemKind.Keyword;
            completionItem.insertText = ruleName + ': ';
            completionItem.documentation = dockerComposeKeyInfo_1.DOCKER_COMPOSE_KEY_INFO[ruleName];
            return completionItem;
        });
    }
}
exports.DockerComposeCompletionItemProvider = DockerComposeCompletionItemProvider;
//# sourceMappingURL=dockerComposeCompletionItemProvider.js.map