//
//  CreatingProjectView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct CreatingProjectView: View {
    var close: () -> Void
    @State var projectName: String = ""
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        VStack {
            InputView(text: $projectName, title: "Project Name", placeholder: "Input project name")
            HStack {
                Button {
                    Task {
                        await userViewModel.createProject(name: projectName)
                    }
                } label: {
                    Text("Add")
                }
                Button {
                    close()
                } label: {
                    Text("Close")
                }
            }
        }

    }
}

#Preview {
    CreatingProjectView(close: {})
}
