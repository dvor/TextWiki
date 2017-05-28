//
//  WikiTextInteractorInput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol WikiTextInteractorInput {
    /**
        Load module's wiki file.
     */
    func loadWikiFile()

    /**
        Notify that text in given range was changed.

        Parameters:
          - string: String that was changed.
          - changedRange: range in which changes occured.
     */
    func textWasChanged(in string: String, in changedRange: NSRange)

    /**
        Notify that text at given position was selected.

        Parameters:
          - position: Position that was selected.
     */
    func positionWasSelected(_ position: Int)
}
