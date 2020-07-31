//
//  LadderLength.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/31.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 127. 单词接龙
 给定两个单词（beginWord 和 endWord）和一个字典，找到从 beginWord 到 endWord 的最短转换序列的长度。转换需遵循如下规则：

 每次转换只能改变一个字母。
 转换过程中的中间单词必须是字典中的单词。
 说明:

 如果不存在这样的转换序列，返回 0。
 所有单词具有相同的长度。
 所有单词只由小写字母组成。
 字典中不存在重复的单词。
 你可以假设 beginWord 和 endWord 是非空的，且二者不相同。
 示例 1:

 输入:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]

 输出: 5

 解释: 一个最短转换序列是 "hit" -> "hot" -> "dot" -> "dog" -> "cog",
      返回它的长度 5。
 示例 2:

 输入:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]

 输出: 0

 解释: endWord "cog" 不在字典中，所以无法进行转换。
 */
import Foundation

class LadderLength {
    
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if beginWord == endWord { return 0 }
        let listSet: Set<String> = Set(wordList)
        if !listSet.contains(endWord) { return 0 }
        var beginSet: Set<String> = Set<String>()
        var endSet: Set<String> = Set<String>()
        var visitedSet: Set<String> = Set<String>()
        var found: Bool = false
        var level: Int = 1
        beginSet.insert(beginWord)
        endSet.insert(endWord)

        while !found && !beginSet.isEmpty && !endSet.isEmpty {
            var nextSet: Set<String> = Set<String>()
            if beginSet.count > endSet.count {
                swap(&beginSet, &endSet)
            }
            found = findCommonWord(beginSet, endSet, listSet, &visitedSet, &nextSet)
            beginSet = nextSet
            level += 1
        }

        return found ? level : 0
    }

    func findCommonWord(
        _ beginSet: Set<String>,
        _ endSet: Set<String>,
        _ listSet: Set<String>,
        _ visitedSet: inout Set<String>,
        _ nextSet: inout Set<String>) -> Bool {

        let letters = "abcdefghijklmnopqrstuvwxyz"
        for word in beginSet {
            var chars: [Character] = Array(word)
            for i in 0 ..< chars.count {
                let old = chars[i]
                for letter in letters {
                    if letter == old { continue }
                    chars[i] = letter
                    let newWord = String(chars)
                    if listSet.contains(newWord) {
                        if endSet.contains(newWord) {
                            return true
                        }
                        if !visitedSet.contains(newWord) {
                            visitedSet.insert(newWord)
                            nextSet.insert(newWord)
                        }
                    }
                }
                chars[i] = old
            }
        }

        return false
    }
}
