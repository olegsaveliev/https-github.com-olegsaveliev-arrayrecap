//
//  ContentView.swift
//  ArrayRecap
//
//  Created by Oleg Savelyev on 04.04.2022.
//

import SwiftUI

struct Card {
    
    var number = 1
    var suit = 0
}

struct ContentView: View {
    
    @State var logginCard = [String]()
    @State var message = ""
    @State var cards = [Card]()
    var suits = ["Clubs", "Spades", "Hearts", "Diamonds"]
    
    var body: some View {
        Text(message)
        
        Button("Add Card"){
            addCard()
        }
        
    }
    
    func addCard() {
        let ranNum = Int.random(in: 1...13)
        let ranSuit = Int.random(in: 0...3)
        
        var deck = Card()
        deck.number = ranNum
        deck.suit = ranSuit
        
        let pathString = (String(deck.number) + "/" + String(deck.suit))
        
        if logginCard.contains(pathString) {
            message = "Generated duplicate card."
            
        } else {
            
            logginCard.append(pathString)
            cards.append(deck)
            
            let cardName = getCardName(deck.number)
            let suitName = suits[deck.suit]
            
            message = "Generated \(cardName) of \(suitName)"
        }
    }
    func getCardName(_ cardNumber:Int)->String {
        if cardNumber == 1 {
            return String("Ace")
        } else if cardNumber == 11 {
            return  "Jack"
        }else if cardNumber == 12 {
            return "Queen"
        }else if cardNumber == 13 {
            return  "King"
        }
        return String(cardNumber)
    }
              
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
