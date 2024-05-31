//
//  UserView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct UserView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        Button {
            userViewModel.signOut()
        } label: {
            Text("LogOut")
        }

    }
}

#Preview {
    UserView()
}
