//
//  ApplicationModuleFactoryTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class ApplicationModuleFactoryTests: XCTestCase {
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
        let (_, vc) = ApplicationModuleFactory.create()

        guard let viewController = vc as? ApplicationViewController else {
            XCTAssertTrue(false, "viewController should be ApplicationViewController class")
            return
        }

        //then
        XCTAssertNotNil(viewController.output, "ApplicationViewController is nil after configuration")
        XCTAssertTrue(viewController.output is ApplicationPresenter, "output is not ApplicationPresenter")

        let presenter: ApplicationPresenter = viewController.output as! ApplicationPresenter
        XCTAssertNotNil(presenter.view, "view in ApplicationPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in ApplicationPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is ApplicationRouter, "router is not ApplicationRouter")

        let interactor: ApplicationInteractor = presenter.interactor as! ApplicationInteractor
        XCTAssertNotNil(interactor.output, "output in ApplicationInteractor is nil after configuration")
    }
}
