//
//  MinStack.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/6/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

//Implement the MinStack class:
//MinStack() initializes the stack object.
//void push(val) pushes the element val onto the stack.
//void pop() removes the element on the top of the stack.
//int top() gets the top element of the stack.
//int getMin() retrieves the minimum element in the stack.

/*
 Solution
 Min stack - min element must be always on top, so stack must be always sorted with smallest on top and largest on the bottom
 
 we can implement this with an array DS
 [x,x,x] <- pop
 push -
 if array is empty add it to the array
 else
 start at the beginning of the array while element is larger than current element
 move index until the end or untill position is found
 
 pop
 return an element from the end of array
 
 */

class MinStack {
    
    var stack: [(val: Int, min: Int)]

    /** initialize your data structure here. */
    init() {
        stack = []
    }
    
    func push(_ val: Int) {
        stack.append((val, min(val, stack.last?.min	?? val)))
    }
    
    func pop() {
        stack.popLast()
    }
    
    func top() -> Int {
        return stack.last!.val
    }
    
    func getMin() -> Int {
        return stack.last!.min
    }
}

