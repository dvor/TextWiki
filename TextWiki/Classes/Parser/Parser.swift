//
//  Parser.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 27/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol Parser {
    /**
        Parse string in given range into ParsedObjects.

        Parameters:
          - string: String to parse
          - range: range that should be parsed. Must not exceed string length.

        Returns: array of ParsedObject that were found in given range.
     */
    func parse(string: String, range: NSRange) -> [ParsedObject]
}
