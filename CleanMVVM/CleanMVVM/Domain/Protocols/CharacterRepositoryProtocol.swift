//
//  CharacterRepositoryProtocol.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import Combine
/// A protocol defining the contract for a repository that manages the retrieval of character data.
/// This protocol ensures that any type conforming to it provides the capability to get character data
/// and return it as a publisher for reactive programming with Combine.
protocol CharacterRepositoryProtocol {
    
    /// Fetches a list of characters.
    /// - Parameter page: The page number to request characters from. Used for pagination in the data source.
    /// - Returns: A publisher that emits an array of `Character` objects or an `Error` if the request fails.
    func getCharacters(page: Int) -> AnyPublisher<[Character], Error>
}

