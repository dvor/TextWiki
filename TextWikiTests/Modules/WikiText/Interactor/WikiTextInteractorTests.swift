//
//  WikiTextInteractorTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class WikiTextInteractorTests: XCTestCase {
    var interactor: WikiTextInteractor!
    var output: MockPresenter!
    var parser: Parser!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        parser = MockParser()
        interactor = WikiTextInteractor(parser: parser)

        output = MockPresenter()
        interactor.output = output
    }

    override func tearDown() {
        interactor = nil
        output = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testTextWasChanged() {
        // when
        interactor.textWasChanged(in: "123", in: NSRange(location: 1, length: 1))

        // then
        XCTAssertEqual(output.didReloadParsedObjects.count, 1)
        XCTAssertEqual(output.didReloadParsedObjects[0].type, .link)
        XCTAssertEqual(output.didReloadParsedObjects[0].range, NSRange(location: 0, length: 3))
    }
}

extension WikiTextInteractorTests {
    class MockPresenter: WikiTextInteractorOutput {
        var didReloadParsedObjects: [ParsedObject]!

        func didLoadFile(text: String) {
        }

        func didReload(parsedObjects: [ParsedObject], in range: NSRange) {
            didReloadParsedObjects = parsedObjects
        }

        func open(wikiFile filePath: String) {
        }
    }

    class MockParser: Parser {
        func parse(string: String, range: NSRange) -> [ParsedObject] {
            if string == "123" && range == NSRange(location: 0, length: 3) {
                return [
                    ParsedObject(type: .link, range: range)
                ]
            }

            return [ParsedObject]()
        }
    }
}
