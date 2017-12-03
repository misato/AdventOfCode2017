//: Day 2 - Advent of Code 2017 http://adventofcode.com/2017/day/2

import Foundation

// Part 1

let test = [[5,1,9,5],
            [7,5,3],
            [2,4,6,8]]


func maxMinDifference(_ input: [Int]) -> Int? {
    guard let max = input.max(), let min = input.min() else {
        return nil
    }
    return max - min
}

func checksum(_ input: [[Int]]) -> Int {
    var sum = 0
    for item in input {
        if let difference = maxMinDifference(item) {
            sum = sum + difference
        }
    }
    return sum
}
print("Part 1: ")
print(checksum(test))
print("-----------")

// Part 2

let test2 = [[5,9,2,8],
             [9,4,7,3],
             [3,8,6,5]]

// Yes, you don't need to do a custom operator, but I wanted to try to do one as a learning experience :)
infix operator %=: MultiplicationPrecedence
extension Int {
    // Returns the division of two numbers if the mod of those is 0
    // Otherwise returns nil
    static func %= (left: Int, right: Int)-> Int? {
        // I had to use Swift.max or min because playgrounds got stupid :(
        let maxNum = Swift.max(left, right)
        let minNum = Swift.min(left, right)
        
        guard maxNum % minNum == 0 else {
            return nil
        }

       return maxNum / minNum
    }
}

func evenlyDivide(_ input: [Int])-> Int {
    var sum = 0
    for i in 0..<input.count {
        for j in i+1..<input.count {
            if let division = input[i]%=input[j] {
                sum = sum + division
            }
        }
    }
    return sum
}


func checksum2(_ input: [[Int]]) -> Int {
    var sum = 0
    for item in input {
        sum = sum + evenlyDivide(item)
    }
    return sum
}

print("Part 2: ")
print(checksum2(test2))
