//
//  WikiTextInteractorOutput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol WikiTextInteractorOutput: class {
    /**
        Called when wiki file was loaded.

        Parameters:
          - text: Full text of loaded file.
     */
    func didLoadFile(text: String)

    /**
        Called when parsed objects were updated.

        Parameters:
          - parsedObjects: new parsed objects.
          - range: range in which this change did occur.
     */
    func didReload(parsedObjects: [ParsedObject], in range: NSRange)

    func open(wikiFile filePath: String)
}
