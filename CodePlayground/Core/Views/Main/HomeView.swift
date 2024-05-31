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
    @EnvironmentObject var userViewModel: UserViewModel

    let columns = [
        GridItem(.adaptive(minimum: 200))
    ]

    var body: some View {
        NavigationStack {
            VStack {
                HeaderView(showSearch: $showSearch, searchText: $searchText)
                    .frame(height: 50)

                ZStack(alignment: .bottomTrailing ) {

                    GeometryReader { geometry in
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: geometry.size.width * 0.4))], spacing: 90) {
                                if let projects = userViewModel.currentUser?.projects {
                                    ForEach(projects) { project in
                                        PlaugroundPreview(width: geometry.size.width * 0.7, height: geometry.size.height * 1.6 , project: project)

                                    }
                                }
                            }
                            .padding(.top,50)
                        }
                        .scrollIndicators(.hidden)
                    }

                    HStack{
                        Spacer()
                        Button(action: {showCreatingProject.toggle()}, label: {
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
            CreatingProjectView(close: {showCreatingProject.toggle()})
        })
    }
}

#Preview {
    HomeView()
}

//PlaugroundPreview(width: geometry.size.width * 0.7, height: geometry.size.height * 1.6 , project: playground)
