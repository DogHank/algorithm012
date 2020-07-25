//
//  ValidBST.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 98. 验证二叉搜索树
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。

 假设一个二叉搜索树具有如下特征：

 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 示例 1:

 输入:
     2
    / \
   1   3
 输出: true
 示例 2:

 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。
 */

import Foundation

class ValidBST {
    /// 二叉搜索树中序遍历是升序(左根右)
    /// 辅助栈迭代解法
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        var node: TreeNode? = root
        var tempNodes: [TreeNode] = []
        var lastVal: Int = -Int.max
        while node != nil || !tempNodes.isEmpty {
            while node != nil {
                tempNodes.append(node!)
                node = node?.left
            }
            node = tempNodes.popLast()
            if node != nil {
                // 注意相等的情况不要忽略
                if node!.val <= lastVal {
                    return false
                }
                lastVal = node!.val
            }
            node = node?.right
        }
        return true
    }
    
    /// 递归解法
    var lasValue = -Int.max
    var isBST: Bool = true
    func isValidBST1(_ root: TreeNode?) -> Bool {
        isValidRecursive(root)
        return isBST
    }
    
    func isValidRecursive(_ root: TreeNode?) {
        if root != nil {
            isValidRecursive(root?.left)
            if root!.val <= lasValue {
                isBST = false
                return
            }
            lasValue = root!.val
            isValidRecursive(root?.right)
        }
    }
}
