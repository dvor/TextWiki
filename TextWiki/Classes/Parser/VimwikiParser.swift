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
    let rules: [ParsedObject.ObjectType : NSRegularExpression] = [
        .link : regex(from: "\\[\\[.*?\\]\\]"),
    ]

    func parse(string: String, range: NSRange) -> [ParsedObject] {
        var parsedObjects = [ParsedObject]()

        for (type, regex) in rules {
            parsedObjects += regex.matches(in: string, options: [], range: range).map {
                ParsedObject(type: type, range: $0.range)
            }
        }

        return parsedObjects
    }
}

fileprivate func regex(from pattern: String) -> NSRegularExpression {
    return try! NSRegularExpression(pattern: pattern, options: [])
}
