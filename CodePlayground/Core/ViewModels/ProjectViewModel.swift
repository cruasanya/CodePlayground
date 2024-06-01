//
//  ProjectViewModel.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation

import SwiftUI

class ProjectViewModel: ObservableObject, Codable, Identifiable {
    @Published var project: PlaygroundProject

    enum CodingKeys: String, CodingKey {
        case project
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        project = try container.decode(PlaygroundProject.self, forKey: .project)
    }

    init(project: PlaygroundProject) {
        self.project = project
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(project, forKey: .project)
    }

    func getID() -> String {
        return project.id
    }

    func getName() -> String {
        return project.name
    }

    func getBackground() -> String {
        return project.backgroudName
    }

    func changeName(name: String) {
        project.name = name
    }

}
