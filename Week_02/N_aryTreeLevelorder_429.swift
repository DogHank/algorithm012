//
//  N_aryTreeLevelorder_429.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/18.
//  Copyright © 2020 Billy. All rights reserved.
//

import Foundation

class N_aryTreeLevelorder_429 {
    // MARK: 递归解法
    func levelOrder(_ root: Node?) -> [[Int]] {
        if root == nil {
            return []
        }
        var res: [[Int]] = []
        order(root, 0, &res)
        return res
    }
    
    func order(_ root: Node?,_ level: Int, _ res: inout [[Int]]){
        
        if root != nil {
            if res.count - 1 < level {
                // 初始化当前层的数组
                res.append([])
            }
            res[level].append(root!.val)
            // 下一层的遍历!
            for r in root!.children {
                order(r, level + 1, &res)
            }
        }
    }
    
}

/*
 429. N叉树的层序遍历
 给定一个 N 叉树，返回其节点值的层序遍历。 (即从左到右，逐层遍历)。

 例如，给定一个 3叉树 :

  



  

 返回其层序遍历:

 [
      [1],
      [3,2,4],
      [5,6]
 ]
  

 说明:

 树的深度不会超过 1000。
 树的节点总数不会超过 5000。
 */
