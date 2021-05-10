//
//  ColorViewModel.swift
//  SwiftUITutorial
//
//  Created by Radomyr Bezghin on 4/19/21.
//

import SwiftUI

class ColorViewModel: ObservableObject{
    
    @Published var color: Color = .red

    func setRandomColor(){
        color = [Color.yellow, Color.blue, Color.green].randomElement()!
    }
}
