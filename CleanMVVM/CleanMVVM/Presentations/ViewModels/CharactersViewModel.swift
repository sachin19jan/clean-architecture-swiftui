//
//  CharactersViewModel.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI
import Combine

/// A ViewModel that manages the logic and state associated with fetching and displaying a list of characters.
class CharactersViewModel: ObservableObject {
    
    /// A published array of `Character` objects representing the characters to be displayed.
    @Published var characters: [Character] = []
    
    /// A published Boolean value indicating whether character data is currently being loaded.
    @Published var isLoading = false
    
    /// A published optional string that holds an error message if loading characters fails.
    @Published var errorMessage: String? = nil
    
    /// A published Boolean value indicating whether there is more data to load for pagination.
    @Published var hasMoreData = true
    
    /// A variable that tracks the current page for pagination.
    var currentPage = 1
    
    /// A private set of cancellable objects used to manage Combine subscriptions.
    private var cancellables = Set<AnyCancellable>()
    
    /// A protocol-conforming object responsible for fetching character data.
    let fetchCharactersUseCase: FetchCharactersUseCaseProtocol
    
    /// Initializes a new instance of `CharactersViewModel` with a given `FetchCharactersUseCaseProtocol`.
    /// - Parameter fetchCharactersUseCase: An optional custom implementation of the `FetchCharactersUseCaseProtocol`.
    ///   The default is `FetchCharactersUseCase()`.
    init(fetchCharactersUseCase: FetchCharactersUseCaseProtocol = FetchCharactersUseCase()) {
        self.fetchCharactersUseCase = fetchCharactersUseCase
    }
    
    /// Loads more characters from the current page, appending them to the existing `characters` array.
    func loadMoreCharacters() {
        // Ensure no loading is in progress and there is still more data to load.
        guard !isLoading && hasMoreData else { return }
        
        // Set loading state to true and reset error message
        isLoading = true
        errorMessage = nil
        
        // Execute the use case to fetch character data for the current page
        fetchCharactersUseCase.execute(page: currentPage)
            .sink(receiveCompletion: { [weak self] completion in
                // Update loading state and handle errors
                self?.isLoading = false
                if case .failure(let error) = completion {
                    self?.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] newCharacters in
                guard let self = self else { return }
                
                // If no new characters, stop further pagination.
                if newCharacters.isEmpty {
                    self.hasMoreData = false
                } else {
                    // Append new characters to the existing list and increment the current page
                    self.characters.append(contentsOf: newCharacters)
                    self.currentPage += 1
                }
            })
            .store(in: &cancellables) // Store the subscription in cancellables
    }
}
