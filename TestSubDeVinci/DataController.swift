//
//  DataController.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static var shared = DataController()
    let container = NSPersistentContainer(name: "UsersStorage")
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
            
        }
    }
    
    func saveUser(firstName: String, familyName: String, pseudo: String, password: String, isAdmin: Bool) -> User? {
        do {
            let user = User(context: viewContext)
            user.id = UUID()
            user.firstName = firstName
            user.familyName = familyName
            user.pseudo = pseudo
            user.password = password
            user.isAdmin = isAdmin
            
            try viewContext.save()
            
            return user
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
            return nil
        }
    }
    
    func remove(user: User) {
        viewContext.delete(user)
        do {
            try viewContext.save()
        } catch {
            print("Je n'ai pas réussi à sauvegarder les données: \(error)")
        }
    }
    
    func getAllUsers() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
    func getUser(pseudo: String, password: String) -> User? {
        for user in getAllUsers() {
            if user.pseudo == pseudo && user.password == password{
                return user
            }
        }
        
        return nil
    }
    
    func saveMark(user: User, mark: Int16) {
        do {
            user.mark = mark
            user.testDone = true
            try viewContext.save()
            
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
    func getStudents() -> [User] {
        let request = NSFetchRequest<User>(entityName: "User")
        request.predicate = NSPredicate(format: "isAdmin = %@", argumentArray: [false])
        
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }
}

