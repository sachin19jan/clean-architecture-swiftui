//
//  CharacterRepository.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import Combine

/// This class acts as the repository for fetching character data.
/// It interacts with the CharacterRemoteDataSource to retrieve data and abstracts the data source logic from the rest of the app.
class CharacterRepository: CharacterRepositoryProtocol {
    
    /// The remote data source used to fetch character data.
    private let remoteDataSource: CharacterRemoteDataSourceProtocol
    
    /// Initializes a new instance of CharacterRepository.
    /// - Parameter remoteDataSource: An optional parameter to inject a custom data source. Defaults to an instance of CharacterRemoteDataSource.
    init(remoteDataSource: CharacterRemoteDataSourceProtocol = CharacterRemoteDataSource()) {
        self.remoteDataSource = remoteDataSource
    }
    
    /// Fetches a list of characters from the remote data source.
    /// - Parameter page: The page number to request characters from. Used for pagination in the API call.
    /// - Returns: A publisher that emits an array of Character objects or an Error if the request fails.
    func getCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        return remoteDataSource.fetchCharacters(page: page)
    }
}
