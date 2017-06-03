//
//  FileHandleImpl.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 01/06/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

class FileHandleImpl: FileHandle {
    fileprivate let path: String

    required init(path: String) throws {
        self.path = path

        let manager = FileManager.default
        var isDirectory: ObjCBool = false

        if !manager.fileExists(atPath: path, isDirectory: &isDirectory) {
            throw FileHandleErrors.fileDoesNotExist
        }
        if isDirectory.boolValue {
            throw FileHandleErrors.fileIsDirectory
        }

        if !manager.isWritableFile(atPath: path) {
            throw FileHandleErrors.cannotWriteFile
        }
    }

    func readText() throws -> String {
        do {
            return try String(contentsOfFile: path)
        } catch {
            throw FileHandleErrors.cannotReadFile
        }
    }

    func write(text: String) throws {
        do {
            try text.write(toFile: path, atomically: true, encoding: .utf8)
        } catch {
            print("Cannot write to file: \(error)")
            throw FileHandleErrors.cannotWriteFile
        }
    }
}
