//
//  WikiTextViewInput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol WikiTextViewInput: class {
    var text: String { get set }

    func set(textObjects: [WikiTextViewTextObject], in changedRange: NSRange)
}
