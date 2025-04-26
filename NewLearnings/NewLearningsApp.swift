//
//  NewLearningsApp.swift
//  NewLearnings
//
//  Created by Ibrahim Mo Gedami on 4/23/25.
//

import SwiftUI
import CombineNetwork

@main
struct NewLearningsApp: App {
    
    init() {
        APIConstants.shared.baseURL = ""
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
