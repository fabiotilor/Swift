import Foundation

protocol CanBreathe {
    func breathe()
}

struct Animal: CanBreathe {
    func breathe() {
        "Animal is breathing"
    }
}

class Person: CanBreathe {
    func breathe() {
        "Person is breathing"
    }
}

let dog = Animal()
dog.breathe()
let person = Person()
person.breathe()

protocol CanJump{
    func jump()
}

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

struct Cat: CanJump {
    
}

let cat = Cat()
cat.jump()

protocol HasName {
    var Name: String {get}
    var age: Int {get set}
}

struct Dog: HasName {
    let Name: String
    var age: Int
}

extension HasName {
    func getName() -> String{
        "Name: \(Name)"
    }
}

var chien = Dog(Name: "Max", age: 5)
chien.Name
chien.age
chien.age += 1
chien.age
chien.getName()

func describe(obj: Any) {
    if obj is Dog {
        "obj is a Dog"
    }
}

describe(obj: chien)


func talk(obj: Any) {
    if var dog = obj as? Dog {
        dog.getName()
    }
}

talk(obj: cat)
