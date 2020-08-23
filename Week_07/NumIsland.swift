//
//  NumIsland.swift
//  ALGOProblems
//
//  Created by Liang Liao on 2020/8/23.
//  Copyright © 2020 Liang Liao. All rights reserved.
//
/*
 200. 岛屿数量
 给你一个由 '1'（陆地）和 '0'（水）组成的的二维网格，请你计算网格中岛屿的数量。

 岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。

 此外，你可以假设该网格的四条边均被水包围。

  

 示例 1:

 输入:
 [
 ['1','1','1','1','0'],
 ['1','1','0','1','0'],
 ['1','1','0','0','0'],
 ['0','0','0','0','0']
 ]
 输出: 1
 示例 2:

 输入:
 [
 ['1','1','0','0','0'],
 ['1','1','0','0','0'],
 ['0','0','1','0','0'],
 ['0','0','0','1','1']
 ]
 输出: 3
 解释: 每座岛屿只能由水平和/或竖直方向上相邻的陆地连接而成。
 通过次数145,880提交次数291,115
 在真实的面试中遇到过这道题？
 */

import Foundation

class NumIslands {
    
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count == 0 { return 0 }
        if grid[0].count == 0  { return 0 }
        var grid = grid
        var res: Int = 0
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == "1" {
                    cleanIsland(&grid, i, j)
                    res += 1
                }
            }
        }
        return res
    }

    func cleanIsland(_ grid: inout [[Character]], _ i: Int, _ j: Int) {

        if i >= grid.count || i < 0 || j >= grid[0].count || j < 0 || grid[i][j] == "0" {
            return
        }
        grid[i][j] = "0"
        cleanIsland(&grid, i + 1, j)
        cleanIsland(&grid, i, j + 1)
        cleanIsland(&grid, i - 1, j)
        cleanIsland(&grid, i, j - 1)
    }
}
