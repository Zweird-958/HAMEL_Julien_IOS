//
//  MarkView.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import SwiftUI

struct MarkView: View {
    let user: User?
    let questionModel = Model()
    @EnvironmentObject var userModel: UserModel
    
    var body: some View {
        VStack{
            Text("\(getMark() ?? 0) / \(questionModel.questions.count)")
        }.navigationTitle("Note finale \(user?.pseudo ?? "")")
    }
    
    func getMark() -> Int16? {
        if user != nil {
            return user?.mark
        }
        
        return userModel.user?.mark
    }
}

#Preview {
    MarkView(user: nil)
}
