//
//  CharacterRemoteDataSource.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import Combine
import SwiftUI

/// This class is responsible for fetching character data from a remote API.
class CharacterRemoteDataSource: CharacterRemoteDataSourceProtocol {
    
    /// Fetches a list of characters from the Rick and Morty API for a given page.
    /// - Parameter page: The page number to fetch characters from. Used in the API endpoint to paginate results.
    /// - Returns: A publisher that emits an array of Character objects or an Error if the request fails.
    /// The publisher emits on the main thread and ensures that the response is properly decoded and returned.
    func fetchCharacters(page: Int) -> AnyPublisher<[Character], Error> {
        // Construct the final URL using the base URL and page number
        guard let url = URL(string: "\(Constants.baseUrl)/?page=\(page)") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: CharactersResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

