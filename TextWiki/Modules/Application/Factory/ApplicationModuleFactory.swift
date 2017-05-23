//
//  ApplicationModuleFactory.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

struct ApplicationModuleFactory {
    static func create() -> (moduleInput: ApplicationModuleInput, viewController: UIViewController) {
        let viewController = ApplicationViewController()

        let router = ApplicationRouter()

        let presenter = ApplicationPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ApplicationInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return (moduleInput: presenter, viewController: viewController)
    }
}
