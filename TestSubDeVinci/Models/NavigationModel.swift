//
//  NavigationModel.swift
//  TestSubDeVinci
//
//  Created by Julien on 19/04/2024.
//

import Foundation
import SwiftUI

class NavigationModel: ObservableObject {
    @Published var path = NavigationPath()
}
