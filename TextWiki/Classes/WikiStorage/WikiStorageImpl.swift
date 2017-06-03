//
//  WikiStorageImpl.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 01/06/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

class WikiStorageImpl: WikiStorage {
    fileprivate(set) var text: String

    fileprivate let fileHandle: FileHandle

    fileprivate let writeInterval: Double
    fileprivate var pendingChanges = false

    required convenience init(path: String) throws {
        try self.init(path: path, writeInterval: 5.0)
    }

    init(path: String, writeInterval: Double) throws {
        self.fileHandle = try FileHandleImpl(path: path)
        self.text = try fileHandle.readText()
        self.writeInterval = writeInterval
    }

    deinit {
        synchronizeFile()
    }

    func updateFile(with text: String) {
        self.text = text
        scheduleSynchronization()
    }

    func synchronizeFile() {
        do {
            try fileHandle.write(text: text)
            pendingChanges = false
        }
        catch {
            print("Cannot write to file")
        }
    }
}

fileprivate extension WikiStorageImpl {
    func scheduleSynchronization() {
        if pendingChanges {
            return
        }
        pendingChanges = true

        DispatchQueue.main.asyncAfter(deadline: .now() + writeInterval) { [weak self] in
            self?.synchronizeFile()
        }
    }
}
