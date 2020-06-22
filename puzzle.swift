//
//  main.swift
//  HW3
//
//  Created by atena on 6/22/20.
//  Copyright © 2020 atena. All rights reserved.
//

import Foundation

let input = readLine()
let words = input?.components(separatedBy: " ")
var N = 0
var M = 0

let input2 = readLine()
if let input2 = input2 {
    let inputNumberCharacters = input2.split(separator: " ")
    let numbers = inputNumberCharacters.map { Int(String($0))! }
    M = numbers[0]
    N = numbers[1]
}

var table: [[String]] = []

for _ in 1...M {
    let row: [String] = readLine()!.split(separator: " ").map({ (substring) in return String(substring)})
    table.append(row)
    
}

print(table)
