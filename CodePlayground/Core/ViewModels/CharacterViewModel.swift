//
//  CharacterViewModel.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation

class CharacterViewModel: ObservableObject, Codable {
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
}
