//
//  WikiTextViewOutput.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol WikiTextViewOutput {
    func viewIsReady()

    /**
        Sent when view is about to process edits.
        The output can verify the changes and make changes to the views's styles.

        Parameters:
          - string: String that was edited.
          - editedRange: The range in the original string (before the edit).
          - delta: The length delta for the editing changes.
     */
    func willProcessEditing(string: String, range editedRange: NSRange, changeInLength delta: Int)

    /**
        Sent when user double taps on some text.

        Parameters:
          - position: Tapped position in text.
     */
    func doubleTap(on position: Int)
}
