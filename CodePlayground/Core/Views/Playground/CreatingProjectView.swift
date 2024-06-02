//
//  CreatingProjectView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct CreatingProjectView: View {
    var close: () -> Void
    @State var projectName: String = "My project"
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack {
                Text("Project Name")
                    .font(.title)
                    .bold()
                TextField("Input project name", text: $projectName)
                    .font(.system(size:30))
                Divider()
                HStack {
                    Button {
                        Task {
                            await userViewModel.createProject(name: projectName)
                            close()
                        }
                    } label: {
                        HStack {
                            Spacer()
                            Text("Create")
                            Image(systemName: "plus.circle")
                            Spacer()
                        }
                        .bold()
                        .font(.title)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundStyle(.orange)
                        }
                    }
                    .disabled(projectName == "")
                    Button {
                        close()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Close")
                            Image(systemName: "xmark.circle")
                            Spacer()
                        }
                        .bold()
                        .font(.title)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundStyle(.orange)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    CreatingProjectView(close: {})
}
