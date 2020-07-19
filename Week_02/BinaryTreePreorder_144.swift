
//
//  BinaryTreePreorder_144.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/18.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class BinaryTreePreorder_144 {
    
    // MARK: 递归解法(根->左->右)
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var results: [Int] = []
        preorder(root, &results)
        return results
    }
    
    func preorder(_ root: TreeNode?, _ results: inout [Int]){
        
        if root != nil {
            results.append(root!.val)
            if root!.left != nil {
                preorder(root?.left, &results)
            }
            if root!.right != nil {
                preorder(root?.right, &results)
            }
        }
    }
    
    // MARK: - 迭代解法
    func preorderTraversalIteration(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var results: [Int] = []
        var tempNodes: [TreeNode] = [root!]
        while let node = tempNodes.popLast() {
            results.append(node.val)
            
            if node.right != nil {
                tempNodes.append(node.right!)
            }
            if node.left != nil {
                tempNodes.append(node.left!)
            }
        }
        
        return results
    }
    
    
}

/*
 144. 二叉树的前序遍历
 给定一个二叉树，返回它的 前序 遍历。

  示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */
