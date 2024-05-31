//
//  LogInView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//
import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    VStack(spacing: 24) {
                        InputView(text: $email,
                                  title: "Email addres",
                                  placeholder: "name@example.com")
                        .autocapitalization(.none)
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "enter your password",
                                  isSecureField: true)
                    }
                    .padding(.horizontal)

                    Button {
                        Task{
                            try await userViewModel.signIn(
                                withEmail: email,
                                password: password)
                        }
                    } label: {
                        HStack{
                            Text("SIGN IN")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }
                        .foregroundStyle(.white)
                        .frame(width: geometry.size.width, height: 48)
                    }
                    .background(Color(.orange))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1 : 0.5)
                    .cornerRadius(10)
                    .padding(.top,1)

                    Spacer()

                    NavigationLink{
                        RegistrationView().toolbar(.hidden)
                    }label: {
                        HStack{
                            Text("Don't have an account?")
                            Text("Sign up")
                                .fontWeight(.semibold)
                        }
                        .foregroundStyle(.orange)
                    }
                }
            }
        }
    }
}

extension LogInView : AuthentificationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LogInView()
}
