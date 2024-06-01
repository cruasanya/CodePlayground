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
    @State var project: ProjectViewModel
    @State var rotationDegrees: Double = 0
    @Binding var resetRotation: Bool

    var body: some View {
        VStack(alignment: .center) {
            if rotationDegrees == 0 {
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
            } else {
                HStack {
                    NavigationLink {
                        PlaygroundView()
                    } label: {
                        VStack {
                            Image(systemName: "play")
                            Text("Open")
                        }
                        .font(.system(size: 40, weight: .bold))
                        .background(
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(style: .init(lineWidth: 4))
                                .frame(width: width * 0.25, height: width * 0.25)
                        )

                    }
                    Button(action: {}, label: {
                        VStack{
                            Image(systemName: "trash")
                            Text("Delete")
                        }
                        .font(.system(size: 40, weight: .bold))
                        .background(
                            RoundedRectangle(cornerRadius: 5.0)
                                .stroke(style: .init(lineWidth: 4))
                                .frame(width: width * 0.25, height: width * 0.25)
                        )
                    })
                    .padding(.leading, 30)
                }
                .padding(.leading, 10)
                .buttonStyle(PlainButtonStyle())
                .rotation3DEffect(
                    Angle(degrees: rotationDegrees),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(.orange)
                .frame(width: width * 0.6, height: height * 0.5)
        )
        .rotation3DEffect(
            Angle(degrees: rotationDegrees),
            axis: (x: 1.0, y: 0.0, z: 0.0)
        )
        .onTapGesture {
            withAnimation(.easeInOut) {
                if rotationDegrees == 0 {
                    rotationDegrees = 180
                } else {
                    rotationDegrees = 0
                }
            }
        }
        .onChange(of: resetRotation) {
            withAnimation(.easeInOut) {
                rotationDegrees = 0
            }
        }

    }

}

#Preview {
    PlaugroundPreview(width: 400, height: 300, project: ProjectViewModel(project: PlaygroundProject(name: "hello")), resetRotation: .constant(false))
}
