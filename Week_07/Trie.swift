//
//  Trie.swift
//  ALGOProblems
//
//  Created by Liang Liao on 2020/8/23.
//  Copyright © 2020 Liang Liao. All rights reserved.
//
/*
 208. 实现 Trie (前缀树)
 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。

 示例:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // 返回 true
 trie.search("app");     // 返回 false
 trie.startsWith("app"); // 返回 true
 trie.insert("app");
 trie.search("app");     // 返回 true
 说明:

 你可以假设所有的输入都是由小写字母 a-z 构成的。
 保证所有输入均为非空字符串。
 */
import Foundation

class Trie {
    private var root: TrieNode?
    init() {
        root = TrieNode()
    }
    
    func insert(_ word: String) {
        var node = root
        for ch in word {
            if node!.containsKey(ch) == false {
                node!.put(ch, TrieNode())
            }
            node = node!.get(ch)
        }
        node?.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        let node = searchPrefix(word)
        return node != nil && node!.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        let node = searchPrefix(prefix)
        return node != nil
    }
    
    
    private func searchPrefix(_ word: String) -> TrieNode? {
        var node = root
        for ch in word {
            if node!.containsKey(ch) {
                node = node!.get(ch)
            }else {
                return nil
            }
        }
        return node
    }
}

class TrieNode {
    private var links: [TrieNode?] = []
    private var _isEnd: Bool = false
    var isEnd: Bool{
        get {
            return _isEnd
        }
        set {
            _isEnd = newValue
        }
    }
    
    init() {
        links = Array(repeating: nil, count: 26)
    }
    func containsKey(_ ch: Character) -> Bool {
        return links[Int(ch.asciiValue! - Character("a").asciiValue!)] != nil
    }
    func get(_ ch: Character) -> TrieNode? {
        return links[Int(ch.asciiValue! - Character("a").asciiValue!)]
    }
    func put(_ ch: Character, _ node: TrieNode) {
        links[Int(ch.asciiValue! - Character("a").asciiValue!)] = node
    } 
}
