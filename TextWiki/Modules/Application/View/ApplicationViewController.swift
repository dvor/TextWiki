//
//  ApplicationViewController.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit
import SnapKit
import LGSideMenuController

class ApplicationViewController: LGSideMenuController {
    var output: ApplicationViewOutput! {
        didSet {
            // LGSideMenuController loads view in init method when output is not ready yet
            // Calling output.viewIsReady() from output.didSet method to avoid crash.
            if isViewLoaded {
                output.viewIsReady()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        swipeGestureArea = .full
        leftViewPresentationStyle = .slideBelow

        if let output = output {
            // LGSideMenuController loads view in init method when output is not ready yet
            // Calling output.viewIsReady() from output.didSet method to avoid crash.
            output.viewIsReady()
        }
    }
}

extension ApplicationViewController: ApplicationViewInput {
    func set(sideMenuView: UIViewController) {
        leftViewController = sideMenuView
    }

    func set(mainView: UIViewController) {
        rootViewController = mainView
    }
}
