//
//  Character.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//


/// A struct representing a character with properties that describe its attributes.
struct Character: Identifiable, Decodable, Equatable {
    /// A unique identifier for the character.
    let id: Int
    
    /// The name of the character.
    let name: String
    
    /// The current status of the character (e.g., "Alive", "Dead").
    let status: String
    
    /// The species of the character (e.g., "Human", "Alien").
    let species: String
    
    /// The URL string of the character's image.
    let image: String
    
    /// The gender of the character (e.g., "Male", "Female", "Non-binary").
    let gender: String
}

