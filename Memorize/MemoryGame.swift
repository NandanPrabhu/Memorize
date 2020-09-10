//
//  MemoryGame.swift
//  Memorize
//
//  Created by Nandan Prabhu on 19/07/20.
//  Copyright © 2020 Nandan Prabhu. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    mutating func choose(_ card: Card) {
        let chosenIndex = cards.firstIndex(matching: card)
        self.cards[chosenIndex!].isFaceUp = !self.cards[chosenIndex!].isFaceUp
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }

    // constraints and gains
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

/*
 Entend protocol to implement methods
 */

/*
 protocol + generics = superpowerful
 */
