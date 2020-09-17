//
//  Concentration.swift
//  Concentration
//
//  Created by Almir Acioly on 12/09/20.
//  Copyright © 2020 Almir Acioly. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfTheOnlyOne: Int?
    
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfTheOnlyOne, matchIndex != index {
                // check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfTheOnlyOne = nil
            } else {
                // either no cards or 2 cards are face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfTheOnlyOne = index
                
            }
        }
    }
    
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards.append(card)
            cards.append(card)
        }
        // TODO: Shuffle the cards
    }
    
    
}


/* func chooseCard(at index: Int) {
    if indexOfTheOnlyOne == nil, !cards[index].isFaceUp {
        // Primeira carta, não estiver para cima
        indexOfTheOnlyOne = cards[index].identifier
        cards[index].isFaceUp = true
    } else {
        if cards[index].identifier == indexOfTheOnlyOne! {
            cards[index].isMatched = true
            cards[indexOfTheOnlyOne!].isMatched = true
        } else {
            cards[index].isFaceUp = false
            cards[indexOfTheOnlyOne!].isFaceUp = false
            indexOfTheOnlyOne = nil
        }
    }
}*/
