//
//  ApplicationViewInput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

protocol ApplicationViewInput: class {
    /**
        Set's side menu view of an application.

        - Parameters:
          - sideMenuView: view to be used as a side menu.
     */
    func set(sideMenuView: UIViewController)

    /**
        Set's main view of an application

        - Parameters:
          - mainView: view to be used as a main app view.
     */
    func set(mainView: UIViewController)
}
