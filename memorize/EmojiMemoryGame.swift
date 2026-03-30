//
//  emojiMemoryGame.swift
//  memorize
//
//  Created by meishuo on 2026/3/30.
//

import Foundation

func createCardContent(forIdentifier identifier: Int) -> String {
    return"A"
}

class EmojiMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 4, createCardContent: createCardContent )
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
}
