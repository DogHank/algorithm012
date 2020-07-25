//
//  Combine.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 77. 组合
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

 示例:

 输入: n = 4, k = 2
 输出:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 */
import Foundation
// [1,2,3,4] 2
class Combine {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var results: [[Int]] = []
        var tempNums: [Int] = []
        backtracing(n, k, 1, &tempNums, &results)
        return results
    }
    
    func backtracing(_ n: Int, _ k: Int, _ start: Int, _ tempNums: inout [Int], _ results: inout [[Int]]) {
        if tempNums.count == k {
            results.append(tempNums)
            return
        }
        if start > n {
            return
        }
        for i in start ... n {
            tempNums.append(i)
            backtracing(n, k, i + 1, &tempNums, &results)
            tempNums.removeLast()
        }
    }
}


