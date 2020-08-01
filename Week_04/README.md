
###  二分查找定位无序起点
使用二分查找，寻找一个半有序数组 [4, 5, 6, 7, 0, 1, 2] 中间无序的地方
* 特殊情况排除，因为是半有序数组，中间无序，则数组元素个数应该至少为3个
* 假设原数组为升序排列数组
* 确定边界以及中心位置，已经数组长度为n,初始化左右边界 ```var l = 0，r = n - 1 ``` ,则中心位置为 ``` let mid = l + (r - l)/2 ```
* 由于半有序数组为升序，则正常情况下num[0] < num[mid],否则说明num[mid]处于无序中
* 当num[0] <= num[mid]时，mid应往后偏移，即l = mid + 1; 反之 r = mid - 1
具体实现:
```
func searchDisorderIndex(_ nums: [Int]) -> Int {
    let n = nums.count
    if n < 3 { return -1 }
    var l = 0, r = n - 1
    while l <= r {
        let mid = l + (r - l) / 2
        if nums[0] <= nums[mid] {
            l = mid + 1
        }else {
            if nums[mid] > nums[mid - 1] { // 说明当前mid处于无序部分中，但不是无序的起点
                r = mid - 1
            } else { // 当前mid正是无序的起点
                return mid
            }
        }
    }
    return -1
}
```
