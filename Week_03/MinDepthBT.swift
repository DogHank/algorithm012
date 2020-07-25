//
//  MinDepthBT.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 111. 二叉树的最小深度
 给定一个二叉树，找出其最小深度。

 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。

 说明: 叶子节点是指没有子节点的节点。

 示例:

 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回它的最小深度  2.
 */
import Foundation

class MinDepthBT {
    func minDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        
        if root.left == nil && root.right == nil {
            return 1
        }
        
        var minCount = Int.max
        if let left = root.left {
            minCount = min(minDepth(left), minCount)
        }
        if let right = root.right {
            minCount = min(minDepth(right), minCount)
        }
        
        return minCount + 1
    }
}
