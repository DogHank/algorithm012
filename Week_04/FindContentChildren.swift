//
//  FindContentChildren.swift
//  ALG刷题集
//
//  Created by Billy on 2020/8/1.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 455. 分发饼干
 假设你是一位很棒的家长，想要给你的孩子们一些小饼干。但是，每个孩子最多只能给一块饼干。对每个孩子 i ，都有一个胃口值 gi ，这是能让孩子们满足胃口的饼干的最小尺寸；并且每块饼干 j ，都有一个尺寸 sj 。如果 sj >= gi ，我们可以将这个饼干 j 分配给孩子 i ，这个孩子会得到满足。你的目标是尽可能满足越多数量的孩子，并输出这个最大数值。

 注意：

 你可以假设胃口值为正。
 一个小朋友最多只能拥有一块饼干。

 示例 1:

 输入: [1,2,3], [1,1]

 输出: 1

 解释:
 你有三个孩子和两块小饼干，3个孩子的胃口值分别是：1,2,3。
 虽然你有两块小饼干，由于他们的尺寸都是1，你只能让胃口值是1的孩子满足。
 所以你应该输出1。
 示例 2:

 输入: [1,2], [1,2,3]

 输出: 2

 解释:
 你有两个孩子和三块小饼干，2个孩子的胃口值分别是1,2。
 你拥有的饼干数量和尺寸都足以让所有孩子满足。
 所以你应该输出2.
 */
import Foundation

class FindContentChildren {
    // 双指针解法
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var g = g
        var s = s
        g.sort()
        s.sort()
        var result: Int = 0
        var gi = 0, si = 0
        while gi < g.count && si < s.count {
            if s[si] >= g[gi] {
                result += 1
                gi += 1
            }
            si += 1
        }
        return result
    }
    
}
