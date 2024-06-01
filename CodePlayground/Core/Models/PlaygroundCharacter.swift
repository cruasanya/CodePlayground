//
//  PlaygroundCharacter.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation

class PlaygroundCharacter: Identifiable, Codable {
    var id: String
    var spriteName: String
    var characterName: String
    var isHide: Bool = false
    var xPosition: Int = 0
    var yPosition: Int = 0
    var size: Int = 100
    var rotationEffect = 0
    var codeBlocks: [CodeBlockViewModel] = []

    init(spriteName: String, characterName: String) {
        self.id = UUID().uuidString
        self.spriteName = spriteName
        self.characterName = characterName
    }
}

extension PlaygroundCharacter {
    static var MOCK_CHARACTER = PlaygroundCharacter(spriteName: "MOCK", characterName: "Name")
}
