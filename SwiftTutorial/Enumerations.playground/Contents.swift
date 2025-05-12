import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
}

let cat = Animals.cat

switch cat{
case .cat:
    "Cat"
    break
case .dog:
    "Dog"
    break
default:
    "Otherwise"
}


enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://www.apple.com")!)

switch wwwApple {
    
case let .fileOrFolder(path, name):
    path
    name
    break
case let .wwwUrl(path):
    path
    break
case let .song(artist, songName):
    artist
    songName
}

if case let .fileOrFolder(path, name) = wwwApple {
    path
    
}

let withoutYou = Shortcut.song(artist: "The Beatles", songName: "Without You")

if case let .song(_, songName) = withoutYou {
    songName
}

enum Vehicle{
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    var manufacturer: String{
        switch self {
        case let .car(manufacturer, _),
        let .bike(manufacturer, _):
            return manufacturer
        }
    }
}


let car = Vehicle.car(manufacturer: "Tesla", model: "X")
car.manufacturer
let bike = Vehicle.bike(manufacturer: "Honda", yearMade: 2019)
bike.manufacturer


enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case smiley = ":)"
    case sad = ":("
    case funny = "xD"
}
FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)


enum Height {
    case short, medium, long
    mutating func makeLong(){
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
myHeight

indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freehand(IntOperation)
    
    func calculateResult(of operation: IntOperation? = nil) -> Int{
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freehand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freehand(.add(10, 20))
freeHand.calculateResult()
