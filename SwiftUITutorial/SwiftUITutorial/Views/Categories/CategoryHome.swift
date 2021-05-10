//
//  CategoryHome.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/23/21.
//

import SwiftUI

struct CategoryHome: View {
    
    @EnvironmentObject var dataModel: ModelData
    
    var body: some View {
        NavigationView {
            List {
                dataModel.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                
                ForEach(dataModel.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: dataModel.landmarks.filter({$0.category.rawValue == key}) )
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
