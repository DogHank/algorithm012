//
//  main.swift
//  Week01作业题
//
//  Created by Billy on 2020/7/12.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation


/*
 189. 旋转数组
给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
示例 1:
输入: [1,2,3,4,5,6,7] 和 k = 3
输出: [5,6,7,1,2,3,4]
解释:
向右旋转 1 步: [7,1,2,3,4,5,6]
向右旋转 2 步: [6,7,1,2,3,4,5]
向右旋转 3 步: [5,6,7,1,2,3,4]
示例 2:
输入: [-1,-100,3,99] 和 k = 2
输出: [3,99,-1,-100]
解释:
向右旋转 1 步: [99,-1,-100,3]
向右旋转 2 步: [3,99,-1,-100]
说明:
尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
要求使用空间复杂度为 O(1) 的 原地 算法。
 */

/*
88. 合并两个有序数组
给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。
说明:
初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
示例:
输入:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出: [1,2,2,3,5,6]
*/

class Solution {
    
    /// 第一题
    /// 旋转数组, eg:nums:1234567 k:3
    func rotate(_ nums: inout [Int], _ k: Int) {
        // 获取数组要右移的实质位数
        let n = k % nums.count;
        // 先将整个数组反转7654321
        reverse(&nums, 0, end: nums.count - 1)
        // 将末尾需要提前的数字反转 5674321
        reverse(&nums, 0, end: n - 1 )
        // 最后将后部分恢复 5671234
        reverse(&nums, n , end: nums.count - 1)
    }
    
    /// 首尾数字交换
    func reverse(_ nums: inout [Int], _ start: Int , end: Int) {
        var s = start
        var e = end
        while s < e {
            let temp: Int = nums[s]
            nums[s] = nums[e]
            nums[e] = temp
            s += 1
            e -= 1
        }
    }
    
    /// 第二题
    /// 合并两个有序数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        // 分别算出数组nums1 nums2 以及合并后数组的末位下标
        var i = m - 1
        var j = n - 1
        var k = m + n - 1
        while i >= 0 && j >= 0 {
            // 依次比较nums1 nums2末位.取大值即为合并数组的末位
            if nums1[i] > nums2[j]{
                nums1[k] = nums1[i]
                k -= 1
                i -= 1
            }else{
                nums1[k] = nums2[j]
                k -= 1
                j -= 1
            }
        }
        // 把j剩余数依次入组,若有
        while j >= 0 {
            nums1[k] = nums2[j]
            k -= 1
            j -= 1
        }
    }
    
}
