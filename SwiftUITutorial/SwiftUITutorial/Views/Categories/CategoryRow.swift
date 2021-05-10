//
//  CategoryList.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/23/21.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top){
                    ForEach(items) { item in
                        NavigationLink(
                            destination: LandmarkDetail(landmark: item)) {
                                CategoryItem(landmark: item)
                            }
                        
                    }
                    //.padding(.trailing, 5)
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryList_Previews: PreviewProvider {
    
    static var landmarks = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(categoryName: landmarks[0].category.rawValue,
                    items: Array(landmarks.prefix(3)))
    }
}
