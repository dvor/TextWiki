//
//  WikiTextViewController.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit
import SnapKit

class WikiTextViewController: UIViewController {
    var output: WikiTextViewOutput!

    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()

        createSubviews()
        installConstraints()

        view.backgroundColor = .green
    }
}

extension WikiTextViewController: WikiTextViewInput  {
}

extension WikiTextViewController {
    func createSubviews() {
    }

    func installConstraints() {
    }
}
