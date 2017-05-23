//
//  SideMenuModuleFactory.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

struct SideMenuModuleFactory {
    static func create() -> (moduleInput: SideMenuModuleInput, viewController: UIViewController) {
        let viewController = SideMenuViewController()

        let router = SideMenuRouter()

        let presenter = SideMenuPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SideMenuInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return (moduleInput: presenter, viewController: viewController)
    }
}
