---
title: LeetCode-347.Top-K-Frequent-Elements
author: EUNJI KWAK
date: 2023-1-26
categories: [LeetCode, EUNJI_L]
tags: [array, dictionary]
---

# [문제](https://leetcode.com/problems/top-k-frequent-elements/)

Given an integer array `nums` and an integer `k`, return *the* `k` *most frequent elements*. You may return the answer in **any order**.

**Example 1:**

```
Input: nums = [1,1,1,2,2,3], k = 2
Output: [1,2]

```

**Example 2:**

```
Input: nums = [1], k = 1
Output: [1]

```

**Constraints:**

- `1 <= nums.length <= 105`
- `104 <= nums[i] <= 104`
- `k` is in the range `[1, the number of unique elements in the array]`.
- It is **guaranteed** that the answer is **unique**.

# [풀이]

### 1. 단순 array 사용

```python

class Solution:
    def topKFrequent(self, nums: List[int], k: int) -> List[int]:
        numb = list(set(nums))
        #print(numb)
        lst = []
        for i in range(len(numb)):
            cnt = 0
            cnt = nums.count(numb[i])
            lst.append([numb[i],cnt])
        new = sorted(lst, key=lambda x:x[1], reverse=True)
        ans = []
        for i in range(len(new)):
            ans.append(new[i][0])
            if len(ans) == k:
                return ans
```

## 📌주목

```python
input: list = [[1,2],[2,3],[3,1]]
sorted(list, key=lambda x:x[1], reverse=True)
output: [[2,3],[1,2],[3,1]]
```

- key=lambda x : x[1], reverse=True ; 리스트 내의 1번째 인덱스를 기준으로 오름차순으로 정렬!

### 2. 다른 사람 풀이.. Dictionary를 사용한 방법!

```python
class Solution:
	def topKFrequent(self, nums: List[int], k: int) -> List[int]:

		frequency = {}

		for num in nums:

			if num not in frequency:

				frequency[num] = 1

			else:

				frequency[num] = frequency[num] + 1

		frequency = dict(sorted(frequency.items(), key=lambda x: x[1], reverse=True))

		result = list(frequency.keys())[:k]

		return result
```
