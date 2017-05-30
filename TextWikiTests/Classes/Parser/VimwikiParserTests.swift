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
        run("", [ParsedObject]())
    }

    func testTypefaces() {
        run("*bold*",        [ pObject(.bold,        range(0, 6)) ])
        run("_italic_",      [ pObject(.italic,      range(0, 8)) ])
        run("~~strikeout~~", [ pObject(.strikeout,   range(0, 13)) ])
        run("`inline code`", [ pObject(.inlineCode,  range(0, 13)) ])
        run("super^script^", [ pObject(.superScript, range(5, 8)) ])
        run("sup,,script,,", [ pObject(.subScript,   range(3, 10)) ])
    }

    func testSingleWikiLink() {
        run("[[link]]",                            [ pObject(.link, range(0, 8)) ])
        run("[[this is a link]]",                  [ pObject(.link, range(0, 18)) ])
        run("[[this is a link|With description]]", [ pObject(.link, range(0, 35)) ])
        run("[[../index]]",                        [ pObject(.link, range(0, 12)) ])
        run("[[/index]]",                          [ pObject(.link, range(0, 10)) ])
        run("[[a subdirectory/|Other files]]",     [ pObject(.link, range(0, 31)) ])

        run("[[wiki1:This is a link]]",                                [ pObject(.link, range(0, 24)) ])
        run("[[wiki1:This is a link source|Description of the link]]", [ pObject(.link, range(0, 55)) ])

        run("[[diary:2012-03-05]]",                      [ pObject(.link, range(0, 20)) ])
        run("[[../../diary/2012-03-05]]",                [ pObject(.link, range(0, 26)) ])
        run("[[Todo List#Tomorrow|Tasks for tomorrow]]", [ pObject(.link, range(0, 41)) ])
        run("[[#Tomorrow]]",                             [ pObject(.link, range(0, 13)) ])
        run("[[#Tomorrow]]",                             [ pObject(.link, range(0, 13)) ])

        run("[[file:/home/somebody/a/b/c/music.mp3]]",            [ pObject(.link, range(0, 39)) ])
        run("[[file:C:/Users/somebody/d/e/f/music.mp3]]",         [ pObject(.link, range(0, 42)) ])
        run("[[file:~/a/b/c/music.mp3]]",                         [ pObject(.link, range(0, 26)) ])
        run("[[file:../assets/data.csv|Important Data]]",         [ pObject(.link, range(0, 42)) ])
        run("[[local:C:/Users/somebody/d/e/f/music.mp3]]",        [ pObject(.link, range(0, 43)) ])
        run("[[file:/home/user/documents/|Link to a directory]]", [ pObject(.link, range(0, 50)) ])

        run("[[http://someaddr.com/bigpicture.jpg|{{http://someaddr.com/thumbnail.jpg}}]]", [ pObject(.link, range(0, 76)) ])
    }

    func testWikiLinkInAContext() {
        run( "link in the [[middle of]] a text",      [ pObject(.link, range(12, 13)) ])
        run("This is [[link 1]] and [[some link 2]]", [ pObject(.link, range(8, 10)), pObject(.link, range(23, 15)) ])
    }
}

extension VimwikiParserTest {
    func run(_ string: String, _ parsedObjects: [ParsedObject]) {
        let objects = parser.parse(string: string, range: range(0, string.characters.count))
        XCTAssertEqual(objects, parsedObjects)
    }

    func range(_ location: Int, _ length: Int) -> NSRange {
        return NSRange(location: location, length: length)
    }

    func pObject(_ type: ParsedObject.ObjectType, _ range: NSRange) -> ParsedObject {
        return ParsedObject(type: type, range: range)
    }
}
