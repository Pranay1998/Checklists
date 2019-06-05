//
//  ChecklistsUITests.swift
//  ChecklistsUITests
//
//  Created by Pranay Katta on 2019-06-05.
//  Copyright © 2019 chickenfingers. All rights reserved.
//

import XCTest

class ChecklistsUITests: XCTestCase {
    


    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        XCUIApplication().launchArguments = ["--reset"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        addUIInterruptionMonitor(withDescription: "System Dialog") { (alert) -> Bool in
            if alert.buttons["Allow"].exists {
                alert.buttons["Allow"].tap()
            }
            return true
        }
        XCUIApplication().tap()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testAddChecklist() {
        XCUIApplication().buttons.element(boundBy: 0).tap()
        XCUIApplication().buttons["AddButton"].tap()
        XCUIApplication().textFields["Name of the List"].typeText("Testing Application")
        XCUIApplication().buttons.element(boundBy: 1).tap()
    }

}
