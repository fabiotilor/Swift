import Foundation

func tester(){
    "Hello World!"
}

tester()

func plusTwo(value: Int){
    let newValue = value + 2
}

func pIusTwo(value: Int) -> Int{
    return value + 2
    // value + 2 does implicitly return
}

plusTwo(value: 30)
pIusTwo(value: 38)

//_ makes it that customMinus(lhs: 100, rhs: 20) turns into customMinus(100, 20)
func customMinus(_ lhs: Int, _ rhs: Int) -> Int{
    lhs - rhs
}

let customSubtracted = customMinus(100, 20)

@discardableResult //
func myCustomAdd(_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
}

myCustomAdd(20, 30)

func doSomething(with value: Int = 70) -> Int{
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    return mainLogic(value: value + 3)
}
doSomething()
 
