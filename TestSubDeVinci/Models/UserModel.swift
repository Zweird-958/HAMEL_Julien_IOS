//
//  UserModel.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import Foundation

class UserModel: ObservableObject {
    private var dataModel = DataController.shared
    
    @Published var user: User?
    
    func saveUser(firstName: String, familyName: String, pseudo: String, password: String, isAdmin: Bool = false) -> Bool {
        let currentUser =  dataModel.saveUser(firstName: firstName, familyName: familyName, pseudo: pseudo, password: password, isAdmin: isAdmin)
        
        if currentUser != nil {
            user = currentUser
            
            return true
        }
        
        return false
    }
    
    func checkIfPseudoExists(pseudo: String) -> Bool {
        for user in dataModel.getAllUsers() {
            if user.pseudo == pseudo {
                return true
            }
        }
        
        return false
    }
    
    func getUser(pseudo: String, password: String) -> User? {
        return dataModel.getUser(pseudo: pseudo, password: password)
    }
    
    func saveMark(mark: Int16){
        if user != nil {
            dataModel.saveMark(user: user!, mark: mark)
            
        }
    }
    
    func getAllUser() -> [User] {
        return dataModel.getAllUsers()
    }
    
    func isAdmin() -> Bool {
        return user?.isAdmin ?? false
    }
    
    func getStudents() -> [User] {
        return dataModel.getStudents()
    }
    
    func testIsDone() -> Bool {
        return user?.testDone ?? false
    }
}
