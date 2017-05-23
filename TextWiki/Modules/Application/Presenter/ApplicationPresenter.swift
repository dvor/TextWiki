//
//  ApplicationPresenter.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

class ApplicationPresenter: ApplicationModuleInput, ApplicationViewOutput, ApplicationInteractorOutput {
    weak var view: ApplicationViewInput!
    var interactor: ApplicationInteractorInput!
    var router: ApplicationRouterInput!

    func viewIsReady() {
        let c1 = UIViewController()
        c1.view.backgroundColor = .red
        let c2 = UIViewController()
        c2.view.backgroundColor = .green

        view.set(sideMenuView: c1)
        view.set(mainView: c2)
    }
}
