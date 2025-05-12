import Foundation

class Person{
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func increaseAge(){
        self.age += 1
    }
}

let foo = Person(name: "Foo", age: 20)
foo.age
foo.increaseAge()
foo.age

let bar = foo
bar.increaseAge() //Aliasing
foo.age
bar.age

if foo === bar {
    "Foo and Bar point to the same memory"
} else{
    "They don't"
}

class Vehicle {
    func drive() {
        "driving"
    }
}

class Car: Vehicle {
}

let car = Car()
car.drive()

foo.age += 10
bar.age


class Person2 {
    private(set) var age: Int //Can only change value internally
    init(age: Int){
        self.age = age
    }
    func increaseAge(){
        self.age += 1
    }
}

let baz = Person2(age: 20)
//baz.age += 1
baz.increaseAge()


let fooBar = Person2(age: 20)
fooBar.age
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with: fooBar)
fooBar.age
