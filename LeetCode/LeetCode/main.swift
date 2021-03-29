//
//  main.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 7/27/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
Using an Xcode Playground, write a program that
- reads the file "/usr/share/dict/web2"
- calculates a number value for all characters on each line
- prints the count of lines that equals a value of 100
- The value of a word is determined by adding the value of the each character.
- The value of the characters are equal to their ascii value
     "a" = 1, "b" = 2, "c" = 3,   ...   "z" = 26
- This is case insensitive - uppercase characters have the same values
     "A" = 1, "B" = 2, "C" = 3,   ...  "Z" = 26
- All other characters have a value of 0.

example: "Mother"
M = 13
o = 15
t = 20
h = 8
e = 5
r = 18
total = 79
 
mother
ttttt
ttttt
mother
tttt
tttttt

The value of "Mother" is not equal to 100, and would not be counted.

How many lines of  "/usr/share/dict/web2" have a value of 100?
Paste your first working solution below. Can your solution be refactored to improve the readability of the code? Please comment, refactor and cleanup your solution in this editor.

*/
class Program{
    
    private let path: String
    
    init(path: String) {
        self.path = path
    }
    
    func processFile(){
        let result = readFile(path)
        let processedStrings = processStrings(strings: result)
        let countOfHundreds = countHundrends(processedStrings)
    }
    
    private func readFile(_ path: String) -> [String] {
        var strings = [String]()
        errno = 0
        if freopen(path, "r", stdin) == nil {
            perror(path)
        } else {
            while let line = readLine() {
                strings.append(line)
            }
        }
        return strings
    }
    private func processStrings(strings: [String]) -> [Int]{
        var asciiValues = [Int]()
        for string in strings {
            let lowerCasedString = string.lowercased()
            let stringAsciiValues =  lowerCasedString.compactMap { value -> UInt8? in
                guard let asciiValue = value.asciiValue else {return 0}
                if asciiValue < 97 {
                    return 0
                } else if asciiValue > 122 {
                    return 0
                } else {
                    return asciiValue - 96
                }
            }
            asciiValues.append(stringAsciiValues.reduce(0, {Int($0) + Int($1)}))
        }
        return asciiValues
    }
    private func countHundrends(_ processedStrings: [Int]) -> Int {
        return processedStrings.filter({$0 == 100}).count
    }
}
let program = Program(path: "/Users/radomyrbezghin/share/dict/web2.js")
program.processFile()




//var path = "/Users/radomyrbezghin/share/dict/web2.js"
//let result = readFile(path)
//let processedStrings = processStrings(strings: result)
//let countOfHundreds = countHundrends(processedStrings)
//print(countOfHundreds)
func readFile(_ path: String) -> [String] {
    var strings = [String]()
    errno = 0
    if freopen(path, "r", stdin) == nil {
        perror(path)
    } else {
        while let line = readLine() {
            strings.append(line)
        }
    }
    return strings
}
func processStrings(strings: [String]) -> [Int]{
    var asciiValues = [Int]()
    for string in strings {
        let lowerCasedString = string.lowercased()
        let stringAsciiValues =  lowerCasedString.compactMap { value -> UInt8? in
            guard let asciiValue = value.asciiValue else {return 0}
            if asciiValue < 97 {
                return 0
            } else if asciiValue > 122 {
                return 0
            } else {
                return asciiValue - 96
            }
        }
        asciiValues.append(stringAsciiValues.reduce(0, {Int($0) + Int($1)}))
    }
    return asciiValues
}
func countHundrends(_ processedStrings: [Int]) -> Int {
    return processedStrings.filter({$0 == 100}).count
}
var path = "/Users/share/dict/web2"
let result = readFile(path)
let processedStrings = processStrings(strings: result)
let countOfHundreds = countHundrends(processedStrings)
print(countOfHundreds)
