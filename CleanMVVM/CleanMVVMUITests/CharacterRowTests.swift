//
//  CharacterRowTests.swift
//  CleanMVVM
//
//  Created by JEEVAN TIWARI on 01/12/24.
//


import XCTest

class CharacterRowTests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launch() // Launch the app for UI tests
    }

    override func tearDown() {
        app = nil
        super.tearDown()
    }
    
    /*
    func testCharacterRowUI() {
        // Given: The character row is rendered in the list
        let characterRow = app.tables["CharactersList"].cells.element(boundBy: 0)

        // When: The user taps on the character row
        characterRow.tap()

        // Then: Ensure that the character's image, name, and species are displayed correctly
        let characterName = app.staticTexts["characterNameLabel"]
        XCTAssertTrue(characterName.exists)
    }
     */
    
}
