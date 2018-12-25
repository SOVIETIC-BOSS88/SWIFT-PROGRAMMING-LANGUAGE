//
//  Concentration.swift
//  Concentration
//
//  Created by SUREN HARUTYUNYAN on 23/11/17.
//  Copyright © 2017 SUREN HARUTYUNYAN. All rights reserved.
//

import Foundation


struct Concentration {
    private(set) var cards = [Card]()
    
     //This is A.1.1.8
    private(set) var flipCount = 0
    
    //This is A.1.1.7
    private(set) var score = 0
    private var seenCards: Set<Int> = []
    
    //This is A.1.1.7
    private struct Points {
        //static let matchBonus = 2
        //static let missMatchPenalty = 1

    //This is A.1.2.2
        static let matchBonus = 20
        static let missMatchPenalty = 10
        static var maxTimePenalty = 10
    }
    //
    
    //This is A.1.2.2
    private var dateClick: Date?
    private var timePenalty: Int {
        return min(dateClick?.sinceNow ?? 0, Points.maxTimePenalty)
    }
    //
    
    /*
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil{
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
 */
    
    private var indexOfOneAndOnlyFaceUpCard: Int? {
        get {
            return cards.indices.filter {cards[$0].isFaceUp }.oneAndOnly
//            var foundIndex: Int?
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    if foundIndex == nil{
//                        foundIndex = index
//                    } else {
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        set(newValue) {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "Concentration.chooseCard(at: \(index)): chosen index not in the cards")
        if !cards[index].isMatched {
             //This is A.1.1.8
            flipCount += 1
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                
                //Checks cards match
                //if cards[matchIndex].identifier == cards[index].identifier {
                if cards[matchIndex] == cards[index] {
                    //Here the cards match
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    
                    //This is A.1.1.7
                    //Here we increase the points
                    score += Points.matchBonus
                    
                } else {
                    //Here the cards don´t mathch. Here we penalize
                    if seenCards.contains(index) {
                        score -= Points.missMatchPenalty
                    }
                    if seenCards.contains(matchIndex) {
                        score -= Points.missMatchPenalty
                    }
                    seenCards.insert(index)
                    seenCards.insert(matchIndex)
                }
                //This is A.1.2.2
                score -= timePenalty
                //
                cards[index].isFaceUp = true
            } else {
                //Either no cards or 2 cards are face up
                indexOfOneAndOnlyFaceUpCard = index
            }
            
            //This is A.1.2.2
            dateClick = Date()
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "Concentration.init(\(numberOfPairsOfCards)): you must have at least one pair of cards")
        for _ in 1...numberOfPairsOfCards {
        let card = Card()
        cards += [card, card] //This is the same as the 2 lines below
        /*
        cards.append(card)
        cards.append(card)
        */
        }
        
        //TODO: Shuffle the cards!
        //This is A.1.1.4
        cards.shuffle()
    }
  
    //This is A.1.1.3
    mutating func resetGame () {
        //This is A.1.1.8
        flipCount = 0
        //
        for index in cards.indices {
            cards[index].isFaceUp = false
            cards[index].isMatched = false
        }
        //This is A.1.1.4
        cards.shuffle()
    }
    
}

//This is A.1.2.2
extension Date {
var sinceNow: Int {
    return -Int(self.timeIntervalSinceNow)
    }
}
//

extension Collection {
    var oneAndOnly: Element? {
        return count == 1 ? first : nil
    }
}




