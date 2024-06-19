//
//  CodeBlock.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation
import SwiftUI

class CodeBlock: BlockProtocol {
    var id: String
    var shape: BlockShapeType
    var category: BlockCategory

    init(shape: BlockShapeType, category: BlockCategory) {
        self.id = UUID().uuidString
        self.shape = shape
        self.category = category
    }

    private enum CodingKeys: String, CodingKey {
        case id, shape, category
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        shape = try container.decode(BlockShapeType.self, forKey: .shape)
        category = try container.decode(BlockCategory.self, forKey: .category)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(shape, forKey: .shape)
        try container.encode(category, forKey: .category)
    }
}

class CompositeCodeBlock: BlockProtocol {
    var id: String
    var shape: BlockShapeType
    var category: BlockCategory
    var internalBlocks: [any BlockProtocol] = []

    init(id: String, shape: BlockShapeType, category: BlockCategory) {
        self.id = id
        self.shape = shape
        self.category = category
    }

    private enum CodingKeys: String, CodingKey {
        case id, shape, category, internalBlocks
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        shape = try container.decode(BlockShapeType.self, forKey: .shape)
        category = try container.decode(BlockCategory.self, forKey: .category)
        var blocksContainer = try container.nestedUnkeyedContainer(forKey: .internalBlocks)
        while !blocksContainer.isAtEnd {
            let block = try blocksContainer.decode(AnyCodableBlock.self).block
            internalBlocks.append(block)
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(shape, forKey: .shape)
        try container.encode(category, forKey: .category)
        var blocksContainer = container.nestedUnkeyedContainer(forKey: .internalBlocks)
        for block in internalBlocks {
            let anyBlock = AnyCodableBlock(block: block)
            try blocksContainer.encode(anyBlock)
        }
    }

}

struct AnyCodableBlock: Codable {
    let block: any BlockProtocol

    private enum CodingKeys: String, CodingKey {
        case type, data
    }

    init(block: any BlockProtocol) {
        self.block = block
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        switch type {
        case "CodeBlock":
            block = try container.decode(CodeBlock.self, forKey: .data)
        case "CompositeCodeBlock":
            block = try container.decode(CompositeCodeBlock.self, forKey: .data)
        default:
            throw DecodingError.dataCorruptedError(forKey: .type, in: container, debugDescription: "Unknown block type")
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let block = block as? CodeBlock {
            try container.encode("CodeBlock", forKey: .type)
            try container.encode(block, forKey: .data)
        } else if let block = block as? CompositeCodeBlock {
            try container.encode("CompositeCodeBlock", forKey: .type)
            try container.encode(block, forKey: .data)
        } else {
            throw EncodingError.invalidValue(block, EncodingError.Context(codingPath: encoder.codingPath, debugDescription: "Unknown block type"))
        }
    }
}

enum BlockShapeType: Codable {
    case start
    case middle
    case end
    case composite
    case compositeEnd
    case trianlgeOperator
    case roundedOperator
}

enum BlockCategory: Codable {
    case motion
    case looks
    case sound
    case events
    case control
    case sensing
    case operators
    case variables
}
