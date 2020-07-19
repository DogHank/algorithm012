//
//  GroupAnagrams_49.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/18.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class GroupAnagrams_49 {
    
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var indexDic: [String: Int] = [:]
        var results: [[String]] = []
        for str in strs {
            // 字符串排序处理
            let strArr = Array.init(str)
            let sortedStr = String(strArr.sorted())
            // 判断当前字符串是否出现过,如果出现过,取出其存储的下标
            if let idx = indexDic[sortedStr]{
                results[idx].append(str)
            }else {
                // 未出现过,放到数组最后,并存储其下标
                results.append([str])
                indexDic[sortedStr] = results.count - 1
            }
        }
        
        return results
    }
    
}

/*
 49. 字母异位词分组
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。

 示例:

 输入: ["eat", "tea", "tan", "ate", "nat", "bat"]
 输出:
 [
   ["ate","eat","tea"],
   ["nat","tan"],
   ["bat"]
 ]
 说明：

 所有输入均为小写字母。
 不考虑答案输出的顺序。
 */
