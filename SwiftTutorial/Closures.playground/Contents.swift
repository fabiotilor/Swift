import Foundation
/*
func add(_ lhs: Int, _ rhs: Int) -> Int {
    return lhs + rhs
}
*/

let add: (Int, Int) -> Int = {(lhs: Int, rhs: Int) -> Int in
    return lhs + rhs
}
add(20,30)

func customAdd(_ lhs: Int, _ rhs: Int, using function: (Int, Int) -> Int) -> Int {
    function(lhs, rhs)
}

customAdd(20,30) {$0 + $1}

let ages = [20,30,40,50]
ages.sorted(by: <)
