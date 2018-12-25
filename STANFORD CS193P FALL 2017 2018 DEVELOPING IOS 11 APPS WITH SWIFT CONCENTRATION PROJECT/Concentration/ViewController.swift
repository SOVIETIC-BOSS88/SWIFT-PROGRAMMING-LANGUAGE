//
//  ViewController.swift
//  Concentration
//
//  Created by SUREN HARUTYUNYAN on 23/11/17.
//  Copyright © 2017 SUREN HARUTYUNYAN. All rights reserved.
//

import UIKit

//A.1.1.1 and A.1.1.2 are already done
class ViewController: UIViewController {
    
    private lazy var game : Concentration =
        Concentration (numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        get {
            return (cardButtons.count + 1) / 2
        }
    }
    
    /*
    private(set) var flipCount = 0 {
        didSet {
     updateFlipCountLabel()
        }
    }
     */
    
    /*
    private func updateFlipCountLabel ()
    {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth: 5.0,
            .strokeColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    */
    
    
    @IBOutlet private weak var flipCountLabel: UILabel! // {
       /*
        didSet {
            updateFlipCountLabel()
        }
       */
     //}
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    
    //This is A.1.1.7
    @IBOutlet weak var scoreLabel: UILabel!
    
    //This is A.1.1.9
    @IBOutlet weak var titleLabel: UILabel!
    
    //This is A.1.1.3
    @IBOutlet weak var newGameButton: UIButton!
    
    //This is A.1.1.3
    @IBAction func newGame() {
        game.resetGame()
        //This is A.1.1.5
        //indexOfTheme = keys.count.arc4random
        //
        
        //This is A.1.2.1
        indexOfTheme = emojiThemes.count.arc4random
        updateViewFromModel()
        //flipCount = 0
    }
    
