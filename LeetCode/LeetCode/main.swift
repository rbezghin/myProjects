//
//  main.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 7/27/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation


//print(Fib.getNthFibIterative(n: 6))
//print(FindThreeLargestNumbers().findThreeLargestNumbers(array: [10,5,9,10,12]))


let array = [1, 2, 3, 3, 4, 0, 10, 6, 5, -1, -3, 2, 3]
let array1 = [3, 3, 4, 0, 10, 6, 5, -1, -3, 2, 3]
var array2 = [1, 2, 3, 4, 3,1]

//print(FirstDuplicateValue().firstDuplicateValueSpacy(&array2))

let bst = ValidateBST.BST(value: 10)
bst.insert(value: 5)
bst.insert(value: 15)
bst.insert(value: 2)
bst.insert(value: 5)
bst.insert(value: 1)
bst.insert(value: 11)
bst.insert(value: 22)
print(ValidateBST().validateBst(tree: bst))
//bst.printTree()
//b//st.remove(value: 5, parentNode: nil)/
//bst.printTree()
//print(bst.contains(value: 10))





