//
//  WikiTextViewTextObject.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 27/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

struct WikiTextViewTextObject {
    enum ObjectType {
        case link
    }

    let type: ObjectType
    let range: NSRange
}
