//
//  CharacterViewModel.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation

class CharacterViewModel: ObservableObject, Codable, Identifiable {
    @Published var character: PlaygroundCharacter

    enum CodingKeys: String, CodingKey {
        case character
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        character = try container.decode(PlaygroundCharacter.self, forKey: .character)
    }

    init(character: PlaygroundCharacter) {
        self.character = character
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(character, forKey: .character)
    }

    func getSprite() -> URL {
        return character.spriteUrl
    }

    func getSize() -> CGFloat {
        return character.size
    }

    func getX() -> CGFloat {
        return CGRect().midX + character.xPosition
    }

    func getY() -> CGFloat {
        return CGRect().midY + character.yPosition
    }

    func getRotation() -> CGFloat {
        return character.rotationEffect
    }

    func getName() ->  String {
        return character.characterName
    }

    func getVisibility() -> Bool {
        return character.isHide 
    }

    func getId() -> String {
        return character.id
    }

    func updatePosition(x: CGFloat, y: CGFloat) {
        character.xPosition = x
        character.yPosition = y
    }
}
