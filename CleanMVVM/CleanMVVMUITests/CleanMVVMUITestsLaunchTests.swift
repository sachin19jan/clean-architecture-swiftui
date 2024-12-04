//
//  CleanMVVMUITestsLaunchTests.swift
//  CleanMVVMUITests
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import XCTest

final class CleanMVVMUITestsLaunchTests: XCTestCase {
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    @MainActor
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
    /*
     @MainActor
     func testTableCellOpensDetailView() throws {
     let app = XCUIApplication()
     
     // Ensure the app launches successfully
     app.launch()
     
     // Access the first cell in the table view
     let firstCell = app.tables.cells.firstMatch
     
     // Tap the cell to trigger navigation
     firstCell.tap()
     
     // Verify navigation to the detail view by checking the presence of specific UI elements
     let detailViewTitle = app.staticTexts["CharacterNameLabel"] // Replace with the actual identifier
     XCTAssertFalse(detailViewTitle.exists, "The detail view should display the character's name.")
     
     let detailViewImage = app.images["CharacterImageView"] // Replace with the actual identifier
     XCTAssertFalse(detailViewImage.exists, "The detail view should display the character's image.")
     
     // Optionally, capture a screenshot of the detail view
     let attachment = XCTAttachment(screenshot: app.screenshot())
     attachment.name = "Detail View Screenshot"
     attachment.lifetime = .keepAlways
     add(attachment)
     }
     */
    
}


