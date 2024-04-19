//
//  SignIn.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import SwiftUI

struct SignIn: View {
    @State var pseudo: String = ""
    @State var password: String = ""
    @State var showAlert = false
    @State var alertMessage = ""
    @EnvironmentObject var navigationModel: NavigationModel
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        Form{
            TextField(
                "Pseudo",
                text: $pseudo
            )
            SecureField(
                "Mot de passe",
                text: $password
            )
            Button(action: {
                signIn()
            },
                   label: {
                Text(
                    "Se connecter"
                )
            })
        }
        .alert(
            isPresented: $showAlert
        ){
            Alert(
                title: Text(
                    alertMessage
                )
            )
        }
    }
    
    func signIn(){
        if pseudo.isEmpty || password.isEmpty {
            showAlert = true
            alertMessage = "Veuillez insérer votre pseudo et votre mot de passe."
            
            return
        }
        
        let currentUser = userModel.getUser(pseudo: pseudo, password: password)
        
        if currentUser == nil {
            showAlert = true
            alertMessage = "Identifiants invalide"
            
            return
        }
        
        userModel.user = currentUser
        
        if userModel.testIsDone() {
            navigationModel.path.append("mark")
            
            return
        }
        
        if userModel.isAdmin() {
            navigationModel.path.append(
                "admin"
            )
            
            return
        }
        
        navigationModel.path.append(
            "home"
        )
    }
}

#Preview {
    SignIn()
}
