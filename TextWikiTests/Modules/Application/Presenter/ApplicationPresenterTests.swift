//
//  ApplicationPresenterTests.swift
//  TextWiki
//
//  Created by Dmytro Vorobiov on 23/05/2017.
//  Copyright © 2017 Dmytro Vorobiov. All rights reserved.
//

import XCTest

class ApplicationPresenterTest: XCTestCase {
    var presenter: ApplicationPresenter!
    var interactor: MockInteractor!
    var router: MockRouter!
    var view: MockViewController!

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        interactor = MockInteractor()
        router = MockRouter()
        view = MockViewController()

        presenter = ApplicationPresenter()
        presenter.interactor = interactor
        presenter.router = router
        presenter.view = view
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewConfiguration() {
        // when
        presenter.viewIsReady()

        // then
        XCTAssertNotNil(view.sideMenuView)
        XCTAssertNotNil(view.mainView)
    }

    class MockInteractor: ApplicationInteractorInput {

    }

    class MockRouter: ApplicationRouterInput {

    }

    class MockViewController: ApplicationViewInput {
        var sideMenuView: UIViewController?
        var mainView: UIViewController?

        func set(sideMenuView: UIViewController) {
            self.sideMenuView = sideMenuView
        }

        func set(mainView: UIViewController) {
            self.mainView = mainView
        }
    }
}
