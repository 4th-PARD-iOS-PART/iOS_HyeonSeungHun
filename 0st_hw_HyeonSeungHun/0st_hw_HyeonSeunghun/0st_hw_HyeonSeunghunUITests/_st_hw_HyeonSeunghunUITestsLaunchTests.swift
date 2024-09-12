//
//  _st_hw_HyeonSeunghunUITestsLaunchTests.swift
//  0st_hw_HyeonSeunghunUITests
//
//  Created by 현승훈 on 9/12/24.
//

import XCTest

final class _st_hw_HyeonSeunghunUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
