//
//  InvertTree.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//

/*
 226. 翻转二叉树
 翻转一棵二叉树。

 示例：

 输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 输出：

      4
    /   \
   7     2
  / \   / \
 9   6 3   1
 */

import Foundation


class InvertTree {
    
    @discardableResult
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root != nil {
            var temp: TreeNode? = nil
            temp = root?.left
            root?.left = root?.right
            root?.right = temp
            
            invertTree(root?.left)
            invertTree(root?.right)
        }
        
        return root
    }
    
    
}
