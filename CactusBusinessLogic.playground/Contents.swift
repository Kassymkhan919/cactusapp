import Foundation

let a:Bool = true

if a {
    print("flag is on")
}
var number = 1
number = number.advanced(by: 3)


let array = ["1","2","3"]

for a in array {
    if a == "2" {
        break
    }
    print(a)
}

var dictionary: [String: Int] = ["John" : 2, "Mary" : 3]


/// Return Lowercase of string
func lowercase(from string: String) -> String{
    return string.lowercased()
}

var names = ["John", "Mary"]

//var doubleNames = [String]()

//for name in names {
//    doubleNames.append("double name:\(name)\(name)")
//}
//print(doubleNames)

//let doubleNames:[String] = names.map{
//    if($0 == "John"){
//        return $0
//    }
//    return "\($0)\($0)"
//}

let filteredNames:[String] = names.filter{
    return $0 != "John"
}
//print(filteredNames)

// (String) -> String closure
func map(array:[String], using transform: (String) -> String ) -> [String] {
    var mappedArray = [String]()
    for element in array {
        let mappedElement = transform(element)
        mappedArray.append(mappedElement)
    }
    return mappedArray
}


let doubleNames:[String] = map(array: names) { (element) -> String in
    return "\(element)\(element)"
}
print(doubleNames)


class Person {
    let firstName: String
    let lastName: String
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printFullName() {
        print(firstName + " "+lastName)
    }
}

let johnAppleseed = Person(firstName: "John", lastName: "Appleseed")

johnAppleseed.printFullName()

//class Programmer: Person {
//    let language: String
//
//    init(language: String) {
//        self.language = language
//    }
//
//    override func printFullName() {
//        print("\(super.firstName) \(super.lastName) \(language)")
//    }
//}
//
//let timur = Programmer(firstName: "Timur" , lastName: "T", language: "Swift")


protocol Sounding {
    func sound()
}

class Cat: Sounding {
    func sound() {
        print("meow")
    }
}
let catty = Cat()
catty.sound()
