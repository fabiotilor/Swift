import Foundation

var name = "Fabio"
let othername = "Chiara"

name = othername
 
var names = [name, othername]

names.append("fritz")

let oldArray = NSMutableArray(
    array: ["Foo", "Bar"]
)

oldArray.add("Baz")

func changeTheArray(_ array: NSArray){
    let copy = array as! NSMutableArray
    copy.add("Baz")
}

changeTheArray(oldArray)
oldArray
