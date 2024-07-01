//
//  PlaygroundView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 01.06.2024.
//

import SwiftUI

struct PlaygroundView: View {
    var save: () -> Void
    @State var showCodeView: Bool = true
    @State var showCharactersList: Bool = false
    @State var selectedCharacter: PlaygroundCharacter = PlaygroundCharacter.MOCK_CHARACTER
    @ObservedObject var playground: ProjectViewModel

    var body: some View {
        VStack (spacing: 0){
            PlaygroundHeaderView(save: {save()}, showCodeView: $showCodeView, playground: playground)
            Divider()
            HStack {
                BlocksScrollView()
                Spacer()
                if showCodeView {
                    CodeView()
                } else {
                    SceneView(background: playground.getBackground(), characters: $playground.project.characters)
                }
                Spacer()
                CharactersScrollView(showCharactersList: $showCharactersList, characters: $playground.project.characters)

            }
        }
        .sheet(isPresented: $showCharactersList, content: {
            AddCharacterView(
                addCharater: {
                    playground.addCharacter(character: CharacterViewModel(character: selectedCharacter))
                    showCharactersList.toggle()
                }, 
                selectedCharacter: $selectedCharacter)
        })
    }
}

#Preview {
    PlaygroundView(save: {}, playground: ProjectViewModel(project: PlaygroundProject(name: "hello")))
}
