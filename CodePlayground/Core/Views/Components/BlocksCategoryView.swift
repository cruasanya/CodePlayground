//
//  BlocksCategoryView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 06.06.2024.
//

import SwiftUI

struct BlocksCategoryView: View {
    var name: String
    var color: Color

    var body: some View {
        Rectangle()
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 70)
            .foregroundStyle(.orange)
            .overlay {
                VStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 20, height: 20)
                        .foregroundStyle(color)
                    Text(name)
                        .bold()
                }
            }

    }
}

#Preview {
    BlocksCategoryView(name: "Name", color: .green)
}
