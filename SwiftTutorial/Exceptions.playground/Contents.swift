import Foundation

struct Person {
    let firstName: String?
    let lastName: String?
    
    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String{
        switch (firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNamesAreNil
        case (.none, .some):
            throw Errors.firstNameIsNil
        case (.some, .none):
            throw Errors.lastNameIsNil
        case (.some(let firstName), .some(let lastName)):
            return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(firstName: "Foo", lastName: nil)
do {
    let fullName = try foo.getFullName()
}

catch {
    "Got an error = \(error)"
}
