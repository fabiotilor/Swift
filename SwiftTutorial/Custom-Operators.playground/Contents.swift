import Foundation

let firstName: String? = "foo "
let lastName: String? = "bar"
let fullName = firstName + lastName

func + (lhs: String?, rhs: String?) -> String? {
    switch(lhs, rhs){
    case (.none, .none):
        return nil
    case let (.some(value), .none):
        return value
    case let (.none, .some(value)):
        return value
    case let (.some(lhs), .some(rhs)):
        return lhs + rhs
    }
}

prefix operator ^
prefix func ^(value: String) -> String {
    value.uppercased()
}

let lowercaseName = "Foo Bar"
let uppercaseName = ^lowercaseName

let withStars = lowercaseName*

postfix operator *
postfix func *(value: String) -> String {
    "*** " + value + " ***"
}

func + (lhs: Person, rhs: Person) -> Family {
    Family(members: [lhs, rhs])
}

func + (lhs: Family, rhs: Person) -> Family {
    var members = family.members
    members.append(rhs)
    return Family(members: members)
}

func + (lhs: Family, rhs: [Person]) -> Family {
    var members = lhs.members
    members.append(contentsOf: rhs)
    return Family(members: members)
}

struct Person {
    let name: String
}
struct Family {
    let members: [Person]
}

let mom = Person(name: "mom")
let dad = Person(name: "dad")
let son = Person(name: "son")
let daughter1 = Person(name: "daughter1")
let daughter2 = Person(name: "daughter2")

let family = mom + dad
family.members.count
let familywithson = family + son
family.members.count

let familyWithDaughters = familywithson + [daughter1, daughter2]

familyWithDaughters.members.count
