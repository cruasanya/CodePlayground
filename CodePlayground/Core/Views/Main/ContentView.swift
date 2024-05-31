//
//  ContentView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    var body: some View {
        Group {
            if userViewModel.userSession != nil {
                HomeView()
            } else {
                LogInView()
            }
        }
    }
}

#Preview {
    ContentView()
}
