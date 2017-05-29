//
//  WikiTextRouterInput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol WikiTextRouterInput {
    /**
        Present new wiki module.

        Parameters:
          - filePath: Path to wiki file to show.
     */
    func showWikiModule(wikiFile filePath: String)
}
