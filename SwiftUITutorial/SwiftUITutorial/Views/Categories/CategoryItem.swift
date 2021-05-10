//
//  CategoryItem.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/23/21.
//

import SwiftUI

struct CategoryItem: View {
    
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            landmark.image
                .renderingMode(.original)
                .frame(width: 155, height: 155)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 10)
            Text(landmark.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
    }
}

struct CategoryItem_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
