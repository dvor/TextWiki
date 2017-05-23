//
//  SideMenuPresenter.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

class SideMenuPresenter {
    weak var view: SideMenuViewInput!
    var interactor: SideMenuInteractorInput!
    var router: SideMenuRouterInput!

}

extension SideMenuPresenter: SideMenuModuleInput {
}

extension SideMenuPresenter: SideMenuViewOutput {
    func viewIsReady() {

    }
}

extension SideMenuPresenter: SideMenuInteractorOutput {
}
