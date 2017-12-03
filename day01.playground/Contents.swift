//: Playground - noun: a place where people can play

import Foundation

// PART 1
let test1 = "1122"
let test2 = "1111"
let test3 = "1234"
let test4 = "91212129"
let testCases = [test1, test2, test3, test4]

extension String {
    // Estension to get a character in an specific index.
    // This probably can be done as well with overloading or custom operators?
    func charAt(_ charIndex: Int) -> Character {
        let index = self.index(self.startIndex, offsetBy: charIndex)
        return self[index]
    }
}

func captcha(_ input: String) -> String {
    var sum = 0
    for i in 0..<input.count {
        let first = input.charAt(i)
        let second = (i+1 >= input.count) ? input.charAt(0) : input.charAt(i+1)

        if first == second {
            sum = sum + Int(String(first))!
        }
    }

    return String(sum)
}

print("Part 1 tests:")
for item in testCases {
    print(item)
    print(captcha(item))
}
print("------------")

// PART 2
let test21 = "1212"
let test22 = "1221"
let test23 = "123425"
let test24 = "123123"
let test25 = "12131415"
let test2Cases = [test21, test22, test23, test24, test25]

func captcha2(_ input: String) -> String {
    var sum = 0
    let positions = input.count / 2

    for i in 0..<input.count {
        let first = input.charAt(i)
        
        var startPosition = 0
        if i + positions >= input.count {
            startPosition = (i+positions) - input.count
        }
        
        let second = (i+positions >= input.count) ? input.charAt(startPosition) : input.charAt(i+positions)

        if first == second {
            sum = sum + Int(String(first))!
        }
    }
    
    return String(sum)
}

print("Part 2 tests:")
for item in test2Cases {
    print(item)
    print(captcha2(item))
}


