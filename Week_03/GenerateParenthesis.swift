//
//  GenerateParenthesis.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 22. 括号生成
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

  

 示例：

 输入：n = 3
 输出：[
        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
      ]
 通过次数153,305提交次数202,141
 */
import Foundation

class GenerateParenthesis {
    
    func generateParenthesis(_ n: Int) -> [String] {
        
        var results: [String] = []
        generateRecursive(n, 0, 0, "", &results)
        
        return results
    }
    
    func generateRecursive(_ n: Int, _ left: Int, _ right: Int, _ currentStr: String, _ results: inout [String]) {
        
        if left == n && right == n {
            results.append(currentStr)
            return
        }
        
        if left < n {
            generateRecursive(n, left + 1, right, currentStr + "(", &results)
        }
        
        if right < left {
            generateRecursive(n, left, right + 1, currentStr + ")", &results)
        }
        
    }
    
}
