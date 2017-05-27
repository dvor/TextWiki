//
//  WikiTextInteractorInput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol WikiTextInteractorInput {
    func loadWikiFile()
    func reloadParsedObjects(in string: String, minimalRange: NSRange)
}
