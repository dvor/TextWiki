//
//  WikiTextInteractor.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

class WikiTextInteractor {
    weak var output: WikiTextInteractorOutput!

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
}
