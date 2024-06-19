//
//  BlockShapes.swift
//  CodePlayground
//
//  Created by Александр Новиков on 13.06.2024.
//

import Foundation
import SwiftUI

struct SimpleBlockShape: Shape {
    var controlPoint: Double
    var width: Double = 100
    var isEnd: Bool
    var isStart: Bool

    func path(in rect: CGRect) -> Path {
        var pencil = Path()

        pencil.move(to: CGPoint(x: rect.minX, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        if !isStart {
            pencil.addLine(to: CGPoint(x: rect.minX + 20, y: rect.minY))
            pencil.addLine(to: CGPoint(x: rect.minX + 25, y: rect.minY + 15))
            pencil.addLine(to: CGPoint(x: rect.minX + 50, y: rect.minY + 15))
            pencil.addLine(to: CGPoint(x: rect.minX + 55, y: rect.minY))
        } else {
            pencil.addCurve(to: CGPoint(x: rect.minX + 70, y: rect.minY), control1: CGPoint(x: rect.minX, y: rect.minY - 30), control2: CGPoint(x: rect.minX + 70, y: rect.minY - 30))
            pencil.addLine(to: CGPoint(x: rect.minX + 70, y: rect.minY))
        }
        pencil.addLine(to: CGPoint(x: rect.minX + 55 + width, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX + 55 + width, y: rect.minY + 40))
        pencil.addLine(to: CGPoint(x: rect.minX + 55, y: rect.minY + 40))
        if !isEnd {
            pencil.addLine(to: CGPoint(x: rect.minX + 50, y: rect.minY + 55))
            pencil.addLine(to: CGPoint(x: rect.minX + 25, y: rect.minY + 55))
            pencil.addLine(to: CGPoint(x: rect.minX + 20, y: rect.minY + 40))
        }
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 40))
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        pencil.closeSubpath()
        return pencil
    }
}

struct CompositeBlockShape: Shape {
    var controlPoint: Double
    var width: Double = 100
    var height: Double = 1
    var isEnd: Bool


    func path(in rect: CGRect) -> Path {
        var pencil = Path()

        pencil.move(to: CGPoint(x: rect.minX, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX + 20, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX + 25, y: rect.minY + 15))
        pencil.addLine(to: CGPoint(x: rect.minX + 50, y: rect.minY + 15))
        pencil.addLine(to: CGPoint(x: rect.minX + 55, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX + 55 + width, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX + 55 + width, y: rect.minY + 40))
        pencil.addLine(to: CGPoint(x: rect.minX + 70, y: rect.minY + 40))
        pencil.addLine(to: CGPoint(x: rect.minX + 65, y: rect.minY + 55))
        pencil.addLine(to: CGPoint(x: rect.minX + 40, y: rect.minY + 55))
        pencil.addLine(to: CGPoint(x: rect.minX + 35, y: rect.minY + 40))
        pencil.addLine(to: CGPoint(x: rect.minX + 15, y: rect.minY + 40))
        pencil.addLine(to: CGPoint(x: rect.minX + 15, y: rect.minY + 40 + 40 * height))
        pencil.addLine(to: CGPoint(x: rect.minX + 35, y: rect.minY + 40 + 40 * height))
        pencil.addLine(to: CGPoint(x: rect.minX + 40, y: rect.minY + 55 + 40 * height))
        pencil.addLine(to: CGPoint(x: rect.minX + 65, y: rect.minY + 55 + 40 * height))
        pencil.addLine(to: CGPoint(x: rect.minX + 70, y: rect.minY + 40 + 40 * height))
        pencil.addLine(to: CGPoint(x: rect.minX + 55 + width, y: rect.minY + 40 + 40 * height))
        pencil.addLine(to: CGPoint(x: rect.minX + 55 + width, y: rect.minY + 80 + 40 * height))
        if !isEnd {
            pencil.addLine(to: CGPoint(x: rect.minX + 55, y: rect.minY + 80 + 40 * height))
            pencil.addLine(to: CGPoint(x: rect.minX + 50, y: rect.minY + 95 + 40 * height))
            pencil.addLine(to: CGPoint(x: rect.minX + 25, y: rect.minY + 95 + 40 * height))
            pencil.addLine(to: CGPoint(x: rect.minX + 20, y: rect.minY + 80 + 40 * height))
        }
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 80 + 40 * height))
        pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        pencil.closeSubpath()
        return pencil
    }
}

struct OperatorBlockShape: Shape {
    var controlPoint: Double
    var width: Double = 50
    var isRound: Bool


    func path(in rect: CGRect) -> Path {
        var pencil = Path()

        pencil.move(to: CGPoint(x: rect.minX + 10, y: rect.minY))
        pencil.addLine(to: CGPoint(x: rect.minX + 10 + width, y: rect.minY))
        if !isRound {
            pencil.addLine(to: CGPoint(x: rect.minX + 20 + width , y: rect.minY + 10))
            pencil.addLine(to: CGPoint(x: rect.minX + 10 + width, y: rect.minY + 20))
        } else {
            pencil.addCurve(to: CGPoint(x: rect.minX + 10 + width, y: rect.minY + 20), control1: CGPoint(x: rect.minX + 30 + width , y: rect.minY), control2: CGPoint(x: rect.minX + 30 + width, y: rect.minY + 20))
        }
        pencil.addLine(to: CGPoint(x: rect.minX + 10, y: rect.minY + 20))
        if !isRound {
            pencil.addLine(to: CGPoint(x: rect.minX, y: rect.minY + 10))
            pencil.addLine(to: CGPoint(x: rect.minX + 10, y: rect.minY))
        } else {
            pencil.addCurve(to: CGPoint(x: rect.minX + 10 , y: rect.minY), control1: CGPoint(x: rect.minX - 10, y: rect.minY + 20), control2: CGPoint(x: rect.minX - 10, y: rect.minY))
        }
        return pencil
    }
}
#Preview {
    OperatorBlockShape(controlPoint: 0, isRound: true)
        .frame(width: 184, height: 80)
        .foregroundStyle(.green)
        .overlay {
            OperatorBlockShape(controlPoint: 0, isRound: true)
                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
        }
}
