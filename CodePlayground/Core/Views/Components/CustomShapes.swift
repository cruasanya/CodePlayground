//
//  CustomShapes.swift
//  CodePlayground
//
//  Created by Александр Новиков on 13.06.2024.
//

import SwiftUI

struct CustomShapes: View {
    var body: some View {
        ZStack(alignment: .center) {
            HStack {
                VStack {
                    SimpleBlockShape(controlPoint: 0, isEnd: false, isStart: true)
                        .frame(width: 184, height: 80)
                        .foregroundStyle(.orange)
                        .overlay {
                            SimpleBlockShape(controlPoint: 0, isEnd: false, isStart: true)
                                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        }
                    SimpleBlockShape(controlPoint: 0, isEnd: false, isStart: false)
                        .frame(width: 184, height: 80)
                        .foregroundStyle(.blue)
                        .overlay {
                            SimpleBlockShape(controlPoint: 0, isEnd: false, isStart: false)
                                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        }
                    SimpleBlockShape(controlPoint: 0, isEnd: true, isStart: false)
                        .frame(width: 184, height: 80)
                        .foregroundStyle(.blue)
                        .overlay {
                            SimpleBlockShape(controlPoint: 0, isEnd: true, isStart: false)
                                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        }

                }

                CompositeBlockShape(controlPoint: 0, isEnd: false)
                    .frame(width: 184, height: 80)
                    .foregroundStyle(.yellow)
                    .overlay {
                        CompositeBlockShape(controlPoint: 0, isEnd: false)
                            .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    }
                CompositeBlockShape(controlPoint: 0, isEnd: true)
                    .frame(width: 184, height: 80)
                    .foregroundStyle(.yellow)
                    .overlay {
                        CompositeBlockShape(controlPoint: 0, isEnd: true)
                            .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                    }
                VStack {
                    OperatorBlockShape(controlPoint: 0, isRound: true)
                        .frame(width: 184, height: 80)
                        .foregroundStyle(.green)
                        .overlay {
                            OperatorBlockShape(controlPoint: 0, isRound: true)
                                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        }
                    OperatorBlockShape(controlPoint: 0, isRound: false)
                        .frame(width: 184, height: 80)
                        .foregroundStyle(.cyan)
                        .overlay {
                            OperatorBlockShape(controlPoint: 0, isRound: false)
                                .stroke(.black, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
                        }
                }
            }
        }
    }
}

#Preview {
    CustomShapes()
}
