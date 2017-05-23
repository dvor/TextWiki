//
//  SideMenuModuleFactoryTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class SideMenuModuleFactoryTests: XCTestCase {
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
        let (_, vc) = SideMenuModuleFactory.create()

        guard let viewController = vc as? SideMenuViewController else {
            XCTAssertTrue(false, "viewController should be SideMenuViewController class")
            return
        }

        //then
        XCTAssertNotNil(viewController.output, "SideMenuViewController is nil after configuration")
        XCTAssertTrue(viewController.output is SideMenuPresenter, "output is not SideMenuPresenter")

        let presenter: SideMenuPresenter = viewController.output as! SideMenuPresenter
        XCTAssertNotNil(presenter.view, "view in SideMenuPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in SideMenuPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is SideMenuRouter, "router is not SideMenuRouter")

        let interactor: SideMenuInteractor = presenter.interactor as! SideMenuInteractor
        XCTAssertNotNil(interactor.output, "output in SideMenuInteractor is nil after configuration")
    }
}
