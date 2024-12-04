//
//  CharacterDetailViewTests.swift
//  CleanMVVM
//
//  Created by JEEVAN TIWARI on 01/12/24.
//


import XCTest

class CharacterDetailViewTests: XCTestCase {
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
    func testCharacterDetailView() {
        // Given: The app has a list of characters, and the first character is tapped
        let characterNameLabel = app.staticTexts["characterNameLabel"]
        
        // Ensure the first character is selected
        let firstCharacter = app.tables["CharactersList"].cells.element(boundBy: 0)
        firstCharacter.tap()

        // When: The character details screen is displayed
        // Then: Verify that the character's name, species, and image are loaded
        XCTAssertTrue(characterNameLabel.exists)

        // Check if the details are correct
        XCTAssertEqual(characterNameLabel.label, "Sachin Bhardwaj")
    }
 */
}
