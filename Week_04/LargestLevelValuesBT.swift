//
//  LargestLevelValuesBT.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/29.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 515. 在每个树行中找最大值
 您需要在二叉树的每一行中找到最大的值。

 示例：

 输入:

           1
          / \
         3   2
        / \   \
       5   3   9

 输出: [1, 3, 9]
 通过次数15,090提交次数24,712
 */
import Foundation

class LargestLevelValuesBT {
    
    func largestValues(_ root: TreeNode?) -> [Int] {
        
        var tempMap: [Int: Int] = [:]
        largestValuesRecursive(root, 1, &tempMap)
        let resultMap = tempMap.sorted { (e0, e1) -> Bool in
            return e0.key < e1.key
        }
        
        let result = resultMap.map {$0.value}
        return result
    }
    
    func largestValuesRecursive(_ root: TreeNode?, _ level: Int, _ tempMap: inout [Int: Int]) {
        
        if let root = root {
            
            if tempMap.count < level {
                tempMap[level] = -Int.max
            }
            if root.val > tempMap[level]! {
                tempMap[level] = root.val
            }
            
            largestValuesRecursive(root.left, level + 1, &tempMap)
            largestValuesRecursive(root.right, level + 1, &tempMap)
        }
        
    }
}
