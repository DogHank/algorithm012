### 由全排列理解回溯

以求数组[1,2,3]的全排列为例，DFS回溯解法流程如图：

![](https://github.com/DogHank/algorithm012/blob/master/Week_03/backtracing.png)

第0轮展示了生成[1,2,3] [1,3,2]这两个排列的过程，其他第1、2轮依此类推
中间最重要的是记录当前number是否可用，代码实现如下：
```

    func permute(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        var tempNums: [Int] = []
        // 用set记录number的状态（是否已用）
        var hashSet: Set<Int> = Set<Int>(minimumCapacity: nums.count)
        permuteBacktracing(nums, &hashSet, &tempNums, &results)
        return results
    }

    func permuteBacktracing(_ nums: [Int],
                            _ hashSet: inout Set<Int>,
                            _ tempNums: inout [Int],
                            _ results: inout [[Int]]) {
        if tempNums.count == nums.count {
            results.append(tempNums)
            return
        }
        
        for i in 0 ..< nums.count {
            if hashSet.contains(i) == false {
                tempNums.append(nums[i])
                hashSet.insert(i)
                permuteBacktracing(nums,&hashSet, &tempNums, &results) // 开辟下一重循环
                tempNums.removeLast()
                hashSet.remove(i) // 状态恢复
            }
            
        }
        
    }
```
