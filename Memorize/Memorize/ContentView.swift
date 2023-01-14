//
//  ContentView.swift
//  Memorize
//
//  Created by Bezghin, Radomyr on 1/7/22.
//

import SwiftUI

struct ContentView: View {
    
    var emojis = [
        ["😀","😃","😄","😇","😂","🤣","🙃","😉","🤯","😔","😠", "😍","🚗","🚙","🏎","🚕","🚓","🚘","🚖","🚔","🐱","🐈","🐈‍⬛","🐶","🐕‍🦺","🦮","🐕","🐩"],
        ["🚗","🚙","🏎","🚕","🚓","🚘","🚖","🚔"],
        ["🐱","🐈","🐈‍⬛","🐶","🐕‍🦺","🦮","🐕","🐩"]
    ]
    
    @State var emojiType = 0
    
    // some view - something that behaves like a view ??
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                let num = randomRumber(emojiType)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: CGFloat(100/num*7)))]) {
                    ForEach(emojis[emojiType].shuffled()[0...num], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .foregroundColor(.red)
            }
            Spacer()
            HStack {
                Spacer()
                first
                Spacer()
                second
                Spacer()
                third
                Spacer()
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    func randomRumber(_ type: Int) -> Int {
        let count = emojis[type].count
        return Int.random(in: 4..<count)
    }
    
    var first: some View {
        VStack {
            Button {
                emojiType = 0
            } label: {
                Image(systemName: "face.smiling")
            }
            Text("Smile")
                .font(.subheadline)
        }
    }
    
    var second: some View {
        VStack {
            Button {
                emojiType = 1
            } label: {
                Image(systemName: "car")
            }
            Text("Car")
                .font(.subheadline)
        }
    }
    
    var third: some View {
        VStack {
            Button {
                emojiType = 2
            } label: {
                Image(systemName: "pawprint")
            }
            Text("Animal")
                .font(.subheadline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct EmojiTypeView: View {
    
    var imageName: String
    var text: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
            Text(text)
        }
    }
}


struct CardView: View {
    //cannot have variable with no value
    @State var isFaceUP: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }

        }
        .onTapGesture {
            isFaceUP.toggle()
        }
    }
}
