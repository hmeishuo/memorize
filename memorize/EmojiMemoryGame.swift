//
//  EmojiMemoryGame.swift
//  memorize
//
//  Created by meishuo on 2026/3/30.
//
import SwiftUI
import Foundation

@Observable
class EmojiMemoryGame {
    private var themePool: ThemePool<String>
    private(set) var theme: ThemePool<String>.Theme
    private var model: MemoryGame<String>
    
    init(){
        var pool = ThemePool<String>()
        pool.addTheme(name: "動物園", color: "orange", numberOfPairs: 8, items: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐨","🐯"])
        pool.addTheme(name: "美味食物", color: "blue", numberOfPairs: 7, items: ["🍔", "🍟", "🍕", "🌭", "🥪", "🌮", "🌯", "🥗", "🥘","🍝"])
        pool.addTheme(name: "自然景觀", color: "green", numberOfPairs: 6, items: ["🌲", "🌵", "🍀", "🌿", "🎋", "🍃", "🍄", "🍁", "🌸","🌻"])
        self.themePool = pool
        let randomTheme = pool.theme.randomElement()!
        self.theme = pool.theme.randomElement()! //初始主題
        self.model = EmojiMemoryGame.createMemoryGame(with: randomTheme) //根據選定的主題建立 MemoryGame
    }
    
    private static func createMemoryGame(with theme: ThemePool<String>.Theme) -> MemoryGame<String> {
        let shuffledItems = theme.items.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairs) { index in
            shuffledItems[index]
        } // 🌟 補上這個括號：用來結束 { index in ... } 閉包
    } // 🌟 補上這個括號：用來結束 func createMemoryGame

    func newGame() {
        theme = themePool.theme.randomElement()! // 隨機換主題
        model = EmojiMemoryGame.createMemoryGame(with: theme)
    }
        
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    var themeName: String {
        theme.name
    }
            
    // 輔助方法：將 String 轉為 SwiftUI 的 Color
    var themeColor: Color {
        switch theme.color {
        case "orange": return .orange
        case "blue": return .blue
        case "green": return .green
        default: return .gray
        }
    }
    
    // MARK: - intent
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
}
