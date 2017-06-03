//
//  Wiki.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 01/06/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

class Wiki {
    enum FileType {
        /// Main wiki file.
        case mainFile

        /// File by local path.
        case file(localPath: String)
    }

    let configuration: WikiConfiguration

    init(configuration: WikiConfiguration) {
        self.configuration = configuration
    }

    func path(for type: FileType) -> String {
        switch type {
            case .mainFile:
                return path(fromLocalPath: mainLocalPath)
            case .file(let localPath):
                return path(fromLocalPath: localPath)
        }
    }
}

fileprivate extension Wiki {
    var fileExtension: String {
        get {
            switch configuration.type {
                case .vimwiki:
                    return ".wiki"
            }
        }
    }

    var mainLocalPath: String {
        get {
            return "index"
        }
    }

    func path(fromLocalPath localPath: String) -> String {
//        let path = 
        return ""
    }
}
