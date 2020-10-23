//
//  ClassesViewInteractorTests.swift
//  CoreTests
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import XCTest
import Combine
@testable import Core

class ClassesPresenterTests: XCTestCase {
    
    var subject: ClassesPresenter!
    
    var subscriptions = Set<AnyCancellable>()
    
    let timeout: TimeInterval = 5

    override func setUpWithError() throws {
        subject = ClassesPresenter(service: MockServices.mockClassService)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subscriptions.forEach { $0.cancel() }
        subject = nil
    }

    func testPresenterFetchClasses()  {
        let expectation = XCTestExpectation(description: "View state is updated when fetch classes is called")
        XCTAssertEqual(subject.viewState.classes.count, 0)
        subject.fetchAllClasses()
        let expectedNumberOfClasses = 13
        subject.$viewState.replaceError(with: .init())
            .sink(receiveValue: { model in
                if model.classes.count == expectedNumberOfClasses {
                    expectation.fulfill()
            }
        }).store(in: &subscriptions)
        
        wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(subject.viewState.classes.count, 13)
    }
    
    func testPresenterFilterClasses()  {
        let expectation = XCTestExpectation(description: "View state is updated when filter classes is called")
        subject.fetchAllClasses()
        subject.filterText.send("Exciting")
        let expectedNumberOfClasses = 4
        subject.$viewState
            .replaceError(with: .init())
            .sink(receiveValue: { model in
                if model.classes.count == expectedNumberOfClasses {
                    expectation.fulfill()
            }
        }).store(in: &subscriptions)
        
        wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(subject.viewState.classes.count, expectedNumberOfClasses)
    }
}
