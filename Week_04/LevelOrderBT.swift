//
//  LevelOrderBT.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/28.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 102. 二叉树的层序遍历
 给你一个二叉树，请你返回其按 层序遍历 得到的节点值。 （即逐层地，从左到右访问所有节点）。

  
 示例：
 二叉树：[3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回其层次遍历结果：

 [
   [3],
   [9,20],
   [15,7]
 ]
 通过次数167,497提交次数265,402
 */
import Foundation

class LevelOrderBT {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        var results: [[Int]] = []
        levelRecursive(root, 1, &results)
        return results
    }
    
    func levelRecursive(_ root: TreeNode?, _ level: Int, _ results: inout [[Int]]) {
        if let root = root {
            if results.count < level {
                results.append([])
            }
            results[level - 1].append(root.val)
            levelRecursive(root.left, level + 1, &results)
            levelRecursive(root.right, level + 1, &results)
        }
    }
}
