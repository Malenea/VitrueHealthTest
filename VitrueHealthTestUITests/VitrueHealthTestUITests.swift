//
//  VitrueHealthTestUITests.swift
//  VitrueHealthTestUITests
//
//  Created by Motionmetrics on 19/12/2020.
//  Copyright © 2020 OlivierConan. All rights reserved.
//

import XCTest

/// Current UI testing is very basic and just tests a simple case of working components. That would be your BDD.
/// This one is very simple, and is more of a showcase, `Given` I tap on textfield, `When` keyboard appears, and
/// I press 'done', `Then` input should be taken in account and keyboard should disappear.

class VitrueHealthTestUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testSimpleFlow() throws {
        let app = XCUIApplication()
        app.launch()
        
        let textfield = app.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .textField).element
        textfield.tap()
        
        textfield.typeText("tattarrattat")
                
        app/*@START_MENU_TOKEN@*/.buttons["Done"]/*[[".keyboards",".buttons[\"done\"]",".buttons[\"Done\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
