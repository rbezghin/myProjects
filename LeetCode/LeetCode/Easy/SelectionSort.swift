//
//  SelectionSort.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 1/5/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//

import Foundation
class SelectionSort {
    func selectionSort(array: inout [Int]) -> [Int] {
        for i in 0 ..< array.count{
            var minIndex = i
            for j in i+1 ..< array.count{
                if array[j] < array[minIndex]{
                    minIndex = j
                }
            }
            let temp = array[i]
            array[i] = array[minIndex]
            array[minIndex] = temp
        }

        return array
    }
}
/*
    for i in array 0 to n-1
        smallest index = i
        for j in i+1 to n-1
            if array[j] < array[smallest]
            smallest = j
        swap i, smallest
    
     
 */
