//
//  MaxSumSubmatrix.swift
//  ALG刷题集
//
//  Created by Billy on 2020/8/16.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 363. 矩形区域不超过 K 的最大数值和
 给定一个非空二维矩阵 matrix 和一个整数 k，找到这个矩阵内部不大于 k 的最大矩形和。

 示例:

 输入: matrix = [[1,0,1],[0,-2,3]], k = 2
 输出: 2
 解释: 矩形区域 [[0, 1], [-2, 3]] 的数值和是 2，且 2 是不超过 k 的最大数字（k = 2）。
 说明：

 矩阵内的矩形区域面积必须大于 0。
 如果行数远大于列数，你将如何解答呢？
 */
import Foundation

class MaxSumSubmatrix {
    
    func maxSumSubmatrix(_ matrix: [[Int]], _ k: Int) -> Int {
        var res = Int.min
        let m = matrix.count
        let n = matrix[0].count
        for left in 0 ..< n {
            var rowsSum = [Int](repeating: 0, count: m)
            for right in left ..< n {
                for row in 0 ..< m {
                    rowsSum[row] += matrix[row][right]
                }
                res = max(countSubarraysSmallerThenK(rowsSum, k), res)
            }
        }
        return res
    }
    
    func countSubarraysSmallerThenK(_ arr: [Int], _ k: Int) -> Int {
        var res = Int.min
        for i in 0 ..< arr.count {
            var sum = 0
            for j in i ..< arr.count {
                sum += arr[j]
                if sum > res && sum <= k {
                    res = sum
                }
            }
        }
        return res
    }
}
