//
//  CircleView.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/15/21.
//

import SwiftUI

struct CircleView: View {
    
    var image: Image
    
    var body: some View {
       image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(image: Image("turtlerock"))
    }
}
