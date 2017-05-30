//
//  ParsedObject.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 27/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

struct ParsedObject {
    enum ObjectType {
        case link
    }

    let type: ObjectType

    /// Range of object in the text
    let range: NSRange
}

extension ParsedObject: Equatable {
    public static func ==(lhs: ParsedObject, rhs: ParsedObject) -> Bool {
        return lhs.type == rhs.type && lhs.range == rhs.range
    }
}

extension ParsedObject: CustomDebugStringConvertible {
    var debugDescription: String {
        get {
            return "type: \(type), range: \(range)"
        }
    }
}
