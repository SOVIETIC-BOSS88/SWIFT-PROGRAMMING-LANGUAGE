//
//  main.swift
//  prog1
//
//  Created by SUREN HARUTYUNYAN on 16/11/17.
//  Copyright © 2017 SUREN HARUTYUNYAN. All rights reserved.
//

import Foundation

print("Hello, World!")

//Create a constant with an explicit type of Float and a value of 4.
let explicitFloat: Float = 4

//Try removing the conversion to String from the last line. What error do you get
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
let letters = 5.0
let name = "Bojack"

let nameSaying = "My name is \(name)"
let nameLetters = "The number of letters in my name is \(letters)"


//Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.
var optionalName: String? = nil
//var greeting = "Hello!"

/*
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
greeting = "Hello Bojack!"
}
print(greeting)
*/


//Try removing the default case. What error do you get?
/*
let vegetable = "red pepper"

switch vegetable {
case "celery":
        print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}
*/



//Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.
/*
let interestingNumbers = [
    "Prime":[ 2, 3, 4, 5, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind

        }
    }
}
print(largest, largestKind)
*/

//Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.
func greet(person: String, lunchSpecial: String) -> String{
       return "Hello \(person), today we have \(lunchSpecial)."
}
let greeting = (greet(person: "Bob", lunchSpecial: "IKEA meat"))
print(greeting)


//Rewrite the closure to return zero for all odd numbers.
var numbers = [20, 19, 7, 12]

var result = numbers.map({
    (number: Int) -> Int in
    var result = 0
    if number % 2 == 0 {
        result = 3 * number
    }
    return result
})

print(result)

//Add a constant property with let, and add another method that takes an argument.
class Shape {
    let numberOfDimensions = 3
    var numberOfSides = 0
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func isNDimensional(dimensions: Int) -> Bool{
        var response = true
        if (numberOfDimensions != dimensions){
        response = false
        }
        return response
    }
}

var shape = Shape()
let myShapePrint = shape.isNDimensional(dimensions: 3)
print(myShapePrint)


//Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let testSquare = Square(sideLength: 5.2, name: "my test square")
print(testSquare.area())
print(testSquare.simpleDescription())


class Circle: NamedShape {
    var radius: Double = 0
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        }
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with a radius of \(radius)"
    }
}

let testCircle = Circle(radius: 10, name: "my test circle")
print(testCircle.area())
print(testCircle.simpleDescription())


//Write a function that compares two Rank values by comparing their raw values.
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func CompareRank(first: Rank, second: Rank) -> Bool {
        return first.rawValue == second.rawValue
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

let jack = Rank.jack
let compareJackAce = jack.CompareRank(first: jack, second: ace)


//Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func colorOfCards() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
    
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let colorCards = hearts.colorOfCards()

//Add a third case to ServerResponse and to the switch.
enum ServerResponse {
    case result(String, String)
    case failure(String)
    case wait(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let wait = ServerResponse.wait("Wait more.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .wait(message):
    print("Stand by... \(message)")
}

//Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

func createDeck() -> [Card] {
    var deck = Array (repeating: Card(rank: .ace, suit: .spades), count: 52)
    let suits = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
    var counter = 1
    
    for rk in 1...13 {
        for st in suits {
            deck = [Card (rank: Rank(rawValue: rk)!, suit: st)]
            counter += 1
        }
    }
    return deck
}

func printDeck (deck: [Card]) {
    for card in deck {
        print (card.simpleDescription())
    }
}

let deck = createDeck()
printDeck(deck: deck)


//Write an enumeration that conforms to this protocol.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription


enum SimpleEnumeration: ExampleProtocol {
    case A, B, C, D
    case AA, BB, CC, DD
    var simpleDescription: String {
        get {
        var desc = "A simple enum of type "
        switch self {
        case .A:
            desc += ".A"
        case .B:
            desc += ".B"
        case .C:
            desc += ".C"
        case .D:
            desc += ".D"
        case .AA:
            desc += ".AA (adjusted)"
        case .BB:
            desc += ".BB (adjusted)"
        case .CC:
            desc += ".CC (adjusted)"
        case .DD:
            desc += ".DD (adjusted)"
            }
            return desc
        }
    }
    
    mutating func adjust() {
        switch self {
        case .A:
            self = .AA
        case .B:
            self = .BB
        case .C:
            self = .CC
        case .D:
            self = .DD
        default:
            print("Already adjusted")
        }
    }
}

var c = SimpleEnumeration.A
c.adjust()
let cDescription = c.simpleDescription
print(cDescription)


//Write an extension for the Double type that adds an absoluteValue property.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

extension Double {
    var absoluteValue: Double {
        get {
            if self < 0 {
                return self * -1
            }
            else {
                return self
            }
        }
    }
}

let double = -7.0
print(double.absoluteValue)


let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//print(protocolValue.anotherProperty)  // Uncomment to see the error



//Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}


//Add code to throw an error inside the do block. What kind of error do you need to throw so that the error is handled by the first catch block? What about the second and third blocks?
enum NetworkError: Error { //This is to catch the third error
    case Unavailable
}

var networkAvailable = false

do {
    if !networkAvailable {
        throw NetworkError.Unavailable
    }
    //throw PrinterError.onFire //This is to catch the first error
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner") //This is to catch the second error
    print(printerResponse)
    
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

//Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.

/*
func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
print(anyCommonElements([1, 2, 3], [3]))
*/

func anyCommonElements<T: Sequence, U: Sequence> (_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        var commonElement: [T.Iterator.Element] = []
        
        
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    commonElement.append(lhsItem)
                }
            }
        }
        return commonElement
}

print(anyCommonElements([1,2,3], [3]))
