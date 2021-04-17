//
//  SwiftUITutorialApp.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/13/21.
//

import SwiftUI

@main
struct SwiftUITutorialApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            LandmarkRow(landmark: landmarks[0])
        }
    }
}
