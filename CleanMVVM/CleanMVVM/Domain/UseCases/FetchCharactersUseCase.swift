//
//  FetchCharactersUseCase.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import Combine

/// This class implements the use case for fetching character data.
/// interacts with the `CharacterRepositoryProtocol` to retrieve character data and provides a method
/// for executing the use case in a reactive manner using Combine.
class FetchCharactersUseCase: FetchCharactersUseCaseProtocol {
    
    /// The repository used to retrieve character data.
    private let repository: CharacterRepositoryProtocol
    
    /// Initializes a new instance of `FetchCharactersUseCase`.
    /// - Parameter repository: An optional parameter to inject a custom repository. Defaults to an instance of `CharacterRepository`.
    init(repository: CharacterRepositoryProtocol = CharacterRepository()) {
        self.repository = repository
    }
    
    /// Executes the use case to fetch a list of characters from the repository.
    /// - Parameter page: The page number to request characters from. Used for pagination.
    /// - Returns: A publisher that emits an array of `Character` objects or an `Error` if the request fails.
    func execute(page: Int) -> AnyPublisher<[Character], Error> {
        // Calls the `getCharacters(page:)` method from the repository and returns its publisher.
        return repository.getCharacters(page: page)
    }
}

