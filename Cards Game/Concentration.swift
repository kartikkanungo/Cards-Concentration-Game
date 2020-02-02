//
//  Concentration.swift
//  Cards Game
//
//  Created by Kartik Kanungo on 02/02/20.
//  Copyright © 2020 Kartik Kanungo. All rights reserved.
//

import Foundation

class Concentration {

    var cards: [Card] = []
    var indexOfOneAndOnlyOneFaceUpCard: Int?

    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let newCard = Card()
            cards += [newCard, newCard]
        }
        // Todo: Shuffle Cards
//        shuffleCards()
    }

    func shuffleCards() {
        var shuffledCards: [Card] = []

        for currentArrayLength in 0..<cards.count {
           let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            shuffledCards += [cards.remove(at: randomIndex)]
            
        }
        cards = shuffledCards
    }


    func chooseCard(at index: Int) {
        if !cards[index].isMatched  {
            if let matchIndex = indexOfOneAndOnlyOneFaceUpCard, matchIndex != index {
                // check if two cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = nil
            } else {
                // Either no card or two cards are facing up.
                for flipdownIndex in cards.indices {
                    cards[flipdownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceUpCard = index
            }
        }
    }
}
