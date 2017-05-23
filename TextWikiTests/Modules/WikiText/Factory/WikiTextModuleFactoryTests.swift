//
//  WikiTextModuleFactoryTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class WikiTextModuleFactoryTests: XCTestCase {
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreate() {
        //when
        let (_, vc) = WikiTextModuleFactory.create()

        guard let viewController = vc as? WikiTextViewController else {
            XCTAssertTrue(false, "viewController should be WikiTextViewController class")
            return
        }

        //then
        XCTAssertNotNil(viewController.output, "WikiTextViewController is nil after configuration")
        XCTAssertTrue(viewController.output is WikiTextPresenter, "output is not WikiTextPresenter")

        let presenter: WikiTextPresenter = viewController.output as! WikiTextPresenter
        XCTAssertNotNil(presenter.view, "view in WikiTextPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in WikiTextPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is WikiTextRouter, "router is not WikiTextRouter")

        let interactor: WikiTextInteractor = presenter.interactor as! WikiTextInteractor
        XCTAssertNotNil(interactor.output, "output in WikiTextInteractor is nil after configuration")
    }
}
