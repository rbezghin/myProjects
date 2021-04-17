//
//  OddEvenLinkedList.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/14/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Input: head = [1,2,3,4,5]
 Output: [1,3,5,2,4]
 */

import Foundation
class OddEvenLinkedList {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var oddPtr = head
        var evenPtr = head?.next
        let evenHead = evenPtr
        while evenPtr != nil && evenPtr?.next != nil {
            oddPtr?.next = oddPtr?.next?.next
            evenPtr?.next = evenPtr?.next?.next
            oddPtr = oddPtr?.next
            evenPtr = evenPtr?.next
        }
        oddPtr?.next = evenHead
        return head
    }
}
