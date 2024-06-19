//
//  CanvasView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 06.06.2024.
//

import SwiftUI

struct SceneView: View {
    var background: String
    @State var characters: [CharacterViewModel]
    @State var xPosition: CGFloat = 0
    @State var yPosition: CGFloat = 0

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(characters) { character in
                    Image(character.getSprite())
                        .resizable()
                        .frame(width: character.getSize(), height: character.getSize())
                        .position(x: geometry.size.width/2 + xPosition, y: geometry.size.height/2  + yPosition)
                        .onTapGesture {
                            xPosition = character.getX()
                            yPosition = character.getY()
                        }
                        .gesture(
                            DragGesture()
                                .onChanged({ value in
                                    xPosition = value.translation.width + character.getX()
                                    yPosition = value.translation.height + character.getY()
                                })
                                .onEnded({ value in
                                    character.updatePosition(
                                        x: xPosition,
                                        y: yPosition
                                    )
                                    xPosition = character.getX()
                                    yPosition = character.getY()
                                })
                        )

                }
            }
        }
    }
}

#Preview {
    SceneView(background: "", characters: [CharacterViewModel(character: PlaygroundCharacter.MOCK_CHARACTER)])
}
