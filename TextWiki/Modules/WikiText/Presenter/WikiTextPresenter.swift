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
        let pattern = "\\[\\[.*\\]\\]"

        let regex = try! NSRegularExpression(pattern: pattern, options: [])

        let paragraphRange = (string as NSString).paragraphRange(for: editedRange)

        let objects = regex.matches(in: string, options: [], range: paragraphRange).map {
            WikiTextViewTextObject(type: .link, range: $0.range)
        }

        view.set(textObjects: objects, in: paragraphRange)
    }
}

extension WikiTextPresenter: WikiTextInteractorOutput {
    func didLoadFile(text: String) {
        view.text = text
    }
}
