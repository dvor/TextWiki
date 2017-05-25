//
//  ApplicationPresenter.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

class ApplicationPresenter {
    weak var view: ApplicationViewInput!
    var interactor: ApplicationInteractorInput!
    var router: ApplicationRouterInput!

    fileprivate lazy var sideMenu = SideMenuModuleFactory.create()
    fileprivate lazy var wikiText = WikiTextModuleFactory.create()
}

extension ApplicationPresenter: ApplicationModuleInput {
}

extension ApplicationPresenter: ApplicationViewOutput {
    func viewIsReady() {
        let navigation = UINavigationController(rootViewController: wikiText.viewController)

        view.set(sideMenuView: sideMenu.viewController)
        view.set(mainView: navigation)
    }
}

extension ApplicationPresenter: ApplicationInteractorOutput {
}
