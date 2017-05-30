//
//  WikiTextPresenter.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

class WikiTextPresenter {
    weak var view: WikiTextViewInput!
    var interactor: WikiTextInteractorInput!
    var router: WikiTextRouterInput!

}

extension WikiTextPresenter: WikiTextModuleInput {
}

extension WikiTextPresenter: WikiTextViewOutput {
    func viewIsReady() {
        interactor.loadWikiFile()
    }

    func willProcessEditing(string: String, range editedRange: NSRange, changeInLength delta: Int) {
        interactor.textWasChanged(in: string, in: editedRange)
    }

    func doubleTap(on position: Int) {
        interactor.positionWasSelected(position)
    }
}

extension WikiTextPresenter: WikiTextInteractorOutput {
    func didLoadFile(text: String) {
        view.text = text
    }

    func didReload(parsedObjects: [ParsedObject], in range: NSRange) {
        let styles: [WikiTextViewTextStyle] = parsedObjects.map {
            var style = WikiTextViewTextStyle(range: $0.range)
            switch $0.type {
                case .bold:
                    style.type = .bold
                case .italic:
                    style.type = .italic
                case .strikeout:
                    style.type = .strikeout
                case .inlineCode:
                    break
                case .superScript:
                    style.type = .superScript
                case .subScript:
                    style.type = .subScript
                case .link:
                    style.color = .red
            }

            return style
        }

        view.set(styles: styles, in: range)
    }

    func open(wikiFile filePath: String) {
        view.deselectText()
        router.showWikiModule(wikiFile: filePath)
    }
}
