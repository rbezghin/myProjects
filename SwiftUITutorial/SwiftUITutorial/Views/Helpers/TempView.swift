//
//  tempView.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/19/21.
//

import SwiftUI

struct TempView: View {
    
    @EnvironmentObject var modelData: ColorViewModel

    var body: some View {
        
        ZStack {
            modelData.color.ignoresSafeArea()
            TempButton()
        }
    }
}

struct tempView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
            .environmentObject(ColorViewModel())
    }
}
