//
//  BTSerial&Deserial.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/25.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 297. 二叉树的序列化与反序列化
 序列化是将一个数据结构或者对象转换为连续的比特位的操作，进而可以将转换后的数据存储在一个文件或者内存中，同时也可以通过网络传输到另一个计算机环境，采取相反方式重构得到原数据。

 请设计一个算法来实现二叉树的序列化与反序列化。这里不限定你的序列 / 反序列化算法执行逻辑，你只需要保证一个二叉树可以被序列化为一个字符串并且将这个字符串反序列化为原始的树结构。

 示例:

 你可以将以下二叉树：

     1
    / \
   2   3
      / \
     4   5

 序列化为 "[1,2,3,null,null,4,5]"
 提示: 这与 LeetCode 目前使用的方式一致，详情请参阅 LeetCode 序列化二叉树的格式。你并非必须采取这种方式，你也可以采用其他的方法解决这个问题。

 说明: 不要使用类的成员 / 全局 / 静态变量来存储状态，你的序列化和反序列化算法应该是无状态的。
 */
import Foundation

class SeDeserail {
    
    /// 递归解法-DFS
    func serialize(_ root: TreeNode?) -> String {
      
        return serializeRecursive(root, "")
    }
    
    func serializeRecursive(_ root: TreeNode?, _ currentStr: String) -> String {
        var current = currentStr
        if root == nil {
            current += "null,"
        }else {
            current += String(root!.val) + ","
            current = serializeRecursive(root?.left, current)
            current = serializeRecursive(root?.right, current)
        }
        return current
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        var treeList: [Substring] = data.split(separator: ",")
        return buildTree(&treeList)
    }
    
    func buildTree(_ treeList: inout [Substring]) -> TreeNode? {
        if treeList.first == "null" {
            treeList.removeFirst()
            return nil
        }
        let node = TreeNode.init(Int(treeList[0])!)
        treeList.removeFirst()
        node.left = buildTree(&treeList)
        node.right = buildTree(&treeList)
        return node
    }
    
}
