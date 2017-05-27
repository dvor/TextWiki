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
