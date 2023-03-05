---
title: LeetCode - 278.FIrst-Bad-Version
author: EUNJI KWAK
date: 2023-3-5
categories: [LeetCode, EUNJI_l]
tags: [Binary Search]
---

# [문제](https://leetcode.com/problems/first-bad-version/?envType=study-plan&id=algorithm-i)

You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have `n` versions `[1, 2, ..., n]` and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API `bool isBadVersion(version)` which returns whether `version` is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

**Example 1:**

```
Input: n = 5, bad = 4
Output: 4
Explanation:
call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true
Then 4 is the first bad version.
```

**Example 2:**

```
Input: n = 1, bad = 1
Output: 1
```

**Constraints:**

- `1 <= bad <= n <= 231 - 1`

# [풀이]

- Binary Search 푸는 법:
    - 양 끝 값을 뭘로 설정 ? 정렬된 리스트
        - 불량(True)인지를 검사할 것이기 때문에 리스트의 인덱스 값을 left, right로 설정
    - index값을 어떤 조건에서 옮길 것인지 ?
        - 불량을 만든 최초의 제품을 찾는 것이기 때문에 불량일 경우에 right를 옮김

```python

# The isBadVersion API is already defined for you.
# def isBadVersion(version: int) -> bool:

#이전 버전을 기반으로 현재 버전이 만들어짐
#나쁘기 시작한 최초의 n번을 찾기

class Solution:
    def firstBadVersion(self, n: int) -> int:
        left, right = 0, n
        while left < right:
            mid  = (left + right) //2
            if not isBadVersion(mid): #불량이 아닐 경우
                left = mid +1
            else:
                right = mid
        return left
```

## 📌주목

- 이진 탐색을 푸는 법:
    - left, right를 무엇으로 설정할 것인지
    - left와 right를 어떤 조건에 옮길 것인지
- 왜 이진 탐색 문제인가?
    - 탐색해야 할 데이터가 무수히 많은데 시간이 제한된 상황에서 사용
    - 시간복잡도: O(log n)
