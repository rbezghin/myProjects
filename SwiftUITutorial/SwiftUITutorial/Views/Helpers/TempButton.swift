//
//  TempButton.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/19/21.
//

import SwiftUI

struct TempButton: View {
    
    @EnvironmentObject var modelData: ColorViewModel
    
    var body: some View {
        Button(action: {
            modelData.setRandomColor()
        }, label: {
            Text("CHANGE COLOR")
                .font(.title)
                .bold()
                .foregroundColor(.gray)
        })
    }
}

struct TempButton_Previews: PreviewProvider {
    static var previews: some View {
        TempButton()
            .environmentObject(ColorViewModel())
    }
}
