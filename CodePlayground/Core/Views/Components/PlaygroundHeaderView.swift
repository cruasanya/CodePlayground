//
//  PlaygroundHeaderView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 19.06.2024.
//

import SwiftUI

struct PlaygroundHeaderView: View {
    var save: () -> Void
    @Binding var showCodeView: Bool
    @Environment(\.dismiss) var dismiss
    @ObservedObject var playground: ProjectViewModel
    
    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            Text(playground.getName())
            HStack {
                Button(action: {
                    save()
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.backward")
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
    }
}

#Preview {
    PlaygroundHeaderView(save: {}, showCodeView: .constant(true), playground: ProjectViewModel(project: PlaygroundProject(name: "hello")))
}
