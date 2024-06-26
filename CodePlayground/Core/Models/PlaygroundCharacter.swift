//
//  PlaygroundCharacter.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation

class PlaygroundCharacter: Identifiable, Codable {
    var id: String
    var spriteUrl: URL
    var characterName: String
    var isHide: Bool = false
    var xPosition: CGFloat = 0
    var yPosition: CGFloat = 0
    var size: CGFloat = 100
    var rotationEffect: CGFloat = 0
    var codeBlocks: [CodeBlockViewModel] = []

    init(spriteUrl: URL, characterName: String) {
        self.id = UUID().uuidString
        self.spriteUrl = spriteUrl
        self.characterName = characterName
    }
}

extension PlaygroundCharacter {
    static var MOCK_CHARACTER = PlaygroundCharacter(spriteUrl: URL(string: "gs://codeplayground-1c9e8.appspot.com/characters/bird.png")!, characterName: "bird")
}
