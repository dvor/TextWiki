//
//  Configuration.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 01/06/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

protocol Configuration {
    static var mainWikiFileName: String { get }

    static var vimwikiFileExtension: String { get }
}
