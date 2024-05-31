//
//  HeaderView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSearch: Bool
    @Binding var searchText: String

    var body: some View {
        ZStack {
            Color.orange
                .ignoresSafeArea()
            HStack {

                Spacer()
                Text(showSearch ? "" : "My projects")
                Spacer()

            }
            .overlay(content: {
                HStack{
                    Button {
                        withAnimation(.easeIn) {
                            showSearch = true
                        }
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    if showSearch == true {
                        TextField("Search",text: $searchText)
                        Button {
                            searchText = ""
                            withAnimation(.easeOut){
                                showSearch = false
                            }
                        } label: {
                            Text("Cancel")
                        }

                    } else {
                        Spacer()
                        NavigationLink {
                            UserView()
                        } label: {
                            Image(systemName: "person.fill")
                        }
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gearshape.fill")
                        }
                    }
                }
            })
            .buttonStyle(PlainButtonStyle())
            .font(.largeTitle)
            .bold()
        }
    }
}

#Preview {
    HeaderView(showSearch: .constant(false), searchText: .constant(""))
}
