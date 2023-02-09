---
title: LeetCode - 167.Two-sum-2-input-array-is-sorted
author: EUNJI KWAK
date: 2023-2-5
categories: [LeetCode, EUNJI_L]
tags: [Two Pointer, array]
---

# [문제](https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/description/)

Given a **1-indexed** array of integers `numbers` that is already ***sorted in non-decreasing order***, find two numbers such that they add up to a specific `target` number. Let these two numbers be `numbers[index1]` and `numbers[index2]` where `1 <= index1 < index2 <= numbers.length`.

Return *the indices of the two numbers,* `index1` *and* `index2`*, **added by one** as an integer array* `[index1, index2]` *of length 2.*

The tests are generated such that there is **exactly one solution**. You **may not** use the same element twice.

Your solution must use only constant extra space.

**Example 1:**

```
Input: numbers = [2,7,11,15], target = 9
Output: [1,2]
Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].

```

**Example 2:**

```
Input: numbers = [2,3,4], target = 6
Output: [1,3]
Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].

```

**Example 3:**

```
Input: numbers = [-1,0], target = -1
Output: [1,2]
Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].

```

**Constraints:**

- `2 <= numbers.length <= 3 * 104`
- `1000 <= numbers[i] <= 1000`
- `numbers` is sorted in **non-decreasing order**.
- `1000 <= target <= 1000`
- The tests are generated such that there is **exactly one solution**.

# [풀이]

### 1. Two Pointer 사용

```python

class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:       

        left = 0
        right = len(nums) - 1
        while left < right:
            if nums[left]+nums[right] == target:
                return [left+1, right+1]  
            elif nums[left]+nums[right] > target:
                right -=1
            else:
                left +=1
        return []
```

## 📌주목

- Two Pointer: 리스트의 양쪽 끝에 포인터를 두고 하나씩 보는 흐름
- **단, 리스트가 정렬되어 있다는 가정 하에 문제 풀이 가능 !**
