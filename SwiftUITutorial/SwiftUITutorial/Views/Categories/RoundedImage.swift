//
//  RoundedImage.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/23/21.
//

import SwiftUI

struct RoundedImage: View {
    
    var image: Image
    
    var body: some View {
            image
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)
    }
}
struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(image: Image("turtlerock"))
    }
}
