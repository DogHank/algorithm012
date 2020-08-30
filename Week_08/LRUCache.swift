//
//  LRUCache.swift
//  ALGOProblems
//
//  Created by Liang Liao on 2020/8/30.
//  Copyright © 2020 Liang Liao. All rights reserved.
//

import Foundation
// 链表+哈希表
class LRUCache {
    
    var head = ListNode(0, 0)
    var tail = ListNode(0, 0)
    var capacity: Int
    var hasMap: [Int: ListNode] = [:]
    var hasCount: Int = 0
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.head.next = tail
        self.tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = hasMap[key] {
            removeNode(node)
            addToFirst(node)
            return node.val
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = hasMap[key] {
            node.val = value
            removeNode(node)
            addToFirst(node)
        } else {
            if hasCount == capacity {
                removeLast()
            } else {
                hasCount += 1
            }
            let node = ListNode(value, key)
            addToFirst(node)
        }
    }
    
    private func removeLast() {
        if hasCount > 0 {
            let tempNode = tail.pre
            tempNode?.pre?.next = tail
            tail.pre = tempNode?.pre
            hasMap[tempNode!.key] = nil
        }
    }
    
    private func removeNode(_ node: ListNode) {
        node.pre?.next = node.next
        node.next?.pre = node.pre
        hasMap[node.key] = nil
    }
    
    private func addToFirst(_ node: ListNode) {
        head.next?.pre = node
        node.next = head.next
        head.next = node
        node.pre = head
        hasMap[node.key] = node
    }
    
    
}

class ListNode {
    
    var next: ListNode?
    var pre: ListNode?
    var val: Int
    var key: Int
    
    init(_ val: Int, _ key: Int) {
        self.val = val
        self.key = key
    }
}
