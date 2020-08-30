//
//  MergeIntervals.swift
//  ALGOProblems
//
//  Created by Liang Liao on 2020/8/30.
//  Copyright © 2020 Liang Liao. All rights reserved.
//

import Foundation
// 合并区间
func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.count <= 1 {
        return intervals
    }
    var list = intervals
    quickSort(&list, start : 0 , end: intervals.count - 1)
    var i : Int = 1
    while i < list.count {
        let last = list[i - 1]
        if list[i].last! < last.last! {
            list.remove(at : i)
        } else if list[i].first! <= last.last! {
            list[i - 1] = [last.first!, list[i].last!]
            list.remove(at : i)
        } else {
            i += 1
        }
    }
    return list
}

func quickSort(_ list : inout [[Int]], start : Int , end : Int) {
    var i = start
    var j = end
    if i < j {
        let sentinel = list[i]
        
        while i != j {
            while i < j && list[j].first! >= sentinel.first! {
                j -= 1
            }
            list[i] = list[j]
            
            while i < j && list[i].first! <= sentinel.first! {
                i += 1
            }
            list[j] = list[i]
        }
        
        list[i] = sentinel
        quickSort(&list, start: start ,end : j - 1)
        quickSort(&list, start: i + 1, end : end)
    }
    
}
