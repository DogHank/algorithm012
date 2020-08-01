//
//  MySqrt.swift
//  ALG刷题集
//
//  Created by Billy on 2020/8/1.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 69. x 的平方根
 实现 int sqrt(int x) 函数。

 计算并返回 x 的平方根，其中 x 是非负整数。

 由于返回类型是整数，结果只保留整数的部分，小数部分将被舍去。

 示例 1:

 输入: 4
 输出: 2
 示例 2:

 输入: 8
 输出: 2
 说明: 8 的平方根是 2.82842...,
      由于返回类型是整数，小数部分将被舍去。
 */
import Foundation

class MySqrt {
    
    // 牛顿迭代法
    func mySqrt(_ x: Int) -> Int {
        if x < 2 { return x }
        var r = x / 2
        while r * r > x {
            r = (r + x / r) / 2
        }
        return r
    }
    
    // 二分法
    func mySqrt1(_ x: Int) -> Int {
        if x < 2 { return x }
        var l = 0, r = x, res = -1
        while l <= r {
            let mid = l + (r - l) / 2
            if mid * mid <= x {
                res = mid
                l = mid + 1
            }else {
                r = mid - 1
            }
        }
        return res
    }
    
}
