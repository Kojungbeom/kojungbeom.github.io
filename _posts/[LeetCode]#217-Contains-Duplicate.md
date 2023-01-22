# [LeetCode]#217-Contains-Duplicate

---
title: LeetCode - 217. Contains-Duplicate
author: EUNJI KWAK
date: 2023-1-16
categories: [LeetCode, EUNJI_L]
tags: [hash, 해시]
-—

# [문제]([https://leetcode.com/problems/contains-duplicate/description/](https://leetcode.com/problems/contains-duplicate/description/))

Given an integer array `nums`, return `true` if any value appears **at least twice** in the array, and return `false` if every element is distinct.

## example 1:

```python
Input: nums = [1,2,3,1]
Output: true
```

## example 2:

```
Input: nums = [1,2,3,4]
Output: false
```

## example 3:

```
Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
```

# [풀이]

- 다른 dict사용 문제 풀 때 dictionary를 만드는데 사용하는 기본틀인듯!
    - dict에 해당 요소가 없으면 새로 만들지만
    - 이미 있다면 true 반환

```python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        #2개 이상이면 true, 다 한 번씩 출제되면 false
        dict={}

        for i in range(len(nums)):
            if nums[i] not in dict:
                dict[nums[i]]=0
            else:
                return True
```

### 다른 풀이

```python
class Solution:
    def containsDuplicate(self, nums: List[int]) -> bool:
        #2개 이상이면 true, 다 한 번씩 출제되면 false
				reduced_nums = set(nums)
				if reduced_nums != nums:
					return True
				else:
					return False
```

- set(): 중복 제거 함수 !