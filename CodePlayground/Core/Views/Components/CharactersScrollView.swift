//
//  CharactersScrollView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 19.06.2024.
//

import SwiftUI

struct CharactersScrollView: View {
    @Binding var showCharactersList: Bool
    @Binding var characters: [CharacterViewModel]

    var body: some View {
        VStack {
            Spacer()
            ScrollView {
                Button(action: {
                    showCharactersList.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                .buttonStyle(PlainButtonStyle())
                ForEach(characters) { character in
                    AsyncImage(url: character.getSprite()) { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 70, height: 70)
                    .padding(.leading, 10)
                }
            }
            .scrollIndicators(.hidden)
            Spacer()
        }
        .background(
            Color.orange
        )
    }
}

#Preview {
    CharactersScrollView(showCharactersList: .constant(false), characters: .constant([]))
}
