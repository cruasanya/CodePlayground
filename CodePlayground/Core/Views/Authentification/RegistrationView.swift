//
//  RegistrationView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var nickName = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var userViewModel : UserViewModel

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    VStack {
                        InputView(text: $email,
                                  title: "Email addres",
                                  placeholder: "name@example.com")
                            .autocapitalization(.none)
                        InputView(text: $password,
                                  title: "Password",
                                  placeholder: "enter your password",
                                  isSecureField: true)
                        ZStack (alignment:.trailing){
                            InputView(text: $confirmPassword,
                                      title: "Confirm Password",
                                      placeholder: "confirm your password",
                                      isSecureField: true)

                            if !password.isEmpty && !confirmPassword.isEmpty{
                                if password == confirmPassword{
                                    Image(systemName: "checkmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemGreen))
                                } else{
                                    Image(systemName: "xmark.circle.fill")
                                        .imageScale(.large)
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.systemRed))

                                }
                            }
                        }

                    }
                    VStack {
                        InputView(text: $firstName,
                                  title: "First Name",
                                  placeholder: "enter your first name")
                        InputView(text: $lastName,
                                  title: "Lasr Name",
                                  placeholder: "enter your last name")
                        InputView(text: $nickName,
                                  title: "Nickname",
                                  placeholder: "enter your nickname")

                    }
                }
                .padding(.horizontal)
                .padding(.top, 40)

                Button {
                    Task{
                        try await userViewModel.createUser(
                            withEmail: email,
                            password: password,
                            firstName: firstName,
                            lastName: lastName,
                            nickName: nickName
                        )
                    }
                } label: {
                    HStack{
                        Text("SIGN UP")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width, height: 48)
                }
                .background(Color(.orange))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.5)
                .cornerRadius(10)
                .padding(.top, 24)

                Spacer()

                Button {
                    dismiss()
                } label: {
                    HStack{
                        Text("Already have an account?")
                        Text("Sign in")
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.orange)
                }

            }
        }
    }
}


// MARK  : - AuthentificationFormProtocol
extension RegistrationView : AuthentificationFormProtocol{
    var formIsValid: Bool{
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !firstName.isEmpty
        && !lastName.isEmpty
        && confirmPassword == password
    }
}

#Preview {
    RegistrationView()
}
