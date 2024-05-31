//
//  CodePlaygroundProject.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import Foundation


class CodePlaygroundProject: Identifiable, Codable {
    var id: String
    var name: String
    var characters: [PlaygroundCharacter] = []
    var backgroudName: String

    init(id: String, name: String, backgroudName: String) {
        self.id = id
        self.name = name
        self.backgroudName = backgroudName
    }
}
