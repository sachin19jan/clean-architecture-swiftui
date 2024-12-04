//
//  CharacterDetailViewModelTests.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//


import XCTest
@testable import CleanMVVM

// Unit tests for the CharacterDetailViewModel class.
class CharacterDetailViewModelTests: XCTestCase {
    
    // Test initialization of CharacterDetailViewModel.
    func testCharacterDetailViewModelInitialization() {
        // Arrange: Create a sample character to pass to the view model.
        let sampleCharacter = Character(
            id: 1,
            name: "Rick Sanchez",
            status: "Alive",
            species: "Human",
            image: "https://example.com/rick.png",
            gender: "Male"
        )
        
        // Act: Initialize the view model with the sample character.
        let viewModel = CharacterDetailViewModel(character: sampleCharacter)
        
        // Assert: Verify that the character property is correctly initialized.
        XCTAssertEqual(viewModel.character.id, 1, "The character ID should be 1")
        XCTAssertEqual(viewModel.character.name, "Rick Sanchez", "The character name should be 'Rick Sanchez'")
        XCTAssertEqual(viewModel.character.status, "Alive", "The character status should be 'Alive'")
        XCTAssertEqual(viewModel.character.species, "Human", "The character species should be 'Human'")
        XCTAssertEqual(viewModel.character.image, "https://example.com/rick.png", "The character image URL should match the expected value")
        XCTAssertEqual(viewModel.character.gender, "Male", "The character gender should be 'Male'")
    }
}
