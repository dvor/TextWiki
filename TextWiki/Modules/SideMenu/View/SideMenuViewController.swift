//
//  SideMenuViewController.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit
import SnapKit

class SideMenuViewController: UIViewController {
    var output: SideMenuViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        createSubviews()
        installConstraints()

        view.backgroundColor = .red
    }
}

extension SideMenuViewController: SideMenuViewInput  {
}

extension SideMenuViewController {
    func createSubviews() {
    }

    func installConstraints() {
    }
}
