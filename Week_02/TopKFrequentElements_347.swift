//
//  TopKFrequentElements_347.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/19.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class TopKFrequentElements_347 {
    
    // MARK: 前 K 个高频元素
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        // 声明一个字典统计nums中元素出现的次数
        var countDic: [Int: Int] = [:]
        for e in nums {
            countDic[e, default: 0] += 1 // 注意初始化一个字典默认值为0的写法
        }
        // 将字典转化为元组数组
        var countArray: [(element: Int, count: Int)] = []
        countDic.forEach { (e,c) in
            countArray.append((e,c))
        }
        // 元组数组排序
        countArray.sort { (e1, e2) -> Bool in
            return e1.count > e2.count
        }
        
        var results: [Int] = []
        for i in 0 ..< k {
            results.append(countArray[i].element)
        }
        return results
    }
    
}


/*
// MARK: 347. 前 K 个高频元素
给定一个非空的整数数组，返回其中出现频率前 k 高的元素。

 

示例 1:

输入: nums = [1,1,1,2,2,3], k = 2
输出: [1,2]
示例 2:

输入: nums = [1], k = 1
输出: [1]
 

提示：

你可以假设给定的 k 总是合理的，且 1 ≤ k ≤ 数组中不相同的元素的个数。
你的算法的时间复杂度必须优于 O(n log n) , n 是数组的大小。
题目数据保证答案唯一，换句话说，数组中前 k 个高频元素的集合是唯一的。
你可以按任意顺序返回答案。
*/
