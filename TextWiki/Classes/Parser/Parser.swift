//
//  Parser.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 27/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol Parser {
    func parse(string: String, range: NSRange) -> [ParsedObject]
}
