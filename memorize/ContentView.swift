//
//  ContentView.swift
//  memorize
//
//  Created by meishuo on 2026/3/16.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.themeName)
                    .font(.title)
                    .bold()
                Spacer()
                Text("Score: \(viewModel.score)")
                    .font(.title2)
                    .bold()
            }
            .foregroundStyle(viewModel.themeColor)
            .padding(.horizontal)
            
            cardList
                .animation(.default, value: viewModel.cards)
            Spacer()
            HStack {
                Button("Shuffle"){
                    viewModel.shuffle()
                }
                .font(.title3)
                Spacer()
                Button {
                    viewModel.newGame()
                } label: {
                    VStack {
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .font(.system(size: 40))
                        Text("New Game")
                            .font(.headline)
                    }
                }
            }
            .padding()
        }
        .padding()
        .foregroundStyle(viewModel.themeColor)
    }
    var cardList: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
                ForEach(viewModel.cards){card in
                    CardView(card: card, themeColor: viewModel.themeColor)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
    }
}
    struct CardView: View {
        var card: MemoryGame<String>.Card
        var themeColor: Color
        
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 20)
                Group{
                    shape.fill(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(Font.system(size: 300))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1, contentMode: .fit)
                }
                .opacity(card.isFaceUp ? 1 : 0)
                
                shape.fill(themeColor)
                    .opacity(card.isFaceUp ? 0 : 1)
            }
            .opacity(card.isMatched && !card.isFaceUp ? 0 : 1)
        }
    }
    
    #Preview {
        ContentView(viewModel:  EmojiMemoryGame())
    }
