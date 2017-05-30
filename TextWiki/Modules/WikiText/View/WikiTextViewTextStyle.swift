//
//  WikiTextViewTextStyle.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 27/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import UIKit

struct WikiTextViewTextStyle {
    enum TextType {
        case none
        case bold
        case italic
        case strikeout
        case superScript
        case subScript
    }

    /// Range on which style should be applied.
    let range: NSRange

    /// If not set default color would be used.
    var color: UIColor? = nil

    /// Type of text to be used.
    var type: TextType = .none

    init(range: NSRange) {
        self.range = range
    }
}
