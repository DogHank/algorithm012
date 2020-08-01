### 从"搜索旋转排序数组"题出发理解二分查找

* 首先原数组是升序数组nums如：[0,1,2,4,5,6,7]，然后经过一次旋转生成了新的数组如：[4,5,6,7,0,1,2]
* 第一步先确定边界以及中心位置，已经数组长度为n,初始化左右边界 ```var l = 0，r = n - 1 ``` ,则中心位置为 ``` let mid = l + (r - l)/2 ```
* 根据 mid 可将数组分为 nums[0] ~ nums[mid] 和 nums[mid] ~ nums[n-1] 两部分
*  当 nums[0] <= nums[mid] 时， 若 ```nums[0] <= target && target < nums[mid] ```，则说明target 位于nums[0] ~ nums[mid] 之间，则应从 ``` r = mid - 1 ``` 方向收敛查找target值；否则 target 位于 nums[mid] ~ nums[n-1] 之间， 则应从 ``` l = mid + 1 ``` 方向搜寻 
* 当 nums[0] > nums[mid] 时，若 ```nums[mid] < target && target <= nums[n - 1]``` 则说明 target 位于 nums[mid] ~ nums[n-1] 之间， 则应从 ``` l = mid + 1 ``` 方向搜寻 ;否则 target 位于nums[0] ~ nums[mid] 之间，则应从 ``` r = mid - 1 ``` 方向收敛查找target值

具体代码实现:
```
func search(_ nums: [Int], _ target: Int) -> Int {
    let n = nums.count
    if n == 0 { return -1 }
    if n == 1 { return target == nums[0] ? 0 : -1 }
    var l = 0, r = n - 1
    while l <= r {
        let mid = l + (r-l) / 2
        if nums[mid] == target { return mid }
        if nums[0] <= nums[mid] {
            if nums[0] <= target && target < nums[mid] {
                r = mid - 1
            }else {
                l = mid + 1
            }
        }else {
            if nums[mid] < target && target <= nums[n - 1] {
                l = mid + 1
            }else {
                r = mid - 1
            }
        }
    }
    return -1
} 
```
