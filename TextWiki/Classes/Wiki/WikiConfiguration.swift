//
//  WikiConfiguration.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 01/06/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

struct WikiConfiguration {
    enum WikiType {
        case vimwiki
    }

    let identifier: String
    let type: WikiType

    fileprivate 

    init(identifier: String, configuration: Configuration = ConfigurationImpl()) {
    }
}
