//
//  ImageView.swift
//  Character
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI
import SDWebImageSwiftUI

/// This view uses the `WebImage` component to load and display an image
struct ImageView: View {
    /// The URL string of the image.
    let urlString: String
   
    var body: some View {
        WebImage(url: URL(string: urlString))
            .resizable()
            .scaledToFit()
            .frame(width: Constants.Numbers.imageSize, height: Constants.Numbers.imageSize) // Sets the dimensions of the image.
            .cornerRadius(Constants.Numbers.imageRadius) // Set the cornerRadius of the image.
    }
}

#Preview {
    ImageView(urlString: "https://rickandmortyapi.com/api/character/avatar/21.jpeg")
}
