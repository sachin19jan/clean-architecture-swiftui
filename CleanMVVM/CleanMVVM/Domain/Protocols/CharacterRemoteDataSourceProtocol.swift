//
//  CharacterRemoteDataSourceProtocol.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import Combine

/// A protocol defining the contract for a remote data source that fetches character data.
/// This protocol ensures that any type conforming to it provides the capability to fetch character data
/// and return it as a publisher for reactive programming with Combine.
protocol CharacterRemoteDataSourceProtocol {
    
    /// Fetches a list of characters from a remote data source.
    /// - Parameter page: The page number to request characters from. Used for pagination in the API call.
    /// - Returns: A publisher that emits an array of `Character` objects or an `Error` if the request fails.
    func fetchCharacters(page: Int) -> AnyPublisher<[Character], Error>
}
