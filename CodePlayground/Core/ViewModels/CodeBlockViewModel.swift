//
//  CodeBlockViewModel.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import Foundation

class CodeBlockViewModel: ObservableObject, Codable {
    @Published var codeBlock: CodeBlock

    enum CodingKeys: String, CodingKey {
        case codeBlock
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        codeBlock = try container.decode(CodeBlock.self, forKey: .codeBlock)
    }

    init(codeBlock: CodeBlock) {
        self.codeBlock = codeBlock
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(codeBlock, forKey: .codeBlock)
    }
}
