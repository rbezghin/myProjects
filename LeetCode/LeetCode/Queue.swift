//
//  Queue.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 11/30/20.
//  Copyright © 2020 Radomyr Bezghin. All rights reserved.
//

import Foundation

struct Queue<T>{
    
    var list = [T]()
    
    mutating func enqueue(element: T){
        list.append(element)
    }
    mutating func dequeue() -> T? {
        if !isEmpty(){
            return list.remove(at: 0)
        }
        else{
            return nil
        }
    }
    func isEmpty() -> Bool {
        return list.isEmpty
    }
    
}
