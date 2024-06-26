//
//  CharactersListView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 24.06.2024.
//

import SwiftUI

struct AddCharacterView: View {
    var addCharater: () -> Void
    @Binding var selectedCharacter: PlaygroundCharacter
    @StateObject private var imageStorage = ImageStorageViewModel()

    var body: some View {
        List(imageStorage.imageInfos, id: \.self) { imageInfo in
            VStack {
                AsyncImage(url: imageInfo.url) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 200)
                Text(imageInfo.name)
            }
            .onTapGesture {
                selectedCharacter = PlaygroundCharacter(spriteUrl: imageInfo.url, characterName: imageInfo.name)
                addCharater()
            }
        }
        .navigationTitle("Firebase Images")
        .onAppear {
            imageStorage.fetchImages(type: .characters)
        }
        .onDisappear {
            imageStorage.freeSotrage()
        }
    }
}


