//
//  ContentView.swift
//  memorize
//
//  Created by meishuo on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    @State var emojiCount = 6
    var body: some View {
        VStack {
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack {
                Button(action: {
                    emojiCount -= 1
                }, label: {
                    Text("Remove Card")
                })
                
                Spacer()
                
                Button(action: {
                    emojiCount += 1
                }, label: {
                    Text("Add Card")
                })
                
            }
            
        }
        .padding()
        .foregroundStyle(.orange)
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape
            }
        }
        //.onTapGesture(perform: {
        //    isFaceUp = !isFaceUp
        //})
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

#Preview {
    ContentView()
}
