//
//  Subsets.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 78. 子集
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。

 说明：解集不能包含重复的子集。

 示例:

 输入: nums = [1,2,3]
 输出:
 [
   [3],
   [1],
   [2],
   [1,2,3],
   [1,3],
   [2,3],
   [1,2],
   []
 ]
 */
import Foundation

class Subsets {
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var tempNums: [Int] = []
        subBacktracing(nums, 0, &tempNums, &results)
        return results
    }
    
    func subBacktracing(_ nums: [Int], _ start: Int, _ tempNums: inout [Int], _ results: inout [[Int]]){
        results.append(tempNums)
        
        for i in start ..< nums.count {
            tempNums.append(nums[i])
            subBacktracing(nums, i + 1, &tempNums, &results)
            tempNums.removeLast()
        }
        
    }
}
