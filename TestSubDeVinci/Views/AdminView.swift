//
//  AdminView.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import SwiftUI

struct AdminView: View {
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
    
        List(userModel.getStudents()){user in
            NavigationLink(user.pseudo ?? ""){
                MarkView(user: user)
            }
        }
        SignOut()
        
    }
}

#Preview {
    AdminView()
}
