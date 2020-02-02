//
//  Card.swift
//  Cards Game
//
//  Created by Kartik Kanungo on 02/02/20.
//  Copyright © 2020 Kartik Kanungo. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    let identifier: Int

    static var identifierFactory = 0

    init() {
        self.identifier = Card.getUniqueIdentifier()
    }

    static func getUniqueIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
}
