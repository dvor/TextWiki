//
//  SideMenuPresenterTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class SideMenuPresenterTest: XCTestCase {
    var presenter: SideMenuPresenter!
    var interactor: MockInteractor!
    var router: MockRouter!
    var view: MockViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = MockInteractor()
        router = MockRouter()
        view = MockViewController()

        presenter = SideMenuPresenter()
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: SideMenuInteractorInput {

    }

    class MockRouter: SideMenuRouterInput {

    }

    class MockViewController: SideMenuViewInput {

    }
}
