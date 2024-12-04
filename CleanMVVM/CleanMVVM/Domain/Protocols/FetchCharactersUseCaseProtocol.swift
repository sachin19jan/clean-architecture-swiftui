//
//  FetchCharactersUseCaseProtocol.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import Combine
/// A protocol defining the contract for a use case that handles the retrieval of character data.
/// This protocol ensures that any type conforming to it provides a method for executing the use case
/// and returning the data as a publisher for reactive programming with Combine.
protocol FetchCharactersUseCaseProtocol {
    
    /// Executes the use case to fetch a list of characters.
    /// - Parameter page: The page number to request characters from. Used for pagination in the data source.
    /// - Returns: A publisher that emits an array of `Character` objects or an `Error` if the request fails.
    func execute(page: Int) -> AnyPublisher<[Character], Error>
}
