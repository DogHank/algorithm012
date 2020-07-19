//
//  ValidAnagram_242.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/18.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class ValidAnagram_242 {
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        // 计算小写字母a的ASC码
        let aInt: Int = Int("a".unicodeScalars.first!.value)
        // 小写字母有26个,所以其ASC码值减去aInt即对应0-25
        // 用数组存对应字母出现的频率
        var numbers: [Int] = Array(repeating: 0, count: 26)
        // 频率检验
        for c in s {
            numbers[Int(c.unicodeScalars.first!.value) - aInt] += 1
        }
        for c in t {
            numbers[Int(c.unicodeScalars.first!.value) - aInt] -= 1
        }
        //
        for v in numbers {
            if v != 0 {
                return false
            }
        }
        return true
    }
}

/*
 242. 有效的字母异位词
 给定两个字符串 s 和 t ，编写一个函数来判断 t 是否是 s 的字母异位词。

 示例 1:

 输入: s = "anagram", t = "nagaram"
 输出: true
 示例 2:

 输入: s = "rat", t = "car"
 输出: false
 说明:
 你可以假设字符串只包含小写字母。
 */
