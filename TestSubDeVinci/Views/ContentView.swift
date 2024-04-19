//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var alreadyStarted: Bool = UserDefaults.standard.bool(forKey: "AlreadyStarted")
    @EnvironmentObject var navigationModel: NavigationModel
    @EnvironmentObject var userModel: UserModel
    
    
    var body: some View {
        NavigationStack(
            path: $navigationModel.path
        ) {
            AuthView().navigationBarBackButtonHidden(true)
                .navigationDestination(
                    for: String.self
                ){view in
                    
                    switch view{
                    case "home":
                        QuestionsView().navigationBarBackButtonHidden(
                            true
                        )
                    case "mark":
                        VStack{
                            MarkView(user: nil)
                            SignOut()
                        }
                        .navigationBarBackButtonHidden(
                            true
                        )
                    case "admin":
                        AdminView().navigationBarBackButtonHidden(true)
                    default:
                        AuthView().navigationBarBackButtonHidden(true)
                    }
                    
                }
        }.onAppear() {
            if !alreadyStarted {
                let success = userModel.saveUser(firstName: "Admin", familyName: "Admin", pseudo: "Admin", password: "admin", isAdmin: true
                )
                UserDefaults.standard.set(success, forKey: "AlreadyStarted")
            }
        }
    }
}

#Preview {
    ContentView()
}
