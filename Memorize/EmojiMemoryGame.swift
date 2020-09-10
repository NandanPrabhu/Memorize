//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Nandan Prabhu on 19/07/20.
//  Copyright © 2020 Nandan Prabhu. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    // @Published - property wrappers

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃", "🕷"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }

    //inlining of function in swift is called a closure
    // last argument you can remove and put method directly

    // MARK: Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // MARK: Intent(s)

    func chooseCard(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
