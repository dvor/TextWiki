//
//  NSRangeExtension.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 28/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

extension NSRange {
    func contains(position: Int) -> Bool {
        return position >= location && position < (location + length)
    }
}

extension NSRange: Equatable {
    public static func ==(lhs: NSRange, rhs: NSRange) -> Bool {
        return lhs.location == rhs.location && lhs.length == rhs.length
    }
}

extension NSRange: CustomDebugStringConvertible {
    public var debugDescription: String {
        get {
            return "(\(location), \(length))"
        }
    }
}
