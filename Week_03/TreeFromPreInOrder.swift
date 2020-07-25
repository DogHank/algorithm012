//
//  TreeFromPreInOrder.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 105. 从前序与中序遍历序列构造二叉树
 根据一棵树的前序遍历与中序遍历构造二叉树。

 注意:
 你可以假设树中没有重复的元素。

 例如，给出

 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7
 */
import Foundation

class TreeFromPreInOrder {
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        if preorder.count == 0 || inorder.count == 0 || preorder.count != inorder.count {
            return nil
        }
        
        var indexMap: [Int: Int] = [:]
        for i in 0 ..< inorder.count {
            indexMap[inorder[i]] = i
        }

        // preorder 根左右
        // inorder 左根右
        let n = inorder.count
        
        return buildTreeRecursive(preorder, inorder, 0, n - 1, 0, n - 1, indexMap)
    }
    // 前序遍历 preorder = [3,9,20,15,7]
    // 中序遍历 inorder = [9,3,15,20,7]
    func buildTreeRecursive(_ preorder: [Int],
                            _ inorder: [Int],
                            _ preIndexStart: Int,
                            _ preIndexEnd: Int,
                            _ inorderStart: Int,
                            _ inorderEnd: Int,
                            _ indexMap: [Int: Int]
    ) -> TreeNode? {
        
        if preIndexStart > preIndexEnd {
            return nil
        }
        
        let rootVal = preorder[preIndexStart]
        let rootIndex = indexMap[rootVal]!
        let sizeLeftTree = rootIndex - inorderStart
        let node: TreeNode = TreeNode.init(rootVal)
        
        node.left = buildTreeRecursive(preorder,
                                       inorder,
                                       preIndexStart + 1,
                                       preIndexStart + sizeLeftTree, // ->  preIndexStart > preIndexEnd
                                       inorderStart,
                                       rootIndex - 1, // ->  sizeLeftTree = rootIndex - inorderStart
                                       indexMap)
        
        node.right = buildTreeRecursive(preorder,
                                        inorder,
                                        preIndexStart + sizeLeftTree + 1,
                                        preIndexEnd, // ->  preIndexStart > preIndexEnd
                                        rootIndex + 1,
                                        inorderEnd, // ->  sizeLeftTree = rootIndex - inorderStart
                                        indexMap)
        
        
        return node
    }
}
