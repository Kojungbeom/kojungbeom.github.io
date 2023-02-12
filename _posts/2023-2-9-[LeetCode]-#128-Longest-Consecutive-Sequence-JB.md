---
title: LeetCode - 128. Longest Consecutive Sequence
author: JUNGBEOM KO
date: 2023-2-9
categories: [LeetCode, JUNGBEOM_L]
tags: [LeetCode, JUNGBEOM]
---

# [LeetCode] 128. Group Anagrams

`LeetCode` 128번 문제를 풀어보았다.. [Link](https://leetcode.com/problems/group-anagrams/description/)



# Problem

Given an unsorted array of integers `nums`, return *the length of the longest consecutive elements sequence.*

You must write an algorithm that runs in `O(n)` time.



# Intuition

Consecutive sequence, 즉 연속되는 정수 sequence의 길이가 가장 긴 것을 Return하면 되는 문제.

시간복잡도가 O(n)으로 동작해야한다는 제한사항이 있다.

만약 주어진 정수의 배열 `nums`가 정렬되어있다면 문제 해결이 쉬워진다.

예를들어 [100,4,200,1,3,2]이 아니라 [1,2,3,4,100,200]이 주어졌다면, [1,2,3,4]의 길이 4, [100]의 길이 1, [200]의 길이 1로 가장 긴 sequence는 4가 된다.

하지만 Sorting된 배열이 제공되지 않음으로, 정렬을 하여 문제를 풀 경우 O(nlogn)의 시간복잡도로 시간초과가 발생한다.

어떻게해야 O(n)으로 문제를 해결할 수 있을까?



# Approach

Sequence가 시작되는 지점의 특징은 그 숫자보다 -1 작은 수가 `nums`안에 없다는 것이다.

Sequence가 종료되는 지점의 특징은 그 숫자보다 +1 큰 수가 `nums`안에 없다는 것이다.

그렇다면 `nums`의 숫자를 하나씩 보면서 그 숫자 `nums[i]-1`이 `nums`안에 없다면 Sequence를 시작하여 해당 숫자에 +1씩 더하면서 `nums`에 있는지 찾아본다면 이 sequence의 길이를 구할 수가 있다.

하지만 여기서 리스트 클래스인 `nums`를 가지고 어떤 값이 있는지 없는지를 살펴보려고 한다면 최종 알고리즘의 시간복잡도는 O(n^2)이 되버리게 된다.

따라서 성분을 찾는데 필요한 시간복잡도가 O(1)인 set이나 dictionary를 사용하여 `nums`의 성분들을 확인할 수 있다면 위의 방법으로도 O(n)의 시간복잡도로 문제를 해결할 수 있다.



# Complexity
- Time complexity:

  O(n)

- Space complexity:
  O(n)

  

# My Code

```python
class Solution:
    def longestConsecutive(self, nums: List[int]) -> int:
        answer = 0
        # the time complexity of search function of the set is O(1)
        num_set = set(nums)

        for num in nums:
            # if these is no left number, it is start of a new sequence
            if num-1 not in num_set:
                length = 0
                while num + length in num_set:
                    length += 1
                answer = max(answer, length)
        return answer
```

