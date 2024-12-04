//
//  CharactersViewModelTests.swift
//  Character
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import XCTest
import Combine
@testable import CleanMVVM

class CharactersViewModelTests: XCTestCase {
    var viewModel: CharactersViewModel!
    var cancellables: Set<AnyCancellable>!
    var mockUseCase: MockFetchCharactersUseCase!

    override func setUp() {
        super.setUp()
        cancellables = []
        mockUseCase = MockFetchCharactersUseCase()
        viewModel = CharactersViewModel(fetchCharactersUseCase: mockUseCase)
    }

    override func tearDown() {
        cancellables = nil
        viewModel = nil
        mockUseCase = nil
        super.tearDown()
    }
    
    func testLoadCharactersSuccess() {
            let expectation = XCTestExpectation(description: "ViewModel loads characters successfully")

            viewModel.$characters
                .dropFirst()
                .sink { characters in
                    XCTAssertEqual(characters.count, 2)
                    XCTAssertEqual(characters.first?.name, "Sachin Bhardwaj")
                    expectation.fulfill()
                }
                .store(in: &cancellables)

        viewModel.loadMoreCharacters()
            wait(for: [expectation], timeout: 1.0)
        }


    func testLoadMoreCharactersSuccess() {
        // Given: A mock list of characters
        let characters = [
            Character(id: 1, name: "Rick Sanchez", status: "Alive", species: "Human", image: "image_url", gender: "Male"),
            Character(id: 2, name: "Morty Smith", status: "Alive", species: "Human", image: "image_url", gender: "Male")
        ]
        mockUseCase.charactersToReturn = characters

        // When: loadMoreCharacters is called
        let expectation = self.expectation(description: "Loading state")
        
        viewModel.$isLoading
            .dropFirst() // Skip the initial value
            .sink { isLoading in
                if isLoading == false {
                    XCTAssertEqual(self.viewModel.characters.count, 2)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.loadMoreCharacters()
        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.hasMoreData)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testLoadMoreCharactersNoMoreData() {
        // Given: A mock list of characters that returns an empty list
        mockUseCase.charactersToReturn = []

        // When: loadMoreCharacters is called
        let expectation = self.expectation(description: "No more data")

        viewModel.$isLoading
            .dropFirst() // Skip the initial value
            .sink { isLoading in
                if isLoading == false {
                    XCTAssertFalse(self.viewModel.hasMoreData)
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.loadMoreCharacters()
        waitForExpectations(timeout: 5.0, handler: nil)

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertFalse(viewModel.hasMoreData)
    }
    
    func testLoadMoreCharactersFailure() {
            // Set the mock to return an error
            if let mockUseCase = viewModel.fetchCharactersUseCase as? MockFetchCharactersUseCase {
                mockUseCase.shouldReturnError = true
            }
            
            // Call loadMoreCharacters
            viewModel.loadMoreCharacters()
            
            // Wait for the asynchronous operation to finish
            let expectation = XCTestExpectation(description: "Load more characters failure")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                XCTAssertNotNil(self.viewModel.errorMessage)
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 2.0)
        }

}

class MockFetchCharactersUseCase: FetchCharactersUseCaseProtocol {
    var shouldReturnError = false
    
    var charactersToReturn = [
                Character(id: 1, name: "Sachin Bhardwaj", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male"),
                Character(id: 2, name: "Ranjit Singh", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", gender: "Male")
            ]

    func execute(page: Int) -> AnyPublisher<[Character], Error> {
        if shouldReturnError {
            return Fail(error: NSError(domain: "Test", code: 1, userInfo: nil))
                .eraseToAnyPublisher()
        } else {
            return Just(charactersToReturn)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
