//
//  CharactersView.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI

/// CharactersView displays a list of characters with pagination, error handling, and navigation to character details.
struct CharactersView: View {
    @StateObject private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading && viewModel.characters.isEmpty {
                    LoadingView()
                } else if let errorMessage = viewModel.errorMessage {
                    ErrorView(errorMessage: errorMessage)
                } else {
                    CharacterListView(viewModel: viewModel)
                }
            }
            .navigationTitle(Constants.Screen.defaultNavigationTitle)
            .onAppear {
                if viewModel.characters.isEmpty {
                    viewModel.loadMoreCharacters()
                }
            }
        }
    }
}

/// This view shows a `ProgressView` to indicate that characters are being loaded.
struct LoadingView: View {
    var body: some View {
        ProgressView()
    }
}

// This view shows an error message when there is an issue during the data fetch.
struct ErrorView: View {
    let errorMessage: String

    var body: some View {
        Text("Error: \(errorMessage)")
            .foregroundColor(.red)
    }
}

/// This view displays a list of fetched characters and handles pagination and loading more characters.
struct CharacterListView: View {
    @ObservedObject var viewModel: CharactersViewModel

    var body: some View {
        List {
            ForEach(viewModel.characters) { character in
                CharacterRowView(character: character)
                    .accessibilityIdentifier("CharacterCell_\(character.id)")
                    .onAppear {
                        if character == viewModel.characters.last {
                            viewModel.loadMoreCharacters()
                        }
                    }
            }

            if viewModel.isLoading {
                LoadingIndicatorView()
            }
        }
        .accessibilityIdentifier("CharactersList")
    }
}

/// This view displays each individual character row with a navigation link to their detailed view.
struct CharacterRowView: View {
    let character: Character

    var body: some View {
        NavigationLink(
            destination: CharacterDetailView(viewModel: CharacterDetailViewModel(character: character)),
            label: {
                CharacterRow(character: character)
            }
        )
    }
}

// Show loading indicator if characters are being loaded and no characters have been fetched yet.
struct LoadingIndicatorView: View {
    var body: some View {
        HStack {
            Spacer()
            ProgressView("Loading more...")
            Spacer()
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCharacters = [
            Character(id: 1, name: "Sachin Bhardwaj", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male"),
            Character(id: 2, name: "Ranjit Singh", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", gender: "Male")
        ]

        let viewModel = CharactersViewModel()
        viewModel.characters = sampleCharacters

        return CharactersView()
            .environmentObject(viewModel)
    }
}
