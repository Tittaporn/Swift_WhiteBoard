import UIKit

var greeting = "Hello, WhiteBoard Challenge on June 01, 2022"

func challengeOf(_ info: String) {
    print("\n------------------------------------------ Hacker Rank ------------------------------------------")
    print(info)
    print("-------------------------------------------------------------------------------------------------\n")
}

challengeOf("""
 Remitly helps customers make international money transfers easily. And to do that,
 we move money between accounts to make sure their balances are not below some threshold.
 This is to make sure we have enough funds to pay out our customers.
 
 Example:
 Let's say our threshold is 100, and some of our bank account's balances are above and
 some are below. How do you transfer money between them so that they all have at least 100?
 
 Current account's balance:
 Acct1: 130
 Acct2: 90
 Acct3: 120
 Acct4: 70
 
 Potential Output:
 Acct1 -> Acct2: 10
 Acct1 -> Acct4: 20
 Acct3 -> Acct4: 10
 
 Problem:
 Implement a function that takes two inputs
 * accounts (dictionary/map)
 * threshold (integer)
 
 And prints the transfers you would make to make the accounts meet the threshold.
 
""")

func transfer(account: [String: Int], threshold: Int) {
    var accountDict = account
    print("START --> accountDict : \(accountDict) at \(#line)")
    // 1) Go inside dictionary
    for (kOfCurrentAccount, valueOfCurrentAccount)  in accountDict {
        // print("kOfCurrentAccount : \(kOfCurrentAccount) | valueOfCurrentAccount : \(valueOfCurrentAccount) at \(#line)")
        
        // 2) If value of currentAccount less than threshold then using while loop
        var accountValue = valueOfCurrentAccount
        while accountValue < threshold {
            
            // 3) Use for loop to go inside another account and see the available transfer value
            for (kOfAccountToTransfer, valueInAccountToTransfer)  in accountDict {
                if kOfCurrentAccount != kOfAccountToTransfer {
                    
                    let transferAmountAvailable = valueInAccountToTransfer - threshold
                    let currentAmountRequiredForThreshold = threshold - accountValue
                    // print("kOfCurrentAccount : \(kOfCurrentAccount) | valueOfCurrentAccount : \(valueOfCurrentAccount)  | kOfAccountToTransfer : \(kOfAccountToTransfer) | valueInAccountToTransfer : \(valueInAccountToTransfer)  | transferAmountAvailable \(transferAmountAvailable) | currentAmountRequiredForThreshold \(currentAmountRequiredForThreshold) at \(#line)")
                    
                    // 4) if transfer amount available is greater than 0 and current required is not 0 then we start to transfer
                    if transferAmountAvailable > 0 && currentAmountRequiredForThreshold != 0 {
                        // 5) if current amount required for threshold less than available amount to transfer then we transfer the amount required.
                        if currentAmountRequiredForThreshold < transferAmountAvailable  {
                            accountDict[kOfAccountToTransfer] = valueInAccountToTransfer - currentAmountRequiredForThreshold
                            accountDict[kOfCurrentAccount] =  accountValue + currentAmountRequiredForThreshold
                            accountValue =  accountValue + currentAmountRequiredForThreshold
                            print("\(kOfAccountToTransfer) -> \(kOfCurrentAccount) : \(currentAmountRequiredForThreshold)  at \(#line)")
                        } else {
                            // 6) if current amount required for threshold more than available amount to transfer then we transfer the all available amount.
                            accountDict[kOfAccountToTransfer] = valueInAccountToTransfer - transferAmountAvailable
                            accountDict[kOfCurrentAccount] =  accountValue + transferAmountAvailable
                            accountValue =  accountValue + transferAmountAvailable
                            print("\(kOfAccountToTransfer) -> \(kOfCurrentAccount) : \(transferAmountAvailable)  at \(#line)")
                        }
                    } // End of if valueInAccountToTransfer > threshold
                } // End of if kOfCurrentAccount != kOfAccountToTransfer
            } // End of For loop --> loop in all accounts
        } // End of While valueOfCurrentAccount < threshold
    } // End of For loop --> loop in all accounts to see the if amount more than threshold
    print("END --> accountDict : \(accountDict) at \(#line)")
}

let accountDict = ["Acct1": 130,
                   "Acct2": 90,
                   "Acct3": 120,
                   "Acct4": 70]
transfer(account: accountDict, threshold: 100)

/* Input Current account's balance:
 Acct1: 130
 Acct2: 90
 Acct3: 120
 Acct4: 70
 
 Potential Output:
 Acct1 -> Acct2: 10
 Acct1 -> Acct4: 20
 Acct3 -> Acct4: 10
 */

