//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/13/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation

  //Definition for singly-linked list.

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }
extension ListNode: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        hasher.combine(self)
    }
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs === rhs
    }
}
/*
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 
 carryOver = false
 while l1 != nil l2 != nil
 iterate over two linked lists one node at a time
 add values and carry over a 1 if more than 9
 
 while l1 != nil add remaining elements
 while l2 != nil add remaining elements
 if carryOver <- create new node and add it to the end
 
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var carryOver = 0
        let preHeadPointer: ListNode? = ListNode()
        var l1 = l1, l2 = l2, current = preHeadPointer
        
        while l1 != nil || l2 != nil {
            let val1 = l1?.val ?? 0
            let val2 = l2?.val ?? 0
            let sum = val1 + val2 + carryOver
            //new sum and carry over
            carryOver = sum / 10
            current?.next = ListNode(sum % 10)
            current = current?.next
            l1 = l1?.next; l2 = l2?.next
        }
        //one or both list reched the end
        if carryOver != 0 {
            current?.next = ListNode(carryOver)
        }
        
        return preHeadPointer?.next
    }
}
