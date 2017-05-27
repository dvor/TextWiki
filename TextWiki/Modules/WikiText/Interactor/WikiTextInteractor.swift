//
//  WikiTextInteractor.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import Foundation

class WikiTextInteractor {
    weak var output: WikiTextInteractorOutput!

    fileprivate let parser: Parser

    init(parser: Parser = VimwikiParser()) {
        self.parser = parser
    }
}

extension WikiTextInteractor: WikiTextInteractorInput {
    func loadWikiFile() {
        let text =
"= Header1 =\n" +
"== Header2 ==\n" +
"=== Header3 ===\n" +
"\n" +
"*bold text*\n" +
"_italic text_\n" +
"\n" +
"[[wiki link]]\n" +
"[[wiki link|description]]\n" +
"\n" +
"* bullet list item 1\n" +
"* bullet list item 2\n" +
"    a) numbered list item 1\n" +
"    b) numbered list item 2\n" +
"\n" +
"{{{python\n" +
"def greet(s):\n" +
"    print(\"Hello, \" + s)\n" +
"}}}\n" +
"\n" +
"| a table |  |\n" +
"|---------|--|\n" +
"|         |  |\n" +
""

        output.didLoadFile(text: text)
    }

    func reloadParsedObjects(in string: String, minimalRange: NSRange) {
        let paragraphRange = (string as NSString).paragraphRange(for: minimalRange)

        let objects = parser.parse(string: string, range: paragraphRange)

        output.didReload(parsedObjects: objects, in: paragraphRange)
    }
}
