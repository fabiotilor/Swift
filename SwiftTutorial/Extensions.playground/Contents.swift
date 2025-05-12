import Foundation

extension Int {
    func plusTwo() -> Int {
        self + 2
    }
}

let two = 2
two.plusTwo()

struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String){
        let components = fullName.components(separatedBy: " ")
            self.init(firstName: components.first ?? fullName, lastName: components.last ?? fullName)
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName

protocol driveable {
    var driveValue: String {get}
    func drive() -> String
}

extension driveable {
    func drive() -> String {
        "Driving \(driveValue)"
    }
}

struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: driveable{
    var driveValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
    
}

modelX.drive()

class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}

MyDouble().value

extension driveable {
    func drivemore() -> String {
        drive() + " more!"
    }
}

modelX.drivemore()
