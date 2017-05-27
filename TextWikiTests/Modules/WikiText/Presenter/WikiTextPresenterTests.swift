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

    class MockInteractor: WikiTextInteractorInput {
        func loadWikiFile() {
        }

        func textWasChanged(in string: String, in changedRange: NSRange) {
        }
    }

    class MockRouter: WikiTextRouterInput {

    }

    class MockViewController: WikiTextViewInput {
        var text: String = ""

        func set(styles: [WikiTextViewTextStyle], in range: NSRange) {
        }
    }
}
