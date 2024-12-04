//
//  CharactersViewTests.swift
//  CleanMVVM
//
//  Created by JEEVAN TIWARI on 01/12/24.
//


import XCTest

class CharactersViewTests: XCTestCase {
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
    func testPanGestureInCharacterList() {
        // Given: The Characters list is displayed and populated
        let characterList = app.tables["CharactersList"]
        
        // Ensure the list is initially visible
        XCTAssertTrue(characterList.exists)

        // When: The user scrolls (pans) the list of characters
        let firstCell = characterList.cells.element(boundBy: 0)
        let lastCell = characterList.cells.element(boundBy: characterList.cells.count - 1)

        // Perform a pan gesture (dragging the first cell to the last cell)
        firstCell.press(forDuration: 0.1, thenDragTo: lastCell)

        // Then: Ensure the list scrolls smoothly
        XCTAssertTrue(lastCell.isHittable) // The last cell should be visible after scrolling
    }
    
    func testSnapGestureForPagination() {
            // Given: A list of characters is loaded and paginated
            let characterList = app.tables["CharactersList"]
            
            // Ensure the character list is visible
            XCTAssertTrue(characterList.exists)

            // When: The user scrolls up to the last cell and triggers pagination
            let firstCell = characterList.cells.element(boundBy: 0)
            let lastCell = characterList.cells.element(boundBy: characterList.cells.count - 1)

            // Swipe up gesture to trigger snapping
            firstCell.swipeUp()

            // Then: Ensure that the last cell is loaded and snapped into view after pagination
            XCTAssertTrue(lastCell.isHittable) // Last cell should be visible
        }
 */
}
