//
//  InputView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct InputView: View {
    @Binding var text:String
    let title: String
    let placeholder:String
    var isSecureField = false


    var body: some View {
        VStack(alignment: .leading,spacing: 12){
            Text(title)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .font(.footnote)

            if isSecureField{
                SecureField(placeholder,text: $text)
                    .font(.system(size:14))
            }else{
                TextField(placeholder,text: $text)
                    .font(.system(size:14))
            }
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email addres", placeholder: "name@example.com")
}
