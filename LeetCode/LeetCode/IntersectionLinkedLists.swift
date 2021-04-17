//
//  IntersectionLinkedLists.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/16/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
/*
 Input: intersectVal = 8, listA = [4,1,8,4,5], listB = [5,6,1,8,4,5], skipA = 2, skipB = 3
 Output: Intersected at '8'
 Explanation: The intersected node's value is 8 (note that this must not be 0 if the two lists intersect).
 From the head of A, it reads as [4,1,8,4,5]. From the head of B, it reads as [5,6,1,8,4,5]. There are 2 nodes before the intersected node in A; There are 3 nodes before the intersected node in B.
 */

class IntersectionLinkedLists {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA, b = headB
        while a != nil && b != nil {
            if a == nil {
                a = headB
            } else {
                a = a?.next
            }
            if b == nil {
                b = headA
            } else {
                b = headA
            }
            
        }
        return a
    }
//    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
//        var set = Set<ListNode>()
//        var headA = headA, headB = headB
//        while headA != nil {
//            set.insert(headA!)
//            headA = headA?.next
//        }
//        while headB != nil {
//            if set.contains(headB!){
//                return headB
//            }
//            headB = headB?.next
//        }
//        return nil
//    }
}
