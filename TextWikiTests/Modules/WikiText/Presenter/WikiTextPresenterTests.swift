//
//  WikiTextPresenterTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class WikiTextPresenterTest: XCTestCase {
    var presenter: WikiTextPresenter!
    var interactor: MockInteractor!
    var router: MockRouter!
    var view: MockViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = MockInteractor()
        router = MockRouter()
        view = MockViewController()

        presenter = WikiTextPresenter()
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewIsReady() {
        // when
        presenter.viewIsReady()

        // then
        XCTAssertTrue(interactor.didLoadFileString)
    }

    func testWillProcessEditing() {
        // before
        let range = NSRange(location: 1, length: 2)

        // when
        presenter.willProcessEditing(string: "123", range: range, changeInLength: 1)

        // then
        XCTAssertEqual(interactor.textWasChangedString, "123")
        XCTAssertEqual(interactor.textWasChangedRange, range)
    }

    func testDoubleTap() {
        // when
        presenter.doubleTap(on: 5)

        // then
        XCTAssertEqual(interactor.positionWasSelectedPosition, 5)
    }

    func testDidLoadFile() {
        // when
        presenter.didLoadFile(text: "some text")

        // then
        XCTAssertEqual(view.text, "some text")
    }

    func testDidReloadParsedObjects() {
        // before
        let range = NSRange(location: 1, length: 2)
        let range0 = NSRange(location: 2, length: 3)
        let range1 = NSRange(location: 3, length: 4)

        let parsedObjects = [
            ParsedObject(type: .link, range: range0),
            ParsedObject(type: .link, range: range1),
        ]

        // when
        presenter.didReload(parsedObjects: parsedObjects, in: range)

        // then
        XCTAssertEqual(view.setStyles.count, 2)
        XCTAssertEqual(view.setStyles[0].range, range0)
        XCTAssertEqual(view.setStyles[0].color, .red)
        XCTAssertEqual(view.setStyles[1].range, range1)
        XCTAssertEqual(view.setStyles[1].color, .red)

        XCTAssertEqual(view.setStylesRange, range)
    }

    func testOpenWikiFile() {
        // when
        presenter.open(wikiFile: "some/path")

        // then
        XCTAssertTrue(view.deselectTestDone)
        XCTAssertEqual(router.showWikiModuleFilePath, "some/path")
    }
}

extension WikiTextPresenterTest {
    class MockInteractor: WikiTextInteractorInput {
        var didLoadFileString = false
        var textWasChangedString: String!
        var textWasChangedRange: NSRange!
        var positionWasSelectedPosition: Int!

        func loadWikiFile() {
            didLoadFileString = true
        }

        func textWasChanged(in string: String, in changedRange: NSRange) {
            textWasChangedString = string
            textWasChangedRange = changedRange
        }

        func positionWasSelected(_ position: Int) {
            positionWasSelectedPosition = position
        }
    }

    class MockRouter: WikiTextRouterInput {
        var showWikiModuleFilePath: String!

        func showWikiModule(wikiFile filePath: String) {
            showWikiModuleFilePath = filePath
        }
    }

    class MockViewController: WikiTextViewInput {
        var text: String = ""

        var setStyles: [WikiTextViewTextStyle]!
        var setStylesRange: NSRange!

        var deselectTestDone = false

        func set(styles: [WikiTextViewTextStyle], in range: NSRange) {
            setStyles = styles
            setStylesRange = range
        }

        func deselectText() {
            deselectTestDone = true
        }
    }
}
