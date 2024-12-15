import UIKit

// Mark: Example A

//let professorName: String = "Jal Irani"
//var classSize = 21
////
////// What type is inferred?
//let almostTheAnswer = 21 * 3.14
////
//let a = 21
//let b = 3.14
////
//////Which of these work? One of them has to guess a type...
//let c = a*b
//let c = Double(a)*b


// Mark: Example B

//for value in 0..<10 {
//    print(value)
//}
//
//let exampleArray = ["one", "two", "three"]
//for arrayValue in exampleArray {
//    print("Current Value \(arrayValue)")
//}
//
//for value in 0..<exampleArray.count {
//    print("Current Value \(exampleArray[value])")
//}








// Mark: Example C

//func add(firstNum: Int, secondNum: Int) -> Int {
//    return firstNum + secondNum
//}
//
//add(firstNum: 1, secondNum: 2)


// Mark: Example D

//var location: String?
////print(location)
//
//location = "Baltimore, MD"
////print(location)
//
//if let unwrappedLocation = location {
//    print("location is: \(unwrappedLocation)")
//}


//class XUser {
//    var location: String?
//    var screenName: String?
//}
//
//// Does not work, why?
//class XUser2 {
//    var location: String
//    var screenName: String
//}


//func testOptional(myLocation: String?) {
//    print(myLocation)
//    guard let newLocation = myLocation else { return }
//    print(newLocation)
//}

//location = nil
//testOptional(myLocation: location)
//
//// new Swift shorthand
//if let location {
//  print("location is \(location)")
//}



// Mark: Example E

// Generics are not often used, but good to know them

//func multiply<DataType: Numeric>(num1: DataType, num2: DataType) -> DataType {
//    num1 * num2
//}
//
//multiply(num1: 5, num2: 5)
//multiply(num1: 3.14, num2: 2.5)





// Mark: Example F

//struct Person {
//    var name: String
//    let dob: String
//}
//
//
//class Professor {
//    let person: Person
//    var classesNamesTaught: [String]?
//
//    init(person: Person) {
//        self.person = person
//    }
//}
//
//var professor = Professor(person: Person(name: "Jal", dob: "April24"))









// Mark: Example G

//func subtract(value1: Double, value2: Double) -> Double {
//    return value1 - value2
//}
//
//func add(value1: Double, value2: Double) -> Double {
//    return value1 + value2
//}
//
//func performMath(value1: Double, value2: Double, mathFunction: (Double, Double) -> Double) -> Double {
//    return mathFunction(value1, value2)
//}
//
//performMath(value1: 2, value2: 3, mathFunction: subtract)
//performMath(value1: 2, value2: 3, mathFunction: add)




// Mark: Example H

//let studentNames = ["Jal", "Jen", "Erin"]
//
//enum ExampleErrors: Error {
//    case InvalidQuery
//    case Timeout
//}
//
//func query(name: String) throws -> Bool {
//  if !studentNames.contains(name) {
//      throw ExampleErrors.InvalidQuery
//  }
//  return true
//}
//
//do {
//    try query(name:"Jen")
//} catch {
//    print(error)
//}


// Mark: Example I

//var professor = [
//    "first": "Jal",
//    "last": "Irani",
//    "birthMonth": "April",
//    "website": "jalirani.com",
//    "age": 25
//    // add an int?
//] as [String : Any]
//
//professor["website"]
//professor["birthMonth"]
//professor["age"]
//professor["birthMonth"] = "May"
//professor["birthMonth"]
////
//for (key, value) in professor {
//    print("key: \(key), value: \(value)")
//}





// Mark: Example J

//func split(name: String) -> (firstName: String, lastName: I) {
//    let split = name.components(separatedBy: " ")
//    return (split[0], split[1])
//}
//
//
//let parts = split(name: "Jal Irani")
//parts.0
//parts.1
//parts.firstName
//parts.lastName
