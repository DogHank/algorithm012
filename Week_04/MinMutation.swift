//
//  MinMutation.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/28.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 433. 最小基因变化
 一条基因序列由一个带有8个字符的字符串表示，其中每个字符都属于 "A", "C", "G", "T"中的任意一个。
 
 假设我们要调查一个基因序列的变化。一次基因变化意味着这个基因序列中的一个字符发生了变化。
 
 例如，基因序列由"AACCGGTT" 变化至 "AACCGGTA" 即发生了一次基因变化。
 
 与此同时，每一次基因变化的结果，都需要是一个合法的基因串，即该结果属于一个基因库。
 
 现在给定3个参数 — start, end, bank，分别代表起始基因序列，目标基因序列及基因库，请找出能够使起始基因序列变化为目标基因序列所需的最少变化次数。如果无法实现目标变化，请返回 -1。
 
 注意:
 
 起始基因序列默认是合法的，但是它并不一定会出现在基因库中。
 所有的目标基因序列必须是合法的。
 假定起始基因序列与目标基因序列是不一样的。
 示例 1:
 
 start: "AACCGGTT"
 end:   "AACCGGTA"
 bank: ["AACCGGTA"]
 
 返回值: 1
 示例 2:
 
 start: "AACCGGTT"
 end:   "AAACGGTA"
 bank: ["AACCGGTA", "AACCGCTA", "AAACGGTA"]
 
 返回值: 2
 示例 3:
 
 start: "AAAAACCC"
 end:   "AACCCCCC"
 bank: ["AAAACCCC", "AAACCCCC", "AACCCCCC"]
 
 返回值: 3
 */
import Foundation

class MinMutation {
    /// 解法一 BFS
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end { return 0 }
        var bankSet: Set<String> = Set<String>(minimumCapacity: bank.count)
        bank.forEach{ (e) in
            bankSet.insert(e)
        }
        // 基因库用set存储，检测匹配更高效
        if !bankSet.contains(end) { return -1 }
        // 访问状态记录
        var visitedSet: Set<String> = Set<String>()
        visitedSet.insert(start)
        // 过渡及结果基因存储
        var tempGenes: [String] = [start]
        // 基因常量集
        let genes: [String] = ["A", "C", "G", "T"]
        // 记录当前基因是第几次变化
        var level = 0
        while tempGenes.count > 0 {
            var size = tempGenes.count
            while size > 0 {
                // 当前基因序列
                let currentGenes = tempGenes.popLast()!
                if currentGenes == end {
                    return level
                }
                var currentGenesArray: [Character] = Array(currentGenes)
                for i in 0 ..< currentGenesArray.count {
                    let oldChar = currentGenesArray[i]
                    for g in genes {
                        // 若相同则不用替换
                        if Character(g) == oldChar { continue }
                        currentGenesArray[i] = Character(g)
                        // 替换生成新基因序列
                        let newGenes: String = String(currentGenesArray)
                        // 检测新基因是否在库中（包括过渡或结果都一样）
                        // 存在则为符合要求(每一次基因变化的结果都需要是一个合法的基因串)
                        if !visitedSet.contains(newGenes) && bankSet.contains(newGenes) {
                            visitedSet.insert(newGenes)
                            // 这里注意要放数组前面，上面pop的时候刚好正向取出基因匹配
                            // 从而准确匹配当前是第几次生成的
                            tempGenes.insert(newGenes, at: 0)
                            break
                        }
                    }
                    // 恢复当前基因，检测下一位的所有变化是否存在基因库中
                    currentGenesArray[i] = oldChar
                }
                // 本次循环结束，则本次符合变化的过渡基因已经收集完毕
                // 跳出此次循环
                size -= 1
            }
            level += 1
        }
        return -1
    }
    /// 解法二 双指针+BFS
    func minMutation1(_ start: String, _ end: String, _ bank: [String]) -> Int {
        if start == end {
            return 0
        }
        let bankSet: Set<String> = Set(bank)
        if !bankSet.contains(end) { return -1 }
        var startSet: Set<String> = Set<String>()
        var endSet: Set<String> = Set<String>()
        var visitedSet: Set<String> = Set<String>()
        var found: Bool = false
        startSet.insert(start)
        endSet.insert(end)
        var level = 0
        while !found && !startSet.isEmpty && !endSet.isEmpty {
            var nextSet: Set<String> = Set<String>()
            // 切换遍历方向，
            // 更容易触发foundCommonGene中的endSet.contains(newGene)
            if startSet.count > endSet.count {
                swap(&startSet, &endSet)
            }
            found = foundCommonGene(startSet, endSet, bankSet, &visitedSet, &nextSet)
            startSet = nextSet
            level += 1
        }

        return found ? level : -1
    }

    func foundCommonGene(
        _ startSet: Set<String>,
        _ endSet: Set<String>,
        _ bankSet: Set<String>,
        _ visitedSet: inout Set<String>,
        _ nextSet: inout Set<String>
        ) -> Bool {
            let genes = "ACGT"
            for currentGene in startSet {
                var chars: [Character] = Array(currentGene)
                for i in 0 ..< chars.count {
                    let old = chars[i]
                    for g in genes {
                        if g == old { continue }
                        chars[i] = g
                        let newGene = String(chars)
                        if bankSet.contains(newGene) {
                            if endSet.contains(newGene) {
                                return true
                            }
                            if !visitedSet.contains(newGene) {
                                visitedSet.insert(newGene)
                                nextSet.insert(newGene)
                            }
                        }
                    }
                    chars[i] = old
                }
            }
            return false
        }
}
