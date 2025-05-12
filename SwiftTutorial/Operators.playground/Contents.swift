import Foundation

let myAge = 22
let yourAge = 20

if myAge > yourAge {
    "older"
} else if myAge < yourAge {
    "younger"
} else {
    "equal"
}

let myMothersAge = myAge + 30

let name = Optional("Fabio")
let unwrap = name!

type(of: name)
type(of: unwrap)


let msg: String
if myAge >= 18{
    msg = "Adult"
    
} else {
    msg = "Minor"
}


let message = yourAge >= 18 ? "Adult" : "Minor"

"Your age is \(myAge)"
