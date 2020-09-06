//
//  LongestPalindrome.swift
//  ALGOProblems
//
//  Created by Liang Liao on 2020/9/6.
//  Copyright © 2020 Liang Liao. All rights reserved.
//
/*
 5. 最长回文子串
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"

 */
import Foundation

class LongestRome {
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count >= 2 else {
            return s
        }
        let characters = Array(s)
        var maxLength = 1
        var begin = 0
        var dp = Array(repeating: Array(repeating: false, count: characters.count), count: characters.count )
        for j in 0..<s.count {
            for i in 0..<j {
                if characters[j] == characters[i] {
                    if (j-1) - (i+1) + 1 < 2 {
                        dp[i][j] = true
                    } else{
                        dp[i][j] = dp[i+1][j-1]
                    }
                }
                if (dp[i][j] && j - i + 1 > maxLength) {
                maxLength = j - i + 1;
                begin = i;
                }
            }
        }
        return String(characters[begin..<(begin+maxLength)])
    }
}
