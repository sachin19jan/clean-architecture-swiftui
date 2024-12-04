//
//  CharactersResponse.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//


/// A struct representing the response from the Rick and Morty API for a list of characters.
struct CharactersResponse: Decodable {
    
    /// An array of Character objects that represent the individual characters returned by the API.
    let results: [Character]
}

