//
//  PlaugroundPreview.swift
//  CodePlayground
//
//  Created by Александр Новиков on 31.05.2024.
//

import SwiftUI

struct PlaugroundPreview: View {
    var width: CGFloat
    var height: CGFloat
    @ObservedObject var project: ProjectViewModel
    var body: some View {

            VStack {
                if project.getBackground() == "" {
                    Rectangle()
                        .frame(width: width * 0.5, height: height * 0.3)
                } else {
                    Image(project.getBackground())
                        .resizable()
                        .scaledToFit()
                        .frame(width: width * 0.5, height: height * 0.2)
                }
                Text(project.getName())
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .font(.largeTitle)
                    .bold()
                    .frame(width: width * 0.56)
            }
            .background(
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundStyle(.orange)
                    .frame(width: width * 0.6, height: height * 0.5)
            )

    }

}

#Preview {
    PlaugroundPreview(width: 400, height: 300, project: ProjectViewModel(project: PlaygroundProject(name: "hello")))
}
