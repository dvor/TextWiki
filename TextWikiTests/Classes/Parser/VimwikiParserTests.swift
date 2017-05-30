//
//  VimwikiParserTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 30/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class VimwikiParserTest: XCTestCase {
    var parser: VimwikiParser!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        parser = VimwikiParser()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEmptyText() {
        let objects = parser.parse(string: "", range: range(0, 0))
        XCTAssertEqual(objects.count, 0)
    }

    func testSingleWikiLink() {
        var string = "[[link]]"
        var objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 8)))

        string = "[[this is a link]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 18)))

        string = "[[this is a link|With description]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 35)))

        string = "[[../index]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 12)))

        string = "[[/index]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 10)))

        string = "[[a subdirectory/|Other files]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 31)))

        string = "[[wiki1:This is a link]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 24)))

        string = "[[wiki1:This is a link source|Description of the link]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 55)))

        string = "[[diary:2012-03-05]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 20)))

        string = "[[../../diary/2012-03-05]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 26)))

        string = "[[Todo List#Tomorrow|Tasks for tomorrow]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 41)))

        string = "[[#Tomorrow]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 13)))

        string = "[[#Tomorrow]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 13)))

        string = "[[file:/home/somebody/a/b/c/music.mp3]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 39)))

        string = "[[file:C:/Users/somebody/d/e/f/music.mp3]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 42)))

        string = "[[file:~/a/b/c/music.mp3]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 26)))

        string = "[[file:../assets/data.csv|Important Data]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 42)))

        string = "[[local:C:/Users/somebody/d/e/f/music.mp3]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 43)))

        string = "[[file:/home/user/documents/|Link to a directory]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 50)))

        string = "[[http://someaddr.com/bigpicture.jpg|{{http://someaddr.com/thumbnail.jpg}}]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(0, 76)))
    }

    func testWikiLinkInAContext() {
        var string = "link in the [[middle of]] a text"
        var objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 1)
        XCTAssertEqual(objects[0], pObjects(.link, range(12, 13)))

        string = "This is [[link 1]] and [[some link 2]]"
        objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects.count, 2)
        XCTAssertEqual(objects[0], pObjects(.link, range(8, 10)))
        XCTAssertEqual(objects[1], pObjects(.link, range(23, 15)))
    }
}

extension VimwikiParserTest {
    func range(_ location: Int, _ length: Int) -> NSRange {
        return NSRange(location: location, length: length)
    }

    func pObjects(_ type: ParsedObject.ObjectType, _ range: NSRange) -> ParsedObject {
        return ParsedObject(type: type, range: range)
    }
}
