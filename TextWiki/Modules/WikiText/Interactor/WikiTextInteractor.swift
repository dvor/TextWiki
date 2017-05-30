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

    fileprivate var text = ""
    fileprivate let parser: Parser

    init(parser: Parser = VimwikiParser()) {
        self.parser = parser
    }
}

extension WikiTextInteractor: WikiTextInteractorInput {
    func loadWikiFile() {
        text =
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

    func textWasChanged(in string: String, in changedRange: NSRange) {
        text = string
        let paragraphRange = (string as NSString).paragraphRange(for: changedRange)

        let objects = parser.parse(string: string, range: paragraphRange)

        output.didReload(parsedObjects: objects, in: paragraphRange)
    }

    func positionWasSelected(_ position: Int) {
        let nsString = (text as NSString)

        let range = nsString.paragraphRange(for: NSRange(location: position, length: 0))
        let objects = parser.parse(string: text, range: range)

        for object in objects {
            if object.range.contains(position: position) {
                switch object.type {
                    case .bold:
                        break
                    case .italic:
                        break
                    case .strikeout:
                        break
                    case .inlineCode:
                        break
                    case .superScript:
                        break
                    case .subScript:
                        break
                    case .link:
                        let filePath = nsString.substring(with: object.range)
                        output.open(wikiFile: filePath)
                }
            }
        }
    }
}
