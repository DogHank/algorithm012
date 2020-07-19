//
//  BinaryTreeInorder_94.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/18.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class BinaryTreeInorder_94 {
    
    // MARK - 递归解法(左->根->右)
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        
        var results: [Int] = []
        inorder(root, &results)
        return results
    }
    
    func inorder(_ root: TreeNode?, _ results: inout [Int]){
        
        if root != nil {
            if root!.left != nil {
                inorder(root?.left, &results)
            }
            results.append(root!.val)
            
            if root!.right != nil {
                inorder(root?.right, &results)
            }
        }
    }
    
    // MARK - 迭代解法
    func inorderTraversalIteration(_ root: TreeNode?) -> [Int] {
        if root == nil {
            return []
        }
        var results: [Int] = []
        var node: TreeNode? = root
        var tempNodes: [TreeNode] = []
        while node != nil || !tempNodes.isEmpty {
            // 首次进来把根节点和左节点全部入栈,后面再进就是压右节点
            while node != nil {
                tempNodes.append(node!)
                node = node?.left
            }
            
            node = tempNodes.popLast()
            if node != nil {
                results.append(node!.val)
            }
            node = node?.right
        }
        
        return results
    }
    
}
//
/*
 94. 二叉树的中序遍历
 给定一个二叉树，返回它的中序 遍历。
 
 示例:
 
 输入: [1,null,2,3]
 1
 \
 2
 /
 3
 
 输出: [1,3,2]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */
