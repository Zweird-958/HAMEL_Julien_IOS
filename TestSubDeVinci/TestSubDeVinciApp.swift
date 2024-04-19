//
//  TestSubDeVinciApp.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

@main
struct TestSubDeVinciApp: App {
    @StateObject private var navigationModel = NavigationModel()
    @StateObject private var userModel = UserModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(navigationModel).environmentObject(userModel)
        }
    }
}
