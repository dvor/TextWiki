//
//  WikiTextViewInput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol WikiTextViewInput: class {
    /// Wiki text to be displayed.
    var text: String { get set }

    /**
        Set text styles in given range. All other styles in this range will be removed.

        Parameters:
          - styles: Array of styles to set.
          - range: Range to be updated.
     */
    func set(styles: [WikiTextViewTextStyle], in range: NSRange)

    /**
        Deselects selected text (if any).
     */
    func deselectText()
}
