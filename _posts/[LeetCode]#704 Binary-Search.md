---
title: LeetCode - 704.Binary-Search
author: EUNJI KWAK
date: 2023-2-12
categories: [LeetCode, EUNJI_l]
tags: [Binary Search]
---

# [문제](https://leetcode.com/problems/binary-search/)

Given an array of integers `nums` which is sorted in ascending order, and an integer `target`, write a function to search `target` in `nums`. If `target` exists, then return its index. Otherwise, return `-1`.

You must write an algorithm with `O(log n)` runtime complexity.

**Example 1:**

```
Input: nums = [-1,0,3,5,9,12], target = 9
Output: 4
Explanation: 9 exists in nums and its index is 4

```

**Example 2:**

```
Input: nums = [-1,0,3,5,9,12], target = 2
Output: -1
Explanation: 2 does not exist in nums so return -1

```

**Constraints:**

- `1 <= nums.length <= 104`
- `104 < nums[i], target < 104`
- All the integers in `nums` are **unique**.
- `nums` is sorted in ascending order.

# [풀이]

- 가운데를 기준으로 target값과 비교 → 범위를 좁혀감

```python

class Solution:
    def search(self, nums: List[int], target: int) -> int:
        start = 0
        end = len(nums) - 1
        while start <= end:
            middle = (start + end) // 2
            if nums[middle] == target:
                return middle
            if nums[middle] > target:
                end = middle - 1
            else:
                start = middle + 1
        return -1
```

## 📌주목

- 탐색의 범위가 항상 절반씩 줄어든다. K 번째 탐색에서 남은 데이터의 수는 (21)*k* x N이 된다.
- 최악에는 (21)*k* x N = 1이 될 때까지 탐색하게 된다.
- 위 식의 양변에 2*k*를 곱하면 2*k* = N이 되고, 다시 양변에 log2를 취하면 *k*=log2*N*이 된다.
- K는 탐색 횟수로 N에 따라 시행 횟수가 정해지기 때문에 시간 복잡도는 O(log2*N*)이 된다.
