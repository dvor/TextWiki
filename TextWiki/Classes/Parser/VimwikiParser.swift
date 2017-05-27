//
//  VimwikiParser.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 27/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

/// Parser for vimwiki syntax. See https://github.com/vimwiki/vimwiki
class VimwikiParser: Parser {
    func parse(string: String, range: NSRange) -> [ParsedObject] {
        let pattern = "\\[\\[.*\\]\\]"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])

        return regex.matches(in: string, options: [], range: range).map {
            ParsedObject(type: .link, range: $0.range)
        }
    }
}
