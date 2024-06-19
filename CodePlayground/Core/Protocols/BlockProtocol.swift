//
//  Protoc.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import Foundation

protocol BlockProtocol: Identifiable, Codable {
    var id: String { get }
    var shape: BlockShapeType { get set }
    var category: BlockCategory { get set }
}
