//
//  Stack.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 11/30/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation

struct Stack<T>{
    
    var list = [T]()
    
    mutating func push(element: T){
        list.append(element)
    }
    mutating func pop() -> T? {
        if !isEmpty(){
            return list.popLast()
        }
        else{
            return nil
        }
    }
    func isEmpty() -> Bool {
        return list.isEmpty
    }
    
}
