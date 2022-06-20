import UIKit

var greeting = "Hello, playground References in Swift"
// https://medium.com/@emtiyajali.nitjsr/junior-to-mid-level-ios-interview-questions-part-1-references-aba69c2a3f1f

class CreditCard {
    private let number: Int
    private let dateOfExpiry: String
    private let cardHolderName: String
    private var balance: Float = 0
    
    init(number: Int,
         dateOfExpiry: String,
         cardHolderName: String) {
        self.number = number
        self.dateOfExpiry = dateOfExpiry
        self.cardHolderName = cardHolderName
    }
    
    func payBill(_ amount: Float) {
        balance -= amount
        print("You paid \(amount)")
    }
}

class Person {
    let name: String
    // weak object
    weak var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
        let uniqueNumber = 12344
        let dateOfExpiry = "12 Dec 2030"
        creditCard = CreditCard(number: uniqueNumber,
                                dateOfExpiry: dateOfExpiry,
                                cardHolderName: name)
    }
    
    func payEmiForHouse(amount: Float) {
        creditCard?.payBill(amount)
    }
}

let person = Person(name: "PersonA")
person.payEmiForHouse(amount: 1230) // So the answer to the first question is ……….. nothing. Yes, it won't be printing anything. Pat yourself if you got it right. If you look closely, the person class has a weak reference to the credit card object. As the reference is weak, the credit card object, created in the init function of person class, will be instantly deallocated. Why ? 🤔🤔🤔🤔 An object will stay in the memory if its reference count is greater than one. weak references don't increase the reference count. So the object will be deinitialized instantly.

//-------------------------------------------------------------------------------------------------------------------------
class Pet {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
}

class PersonWithPet {
    weak var pet: Pet?
    
    func makePet() {
        let newPet = Pet(name: "dog")
        self.pet = newPet
    }
}

let personAgain = PersonWithPet()
personAgain .makePet()
print("Pet Name : \(personAgain.pet?.name)") // Here also, the reference to the pet object is weak, but we have assigned a strong object (newPet) to it. So why does it deinitialized? Every reference also has a lifetime, as soon as the reference goes out of the scope the reference count of the object is decreased by one.
