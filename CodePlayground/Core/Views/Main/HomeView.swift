//
//  HomeView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct HomeView: View {
    @State var showCreatingProject: Bool = false
    @State var showSearch: Bool = false
    @State var searchText: String = ""
    @State var resetRotations: Bool = false
    @State var selectedProjectId: String? = nil
    @EnvironmentObject var userViewModel: UserViewModel

    var filteredProjects: [ProjectViewModel] {
        if searchText.isEmpty {
            return userViewModel.currentUser?.projects ?? []
        } else {
            return userViewModel.currentUser?.projects.filter { $0.project.name.localizedCaseInsensitiveContains(searchText) } ?? []
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(showSearch: $showSearch, searchText: $searchText)
                    .frame(height: 50)
                    .onTapGesture {
                        resetRotations.toggle()
                    }
                ZStack(alignment: .bottomTrailing) {
                    GeometryReader { geometry in
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: geometry.size.width * 0.4))], spacing: 90) {
                                ForEach(filteredProjects) { playground in
                                    PlaygroundPreview(
                                        width: geometry.size.width * 0.7,
                                        height: geometry.size.height * 1.6,
                                        deleteProject: {
                                            Task {
                                                await userViewModel.deleteProject(byID: playground.getID())
                                            }
                                        },
                                        project: playground,
                                        resetRotation: $resetRotations,
                                        isSelected: selectedProjectId == playground.project.id,
                                        onSelect: {
                                            selectedProjectId = playground.project.id
                                        }
                                    )
                                }
                            }
                            .padding(.top, 50)
                        }
                        .scrollIndicators(.hidden)
                    }
                    HStack {
                        Spacer()
                        Button(action: { showCreatingProject.toggle() }, label: {
                            Image(systemName: "cross.fill")
                                .font(.system(size: 25))
                                .foregroundStyle(.white)
                                .background(
                                    Circle()
                                        .foregroundStyle(.orange)
                                        .frame(width: 50, height: 50)
                                        .overlay(content: {
                                            Circle()
                                                .stroke()
                                                .foregroundStyle(.white)
                                        })
                                )
                        })
                    }
                    .padding(.bottom)
                }
            }
        }
        .sheet(isPresented: $showCreatingProject, content: {
            CreatingProjectView(close: { showCreatingProject.toggle() })
        })
    }
}

#Preview {
    HomeView()
}
