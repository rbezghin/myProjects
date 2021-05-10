//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/13/21.
//

import SwiftUI

@main
struct SwiftUITutorialApp: App {
    
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
