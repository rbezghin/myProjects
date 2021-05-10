//
//  ContentView.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/13/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    CategoryHome()
                        .tabItem { Label(
                            title: { Text("Featured") },
                            icon: { Image(systemName: "star") }
                        ) }
                        .tag(Tab.featured)
                    LandmarkList()
                        .tabItem { Label(
                            title: { Text("List") },
                            icon: { Image(systemName: "list.bullet") }
                        ) }
                        .tag(Tab.list)
                })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
