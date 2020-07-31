//
//  NumIslands.swift
//  ALG刷题集
//
//  Created by Billy on 2020/7/31.
//  Copyright © 2020 Billy. All rights reserved.
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
 */
import Foundation

class NumIslands {
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        if grid.count == 0 {
            return 0
        }
        if grid[0].count == 0 {
            return 0
        }
        
        var result: Int = 0
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                if grid[i][j] == "1" {
                    result += 1
                    checkIslands(&grid, i, j)
                }
            }
        }
        return result
    }
    
    func checkIslands(_ grid: inout [[Character]], _ i: Int, _ j: Int) {
        
        if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count || grid[i][j] == "0" {
            return
        }
        grid[i][j] = "0"
        checkIslands(&grid, i + 1, j) // 下
        checkIslands(&grid, i, j + 1) // 右
        checkIslands(&grid, i, j - 1) // 左
        checkIslands(&grid, i - 1, j) // 上
    }
}
