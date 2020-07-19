//
//  TwoSum_1.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/18.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class TwoSum_1 {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
        // 创建一个以num为key,下标为value的map
        var tempDic: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            // 为空说明此时的map中还没有当前num + xx == target的num
            if tempDic[target - num] == nil {
                // 把当前num及其下标存到map中
                tempDic[num] = i
            }else {
                // map中找到了满足条件的num.直接返回下标
                return [i, tempDic[target - num]!]
            }
        }
        
        return []
    }
    
    
    
}
/*
 1. 两数之和
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

  
 示例:

 给定 nums = [2, 7, 11, 15], target = 9

 因为 nums[0] + nums[1] = 2 + 7 = 9
 所以返回 [0, 1]
 */
