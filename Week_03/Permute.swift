//
//  Permute.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/26.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 46. 全排列
 给定一个 没有重复 数字的序列，返回其所有可能的全排列。

 示例:

 输入: [1,2,3]
 输出:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]
 */
import Foundation

class Permute {
    /// DFS 回溯算法
    func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var tempNums: [Int] = []
        var hashSet: Set<Int> = Set<Int>(minimumCapacity: nums.count)
        permuteBacktracing(nums, 0, &hashSet, &tempNums, &results)
        return results
    }

    func permuteBacktracing(_ nums: [Int],
                            _ depth: Int,
                            _ hashSet: inout Set<Int>,
                            _ tempNums: inout [Int],
                            _ results: inout [[Int]]) {
        if tempNums.count == nums.count {
            results.append(tempNums)
            return
        }
        
        for i in 0 ..< nums.count {
            if hashSet.contains(i) == false {
                tempNums.append(nums[i])
                hashSet.insert(i)
                permuteBacktracing(nums, depth + 1, &hashSet, &tempNums, &results) // 开辟下一重循环
                tempNums.removeLast()
                hashSet.remove(i) // 状态恢复
            }
            
        }
        
    }
    
    
}
