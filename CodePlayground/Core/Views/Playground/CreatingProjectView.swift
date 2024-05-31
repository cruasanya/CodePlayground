//
//  CreatingProjectView.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import SwiftUI

struct CreatingProjectView: View {
    var close: () -> Void

    var body: some View {
        Button {
            close()
        } label: {
            Text("Close")
        }

    }
}

#Preview {
    CreatingProjectView(close: {})
}
