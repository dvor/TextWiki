//
//  WikiStorage.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 01/06/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

/// WikiStorage is responsible for loading and storing particular file.
/// File is saved on disk from time to time.
protocol WikiStorage {
    var text: String { get }

    /**
        Create file storage with given file path.

        Parameters:
          - path: File path to file to manage.
     */
    init(path: String) throws

    func updateFile(with string: String)

    func synchronizeFile()
}
