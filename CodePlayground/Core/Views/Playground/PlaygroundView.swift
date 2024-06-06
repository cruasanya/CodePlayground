//
//  PlaygroundView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 01.06.2024.
//

import SwiftUI

struct PlaygroundView: View {
    @State var showCodeView: Bool = true
    @Environment(\.dismiss) var dismiss
    @ObservedObject var playground: ProjectViewModel

    var body: some View {
        VStack (spacing: 0){
            ZStack {
                Color.orange
                    .ignoresSafeArea()
                Text(playground.getName())
                HStack {
                    Button(action: {
                        //save
                        dismiss()
                    }, label: {
                        Image(systemName: "chevron.backward")
                    })
                    Button(action: {
                        //save
                    }, label: {
                        Image(systemName: "tray.and.arrow.down")
                    })
                    Spacer()

                    Spacer()
                    if !showCodeView {
                        Button(action: {

                        }, label: {
                            Image(systemName: "arrowtriangle.forward.fill")
                                .foregroundStyle(.green)
                        })
                    }
                    Toggle(showCodeView ? "Scene" : "Code",isOn: $showCodeView)
                    .toggleStyle(.button)
                    .foregroundStyle(.purple)
                    .opacity(0.8)
                    Button(action: {

                    }, label: {
                        Image(systemName: "photo")
                            .foregroundStyle(.brown)
                    })
                }
            }
            .font(.system(.largeTitle, weight: .bold))
            .frame(height: 50)
            .buttonStyle(PlainButtonStyle())
            Divider()

            HStack {
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
                Spacer()
                if showCodeView {
                    CodeView()
                } else {
                    SceneView()
                }
                Spacer()
                VStack {
                    Spacer()
                    ScrollView {
                        Button(action: {
                            //add character
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                        })
                        .buttonStyle(PlainButtonStyle())
                        ForEach(playground.getCharacters()) { character in
                            Image(character.getSprite())
                                .resizable()
                                .frame(width: 70, height: 70)
                        }
                    }
                    .scrollIndicators(.hidden)
                    Spacer()
                }
                .background(
                    Color.orange
                )

            }
        }
    }
}

#Preview {
    PlaygroundView(playground: ProjectViewModel(project: PlaygroundProject(name: "hello")))
}
