//
//  WikiTextRouterTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class WikiTextRouterTests: XCTestCase {
    var router: WikiTextRouter!
    var viewController: UIViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewController = UIViewController()

        router = WikiTextRouter()
        router.viewController = viewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShowWikiModule() {
        // before
        let navigation = UINavigationController(rootViewController: viewController)

        // when
        router.showWikiModule(wikiFile: "some/path")

        // Give navigation some time to push view controller.
        expectNothing(timeout: 0.1)

        // then
        XCTAssertEqual(navigation.viewControllers.count, 2)
        XCTAssertTrue(navigation.topViewController is WikiTextViewController)
    }

    func expectNothing(timeout: Double) {
        let expect = expectation(description: "expect nothing")

        DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
            expect.fulfill()
        }
        waitForExpectations(timeout: timeout + 0.1)
    }
}
