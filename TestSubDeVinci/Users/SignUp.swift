//
//  SignUp.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import SwiftUI

struct SignUp: View {
    @State var firstName: String = ""
    @State var familyName: String = ""
    @State var pseudo: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var showAlert = false
    @State var alertMessage = ""
    @EnvironmentObject var navigationModel: NavigationModel
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        Form{
            TextField(
                "Prénom",
                text: $firstName
            )
            TextField(
                "Nom",
                text: $familyName
            )
            TextField(
                "Pseudo",
                text: $pseudo
            )
            SecureField(
                "Mot de passe",
                text: $password
            )
            SecureField(
                "Confirmation de mot de passe",
                text: $confirmPassword
            )
            Button(action: {
                signUp()
            },
                   label: {
                Text(
                    "S'inscrire"
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
    
    func signUp(){
        if pseudo.isEmpty || password.isEmpty || firstName.isEmpty || familyName.isEmpty || confirmPassword.isEmpty {
            showAlert = true
            alertMessage = "Veuillez remplir tous les champs."
            
            return
        }
        
        
        if password != confirmPassword {
            showAlert = true
            alertMessage = "Le mot de passe et la confirmation ne sont pas les mêmes."
            
            return
        }
        
        let pseudoExists = userModel.checkIfPseudoExists(pseudo: pseudo)
        
        if pseudoExists {
            showAlert = true
            alertMessage = "Ce pseudo est déjà pris"
            
            return
        }
        
        let success = userModel.saveUser(firstName: firstName, familyName: familyName, pseudo: pseudo, password: password)
        
        if success {
            if userModel.isAdmin() {
                navigationModel.path.append("admin")
                
                return
            }
            
            navigationModel.path.append("home")
            
            return
        }
        
        alertMessage = "Erreur lors de l'inscription"
    }
}

#Preview {
    SignUp()
}
