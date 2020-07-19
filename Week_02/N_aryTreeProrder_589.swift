//
//  N_aryTreeProrder_589.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/18.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class N_aryTreeProrder_589{
    
    // MARK: 递归解法
    func preorder(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }
        var results: [Int] = []
        order(root, &results)
        return results
    }
    
    func order(_ root: Node?, _ results: inout [Int]){
        if root != nil {
            results.append(root!.val)
            for r in root!.children {
                order(r, &results)
            }
        }
    }
    
    // MARK: 迭代解法(根->左->右)
    func preorderIteration(_ root: Node?) -> [Int] {
        if root == nil {
            return []
        }
        var tempNodes: [Node] = [root!]
        var results: [Int] = []
        while let node = tempNodes.popLast() {
            results.append(node.val)
            // 倒序遍历,将左节点放最后,popLast先弹左再到右
            for n in node.children.reversed() {
                tempNodes.append(n)
            }
        }
        return results
    }
    
    
}

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

/*
 589. N叉树的前序遍历
 给定一个 N 叉树，返回其节点值的前序遍历。

 例如，给定一个 3叉树 :

  



  

 返回其前序遍历: [1,3,5,6,2,4]。

  

 说明: 递归法很简单，你可以使用迭代法完成此题吗?
 */
