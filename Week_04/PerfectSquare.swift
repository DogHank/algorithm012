//
//  PerfectSquare.swift
//  ALG刷题集
//
//  Created by Billy on 2020/8/1.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 367. 有效的完全平方数
 给定一个正整数 num，编写一个函数，如果 num 是一个完全平方数，则返回 True，否则返回 False。

 说明：不要使用任何内置的库函数，如  sqrt。

 示例 1：

 输入：16
 输出：True
 示例 2：

 输入：14
 输出：False
 */

import Foundation

class PerfectSquare {
    // 牛顿迭代法
    func isPerfectSquare(_ num: Int) -> Bool {
        if num < 2 { return true }
        var x = num / 2
        while x * x > num {
            x = (x + num / x) / 2
        }
        return x * x == num
    }
    
    // 二分法
    func isPerfectSquare1(_ num: Int) -> Bool {
        if num < 2 { return true }
        var l = 0, r = num
        while l <= r {
            let mid = l + (r - l) / 2
            let square = mid * mid
            if square == num {
                return true
            } else if square > num {
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return false
    }
}
