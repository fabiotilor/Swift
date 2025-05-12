import Foundation

struct Dog {
    
}

struct Person: Equatable {
    let id: Int
    let name: String
    //let dog: Dog
}

let foo1 = Person(id: 1, name: "foo")
let foo2 = Person(id: 1, name: "bar")

if foo1 == foo2 {
    "they are equal!"
} else{
    "they're not equal"
}

enum AnimalType {
    case dog(breed: String)
    case cat(breed: String)
}

extension AnimalType: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.dog(lhsBreed), .dog(rhsBreed)),
            let (.cat(lhsBreed), .cat(rhsBreed)):
            return lhsBreed == rhsBreed
        default:
            return false
           
        }
    }
}

struct Animal: Equatable {
    let name: String
    let type: AnimalType
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "Whiskers", type: .cat(breed: "Street Cat"))
let cat2 = Animal(name: "Whoosh", type: .cat(breed: "Street Cat"))

if cat1 == cat2 {
    "they are equal because of their type"
} else {
    "type is different"
}


struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(number: 1234, numberOfBedrooms: 2)
let house2 = House(number: 1234, numberOfBedrooms: 3)

house1.hashValue
house2.hashValue
let houses = Set([house1, house2])
houses.count

struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(number: 123, numberOfBedrooms: 3)
let house4 = NumberedHouse(number: 123, numberOfBedrooms: 4)
let houses3and4 = Set([house3, house4])

houses3and4.count
houses3and4.first!.numberOfBedrooms
house3.hashValue
house4.hashValue

enum CarPart { //enum hashable by default
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [.roof, .tire, .roof, .trunk]

enum HouseType: Hashable {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(NumberedHouse(number: 123, numberOfBedrooms: 3))
let bigHouse2 = HouseType.bigHouse(NumberedHouse(number: 123, numberOfBedrooms: 3))
let smallHouse1 = HouseType.smallHouse(NumberedHouse(number: 123, numberOfBedrooms: 3))

let houseset = Set([bigHouse1, bigHouse2, smallHouse1])

houseset.count

for value in houseset{
    print(value)
}
