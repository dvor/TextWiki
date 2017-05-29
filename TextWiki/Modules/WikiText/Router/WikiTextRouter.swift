//
//  WikiTextRouter.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

class WikiTextRouter: WikiTextRouterInput {
    weak var viewController: UIViewController?

    func showWikiModule(wikiFile filePath: String) {
        let (_, controller) = WikiTextModuleFactory.create()

        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
