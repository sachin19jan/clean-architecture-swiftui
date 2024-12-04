//
//  CharacterRow.swift
//  CleanMVVM
//
//  Created by sachin bhardwaj on 2024-11-30.
//

import SwiftUI
///  displays a row of character information, including the character's image, name, and species.
struct CharacterRow: View {
    
    let character: Character
    
    var body: some View {
        HStack {
            ImageView(urlString: character.image)
            VStack(alignment: .leading) {
                Text(character.name).font(.headline)
                Text(character.species).font(.subheadline)
            }
        }
    }
}


// MARK: - Preview
struct CharacterRow_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRow(character: Character(id: 1, name: "Sachin Bhardwaj", status: "Alive", species: "Human", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", gender: "Male"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