    //This is A.1.1.5
    override func viewDidLoad() {
        super.viewDidLoad()
        //This is A.1.2.1
        indexOfTheme = emojiThemes.count.arc4random
        //This is A.1.1.5
        //indexOfTheme = keys.count.arc4random
        updateViewFromModel()
    }
    
    
    @IBAction private func touchCard(_ sender: UIButton) {
        //flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen card was not in cardButtons")
        }
    }
    
    
    
    private func  updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("" ,for: UIControlState.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : cardBackColor
                
            }
        }
        //This is A.1.1.7
        scoreLabel.text = "Score: \(game.score)"
        //This is A.1.1.8
        flipCountLabel.text = "Flips: \(game.flipCount)"
    }
    
    //This is A.1.2.1
    private struct Theme {
        var name: String
        var emojis: [String]
        var viewColor: UIColor
        var cardColor: UIColor
    }
    
    
    //private var emojiChoices = ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎"]
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎"
    
    //This is A.1.1.5
    /*
    private var emojiThemes : [String: [String]] = [
        "Christmas": ["🤶","🎅","🎄","🎁","🎉","❄️","☃️","🎄","🥛", "⛪️"],
        "Fruits": ["🍇","🍈","🍉","🍍","🥥","🍐","🍑","🍒","🍓", "🥝"],
        "Faces": ["😀","😁","😂","😅","😆","😇","😉","😊","😋", "😌"],
        "Activity": ["🚵‍♀️","⛹️‍♀️","🚴‍♀️","🏄‍♀️","🏋️‍♂️","🏈","🏐","🎱","🏀", "🎣"],
        "Animals": ["🐝","🐟","🐅","🕊","🐊","🐻","🐳","🐒","🐂", "🐆"],
        "Clothes": ["🎽","🧥","👔","👕","👖","👚","👘","👟","👞", "👗"],
        "Halloween": ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎", "🕷"],
        //This is A.1.1.6
        "Transport": ["🚗","🚚","🚝","🚲","🏍","🛵","🚁","🛫","🚤","🚀"]
    ]
    */
    
    //This is A.1.2.1
    private var emojiThemes : [Theme] = [
        Theme (name: "Christmas",
        emojis: ["🤶","🎅","🎄","🎁","🎉","❄️","☃️","🎄","🥛", "⛪️"],
        viewColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        cardColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),
       
        Theme (name: "Fruits",
               emojis: ["🍇","🍈","🍉","🍍","🥥","🍐","🍑","🍒","🍓", "🥝"],
               viewColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),
               cardColor: #colorLiteral(red: 0.989094913, green: 0.9906423688, blue: 0.02892600372, alpha: 1)),
        
        Theme (name: "Faces",
               emojis: ["😀","😁","😂","😅","😆","😇","😉","😊","😋", "😌"],
               viewColor: #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1),
               cardColor: #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)),
        
        Theme (name: "Christmas",
               emojis: ["🤶","🎅","🎄","🎁","🎉","❄️","☃️","🎄","🥛", "⛪️"],
               viewColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
               cardColor: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)),
        
        Theme (name: "Activity",
               emojis: ["🚵‍♀️","⛹️‍♀️","🚴‍♀️","🏄‍♀️","🏋️‍♂️","🏈","🏐","🎱","🏀", "🎣"],
               viewColor: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1),
               cardColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
        
        Theme (name: "Animals",
               emojis: ["🐝","🐟","🐅","🕊","🐊","🐻","🐳","🐒","🐂", "🐆"],
               viewColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),
               cardColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)),
        
        Theme (name: "Clothes",
               emojis: ["🎽","🧥","👔","👕","👖","👚","👘","👟","👞", "👗"],
               viewColor: #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),
               cardColor: #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)),
        
        Theme (name: "Halloween",
               emojis: ["🦇","😱","🙀","😈","🎃","👻","🍭","🍬","🍎", "🕷"],
               viewColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),
               cardColor: #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)),
        
        Theme (name: "Transport",
               emojis: ["🚗","🚚","🚝","🚲","🏍","🛵","🚁","🛫","🚤","🚀"],
               viewColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1),
               cardColor: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
    ]
    
    //This is A.1.2.1
    private var backgroundColor = UIColor.black
    private var cardBackColor = UIColor.orange
    
    //This is A.1.2.1
    private func updateAppearance() {
        view.backgroundColor = backgroundColor
        flipCountLabel.textColor = cardBackColor
        scoreLabel.textColor = cardBackColor
        titleLabel.textColor = cardBackColor
        newGameButton.setTitleColor(backgroundColor, for: .normal)
        newGameButton.backgroundColor = cardBackColor
    }
    
    //This is A.1.1.5
    private var indexOfTheme = 0 {
        didSet {
            //print(indexOfTheme, keys[indexOfTheme])
            
            //This is A.1.1.9
            //titleLabel.text = keys[indexOfTheme]
            //
            
            //emojiChoices = emojiThemes[keys [indexOfTheme]] ?? []
            //emoji = [Int: String]()
            
            //This is A.1.2.1
            print(indexOfTheme, emojiThemes[indexOfTheme].name)
            //emoji = [Int:String]()
            emoji = [Card:String]()  
            titleLabel.text = emojiThemes[indexOfTheme].name
            
            //emojiChoices = emojiThemes[indexOfTheme].emojis
            emojiChoices = String(describing: emojiThemes[indexOfTheme].emojis)
            backgroundColor = emojiThemes[indexOfTheme].viewColor
            cardBackColor = emojiThemes[indexOfTheme].cardColor
            
            updateAppearance()
        }
    }
    
    //This is A.1.1.5
    /*
    private var keys: [String] {
        return Array(emojiThemes.keys)
    }
     */
    
    //private var emoji = [Int:String]()
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card)-> String {
        if  emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
            }
    
        return emoji[card] ?? "?"
    }
    
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else {
            return 0
        }
    }
}

//This is A.1.1.4
extension Array {
    //Here we shuffle the elements
    mutating func shuffle() {
        //If the collection is empty or has only one element it is not shuffled
        if count < 2 { return }
        
        for i in indices.dropLast() {
            let diff = distance(from: i, to: endIndex)
            let j = index(i, offsetBy: diff.arc4random)
            swapAt(i, j)
        }
    }
}























