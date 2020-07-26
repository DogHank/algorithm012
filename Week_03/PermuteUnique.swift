//
//  PermuteUnique.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/26.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 47. 全排列 II
 给定一个可包含重复数字的序列，返回所有不重复的全排列。

 示例:

 输入: [1,1,2]
 输出:
 [
   [1,1,2],
   [1,2,1],
   [2,1,1]
 ]
 通过次数73,885提交次数124,270
 */
import Foundation

class PermuteUnique {
    /// 回溯解法 + 利用排序去重剪枝
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var tempNums: [Int] = []
        var hashSet: Set<Int> = Set<Int>(minimumCapacity: nums.count)
        var nums = nums
        nums.sort()
        permuteUniqueBacktracing(nums, 0, &hashSet, &tempNums, &results)
        return results
    }
    
    func permuteUniqueBacktracing(_ nums: [Int],
                                  _ depth: Int,
                                  _ hashSet: inout Set<Int>,
                                  _ tempNums: inout [Int],
                                  _ results: inout [[Int]] ) {
        
        if tempNums.count == nums.count {
            results.append(tempNums)
            return
        }
        
        for i in 0 ..< nums.count {
            // 去重
            if i > 0 && nums[i] == nums[i-1] && hashSet.contains(i-1) == false {
                continue
            }
            
            if hashSet.contains(i) == false {
                tempNums.append(nums[i])
                hashSet.insert(i)
                permuteUniqueBacktracing(nums, depth + 1, &hashSet, &tempNums, &results)
                tempNums.removeLast()
                hashSet.remove(i)
            }
        }
        
    }
    
}
