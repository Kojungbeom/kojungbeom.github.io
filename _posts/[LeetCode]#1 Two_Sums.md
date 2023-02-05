# [LeetCode]#1.Two_Sums

---
title: LeetCode - 1.Two-sums
author: EUNJI KWAK
date: 2023-2-5
categories: [LeetCode, EUNJI_l]
tags: [array, 해싱]
-—

# [문제]([https://leetcode.com/problems/valid-palindrome/description/](https://leetcode.com/problems/two-sum/))

Given an array of integers `nums` and an integer `target`, return *indices of the two numbers such that they add up to `target`*.

You may assume that each input would have ***exactly* one solution**, and you may not use the *same* element twice.

You can return the answer in any order.

**Example 1:**

```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].

```

**Example 2:**

```
Input: nums = [3,2,4], target = 6
Output: [1,2]

```

**Example 3:**

```
Input: nums = [3,3], target = 6
Output: [0,1]

```

**Constraints:**

- `2 <= nums.length <= 104`
- `109 <= nums[i] <= 109`
- `109 <= target <= 109`
- **Only one valid answer exists.**

# [풀이]

### 1. 2중 for문 사용

```python

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if nums[i]+nums[j] == target:
                    return [i, j]
                else:
                    continue
```

## 📌주목

1. Two Sum 2 문제와의 차이점: sorting이 되어있는 문자열인지 아닌지