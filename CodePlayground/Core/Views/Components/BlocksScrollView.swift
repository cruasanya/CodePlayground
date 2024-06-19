//
//  BlocksScrollView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 19.06.2024.
//

import SwiftUI

struct BlocksScrollView: View {
    var body: some View {
        ZStack {
            ScrollView {
                BlocksCategoryView(name: "Motion", color: .cyan)
                BlocksCategoryView(name: "Events", color: .green)
                BlocksCategoryView(name: "Sound", color: .indigo)
                BlocksCategoryView(name: "Looks", color: .purple)
                BlocksCategoryView(name: "Control", color: .yellow)
                BlocksCategoryView(name: "Sensing", color: .blue)
                BlocksCategoryView(name: "Operators", color: .red)
            }
            .scrollIndicators(.hidden)
            .background(
                Color.orange
            )
        }
    }
}

#Preview {
    BlocksScrollView()
}
