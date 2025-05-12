import Foundation

func multiplybytwo(_ value: Int? = nil) -> Int {
    if let value {
        value * 2
    }
    else {
        0
    }
}

multiplybytwo()

let age: Int? = nil
if age != nil {
    "age is nil"
}

if let age {
    "\(age)"
}

func checkAge() {
    guard age != nil else { //No unwrapping
        "Age is nil"
        return
    }
    "Age is not nil, weird."
}

checkAge()

let age2: Int? = 0
func checkAge2() {
    guard let age2 else { //unwrapped
        return
    }
}

switch age {
    
case .none:
    "Age has no value"
case let .some(value):
    "Age has value of \(value)"
}

if age2 == 0 {
    "Age is 0"
} else {
    "Age2 is not 0."
}
l
