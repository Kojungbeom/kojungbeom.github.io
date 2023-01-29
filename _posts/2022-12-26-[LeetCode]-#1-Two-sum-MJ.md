---
title: LeetCode - 1. Two sum (MJ)
author: MINJEONG KIM
date: 2022-12-26
categories: [LeetCode, MINJEONG_L]
tags: [LeetCode, MINJEONG, Hash, Brute-Force]
---

# [#1. Two sum](https://leetcode.com/problems/two-sum/)
`LeetCode`의 `Easy`단계 문제이다. 
들어가기 앞서, 선배님께서 아량을 배풀어주셔서 이 문제는 안 올려도 되지만 그래도 올린다!!
**(그래서 스터디에서 한 것 만큼 꼼꼼하지 않을 수 있다)**

# 📖Description

Given an array of integers `nums` and an integer `target`, return *indices of the two numbers such that they add up to `target`*.

You may assume that each input would have ***exactly* one solution**, and you may not use the *same* element twice.

You can return the answer in any order.

**>> 해석**

int형 배열과 목표값이 주어진다. 배열 안에 있는 두 숫자의 합이 target이 되는 인덱스를 출력한다.

이때, 각 값이 정확히 하나의 solution이 있다는 가정하에 input을 집어넣는다. 

답변은 임의의 순서로 반환할 수 있다

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

# 💡Process

## 🚩Try : 1

```python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        answer = []
        for i in range(nums):
            for j in range(i,nums):
                if nums[i]+nums[i+1] == target:
                    answer.append(i)
                    answer.appned(i+1)
        print(answer)
```

**>> Runtime Error**
```
TypeError: range() integer end argument expected, got list.
for i in range(nums):
Line 9 in twoSum ([Solution.py](http://solution.py/))
ret = Solution().twoSum(param_1, param_2)
Line 38 in _driver ([Solution.py](http://solution.py/))
_driver()
Line 48 in <module> ([Solution.py](http://solution.py/))
```

## 🚩 Try : 2

```python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        answer = []
   
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if nums[i] + nums[j] == target:
                    answer.append(i)
                    answer.append(j)
                    break
                else:
                    continue
        print(answer)
```

**결과 >> Wrong answer**

- Runtime: 31 ms

## 🚩Try : 3

```python
class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
  
        for i in range(len(nums)):
            for j in range(i+1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
```

**결과 >> Accepted** 
![results1](https://user-images.githubusercontent.com/101111603/210126140-e0ef26eb-b003-4527-a9d1-7391a2ecd91f.jpg)
![results2](https://user-images.githubusercontent.com/101111603/210126143-750830e5-b722-48d3-aa1e-f68912b5af55.jpg)


- 내가 푼 방식은 부르트포스 알고리즘이기 때문에 간단하지만 시간복잡도는 $O(n^2)$이다.

# 💡Rememberance

- 부르트포스 알고리즘 말고 해쉬테이블을 이용해서 풀면 더 좋다고 한다. 하지만 나 혼자 푸는 건 부르트포스만 가능한 것 같다…
