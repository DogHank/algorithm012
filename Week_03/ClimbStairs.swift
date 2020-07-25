//
//  ClimbStairs.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//

/*
 70. 爬楼梯
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶
 */
import Foundation

class ClimbStairs {
    
    /// 递归+memory解法
    func climbStairs(_ n: Int) -> Int {
        
        var memory: [Int: Int] = [:]
    
        return climb(n, &memory)
    }
    
    func climb(_ n: Int, _ memory: inout [Int: Int]) -> Int {
        
        if memory[n] != nil {
            return memory[n]!
        }
        if n < 3 {
            return n
        }
        
        memory[n] = climb(n - 1, &memory) + climb(n - 2, &memory)
        
        return memory[n]!
    }
    
    
    /// 临时变量递进解法
    func climbStairs1(_ n: Int) -> Int {
        if n < 3 {
            return n
        }
        var f1 = 1, f2 = 2, f3 = 3
        for _ in 3 ... n {
            f3 = f1 + f2
            f1 = f2
            f2 = f3
        }
        return f3
    }
    
}
