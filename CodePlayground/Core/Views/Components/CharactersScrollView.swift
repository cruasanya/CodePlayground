//
//  CharactersScrollView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 19.06.2024.
//

import SwiftUI

struct CharactersScrollView: View {
    @ObservedObject var playground: ProjectViewModel

    var body: some View {
        VStack {
            Spacer()
            ScrollView {
                Button(action: {
                    //add character
                }, label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                })
                .buttonStyle(PlainButtonStyle())
                ForEach(playground.getCharacters()) { character in
                    Image(character.getSprite())
                        .resizable()
                        .frame(width: 70, height: 70)
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
    CharactersScrollView(playground: ProjectViewModel(project: PlaygroundProject(name: "hello")))
}
