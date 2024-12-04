//
//  CharacterRemoteDataSourceTests.swift
//  Character
//
//  Created by sachin bhardwaj on 2024-11-30.
//


import XCTest
import Combine
@testable import CleanMVVM

class CharacterRemoteDataSourceTests: XCTestCase {
    var dataSource: CharacterRemoteDataSource!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        dataSource = CharacterRemoteDataSource()
        cancellables = []
    }

    func testFetchCharactersSuccess() {
        let expectation = XCTestExpectation(description: "Fetch characters from remote data source")

        dataSource.fetchCharacters(page: 1)
            .sink(receiveCompletion: { completion in
                if case .failure = completion {
                    XCTFail("Expected success but got failure")
                }
            }, receiveValue: { characters in
                XCTAssertGreaterThan(characters.count, 0)
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }
}
