//
//  SideMenuInteractorTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class SideMenuInteractorTests: XCTestCase {
    var interactor: SideMenuInteractor!
    var output: SideMenuInteractorOutput!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = SideMenuInteractor()

        output = MockPresenter()
        interactor.output = output
    }

    override func tearDown() {
        interactor = nil
        output = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockPresenter: SideMenuInteractorOutput {

    }
}
