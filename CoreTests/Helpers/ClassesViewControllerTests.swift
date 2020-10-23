//
//  ClassesViewControllerTests.swift
//  CoreTests
//
//  Created by Pedro Contreras on 22/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//


import XCTest
@testable import Core

class ClassesViewControllerTests: XCTestCase {
    
    var subject: ClassesViewController!
    
    override func setUpWithError() throws {
        subject = ClassesViewController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        subject = nil
    }

    func testUpdateState()  {
        subject.updateViewState(state: .init(isLoading: true, classes: [.yoga]))
        XCTAssertEqual(subject.activityIndicatorView.isAnimating, true)
        XCTAssertEqual(subject.tableView.numberOfSections, 1)
        XCTAssertEqual(subject.tableView.numberOfRows(inSection: 0), 1)
    }
}
