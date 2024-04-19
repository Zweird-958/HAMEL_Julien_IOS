//
//  AuthView.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack {
            SignIn()
            Divider()
            SignUp()
        }
    }
}

#Preview {
    AuthView()
}
