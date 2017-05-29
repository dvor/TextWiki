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
            switch $0.type {
                case .link:
                    return WikiTextViewTextStyle(range: $0.range, color: .red)
            }
        }

        view.set(styles: styles, in: range)
    }

    func open(wikiFile filePath: String) {
        view.deselectText()
        router.showWikiModule(wikiFile: filePath)
    }
}
