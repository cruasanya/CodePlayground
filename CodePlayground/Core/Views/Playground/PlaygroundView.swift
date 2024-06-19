//
//  PlaygroundView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 01.06.2024.
//

import SwiftUI

struct PlaygroundView: View {
    @State var showCodeView: Bool = true
    @ObservedObject var playground: ProjectViewModel

    var body: some View {
        VStack (spacing: 0){
            PlaygroundHeaderView(showCodeView: $showCodeView, playground: playground)
            Divider()
            HStack {
                BlocksScrollView()
                Spacer()
                if showCodeView {
                    CodeView()
                } else {
                    SceneView(background: playground.getBackground(), characters: playground.getCharacters())
                }
                Spacer()
                CharactersScrollView(playground: playground)

            }
        }
    }
}

#Preview {
    PlaygroundView(playground: ProjectViewModel(project: PlaygroundProject(name: "hello")))
}
