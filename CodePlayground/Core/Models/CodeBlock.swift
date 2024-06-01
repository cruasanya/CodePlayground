//
//  CodeBlock.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation

class CodeBlock: Identifiable, Codable {
    var id: String
    var blockType: BlockType

    init(type: BlockType) {
        self.id = UUID().uuidString
        self.blockType = type
    }
}

enum BlockType: String, Codable {
    case start = "Start"
}
