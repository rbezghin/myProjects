//
//  GroupAnagrams.swift
//  LeetCode
//
//  Created by Radomyr Bezghin on 4/12/21.
//  Copyright © 2021 Radomyr Bezghin. All rights reserved.
//
/*
 Runtime: O(n k log k)
 Space: O(nk) n string with length k
 
 Input: strs = ["eat","tea","tan","ate","nat","bat"]
 Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
 
 create map sotredString : Array of strings
 
 for string in array <- O(n) where n is nubmer of strings
    copy = string
    sort copy O(klogk) where k is legnth of the string
    if copy not in map add it with value as string
    else add new string for that copy
 
 return map.values
 */
import Foundation

class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        for string in strs {
            let sortedString = String(string.sorted())
            if map[sortedString] == nil {
                map[sortedString] = [string]
            } else {
                map[sortedString]?.append(string)
            }
        }
        return map.compactMap({$0.value})
    }
}
