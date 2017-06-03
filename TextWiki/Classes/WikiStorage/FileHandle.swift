//
//  FileHandle.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 01/06/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

enum FileHandleErrors: Error {
    case fileDoesNotExist
    case fileIsDirectory
    case cannotWriteFile
    case cannotReadFile
}

protocol FileHandle {
    init(path: String) throws

    func readText() throws -> String
    func write(text: String) throws
}
