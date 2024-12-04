//
//  containing.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//


import Foundation
import SwiftUI

/// A struct containing all the magic numbers and spacing constants used throughout the app.
struct Constants {
    
    static let baseUrl: String = "https://rickandmortyapi.com/api/character"
    
    // MARK: - Spacing Constants
    struct Spacing {
        static let small: CGFloat = 20
    }
    
    // MARK: - Magic Number Constants
    struct Numbers {
        static let imageSize: CGFloat = 50  // Used for image dimensions
        static let imageRadius: CGFloat = 8  // Used for image cornor
    }
    
    
    // MARK: - Padding Constants
    struct Padding {
        static let largePadding: CGFloat = 200
    }
    
    // MARK: - Miscellaneous Constants
    struct Screen {
        static let defaultNavigationTitle = "Characters"
        static let characterStatus = "Alive"
        static let characterGender = "Male"
    }
}
