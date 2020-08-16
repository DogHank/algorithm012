//
//  MinPathSum.swift
//  ALG刷题集
//
//  Created by Billy on 2020/8/16.
//  Copyright © 2020 Billy. All rights reserved.
//
/*
 64. 最小路径和
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。

 说明：每次只能向下或者向右移动一步。

 示例:

 输入:
 [
   [1,3,1],
   [1,5,1],
   [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。
 */
import Foundation

class MinPathSum {
    
      func minPathSum(_ grid: [[Int]]) -> Int {
          var grid = grid
          let n = grid.count
          let m = grid[0].count
          for i in 0 ..< n {
              for j in 0 ..< m {
                  if i == 0 && j == 0 { continue }
                  if i == 0 {
                      grid[0][j] = grid[0][j] + grid[0][j - 1]
                  } else if j == 0 {
                      grid[i][0] = grid[i][0] + grid[i - 1][0]
                  } else {
                      grid[i][j] = grid[i][j] + min(grid[i - 1][j], grid[i][j - 1])
                  }
              }
          }
          return grid[n - 1][m - 1]
      }
}
