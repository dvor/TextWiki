//
//  WikiTextModuleFactory.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

struct WikiTextModuleFactory {
    static func create() -> (moduleInput: WikiTextModuleInput, viewController: UIViewController) {
        let viewController = WikiTextViewController()

        let router = WikiTextRouter()

        let presenter = WikiTextPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = WikiTextInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return (moduleInput: presenter, viewController: viewController)
    }
}
