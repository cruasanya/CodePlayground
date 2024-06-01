//
//  CodePlaygroundProject.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import Foundation


class PlaygroundProject: Identifiable, Codable {
    var id: String
    var name: String
    var characters: [CharacterViewModel] = [CharacterViewModel(character: .MOCK_CHARACTER)]
    var backgroudName: String = ""

    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
