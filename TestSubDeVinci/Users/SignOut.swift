//
//  SignOut.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import SwiftUI

struct SignOut: View {
    @EnvironmentObject var userModel: UserModel
    @EnvironmentObject var navigationModel: NavigationModel
    
    var body: some View {
        Button(action: {
            userModel.user = nil
            navigationModel.path.append("auth")
        }){
            Text("Se déconnecter")
        }
    }
}

#Preview {
    SignOut()
}
