//
//  WikiTextPresenter.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

class WikiTextPresenter {
    weak var view: WikiTextViewInput!
    var interactor: WikiTextInteractorInput!
    var router: WikiTextRouterInput!

}

extension WikiTextPresenter: WikiTextModuleInput {
}

extension WikiTextPresenter: WikiTextViewOutput {
    func viewIsReady() {

    }
}

extension WikiTextPresenter: WikiTextInteractorOutput {
}
