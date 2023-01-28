---
title: [LeetCode] 997. Find the Town Judge
author: JUNGBEOM KO
date: 2023-1-26
category: Jekyll
layout: post
---

# [LeetCode] 997. Find the Town Judge

`LeetCode` 997번 문제를 풀어보았다.. [Link](https://leetcode.com/problems/find-the-town-judge/description/)



# Problem

In a town, there are `n` people labeled from `1` to `n`. There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

1. The town judge trusts nobody.
2. Everybody (except for the town judge) trusts the town judge.
3. There is exactly one person that satisfies properties **1** and **2**.

You are given an array `trust` where `trust[i] = [ai, bi]` representing that the person labeled `ai` trusts the person labeled `bi`. If a trust relationship does not exist in `trust` array, then such a trust relationship does not exist.

Return *the label of the town judge if the town judge exists and can be identified, or return* `-1` *otherwise*.



# Intuition

지금까지 Intuition을 잘못쓰고 있었던 것 같다.

이제부터는 문제에서 얻을 수 있는 정보들과 어떤 알고리즘을 쓰는것이 좋을지에 대한 직관에 대해 적으려고 한다.

- trust[i] = [a_i, b_i]인데, 이는 a_i가 b_i를 믿는다는 것을 뜻한다.
- Town judge는 모두의 신뢰를 받는다. 그렇다면 이때 trust에 b_i가 town judge를 가리키고 있는 경우의 수는 전체 n명이 있다고 했을 때 n-1이다.
  - Town judge는 자기자신도 믿지 않는다.

따라서 n-1명의 신뢰를 받은 사람이 town judge가 되는데 이때 주의할 점이 있다.

- [1,2,3] 세명이 있다고 할 때, 1과 2가 3를 찍고 3이 1을 찍는다면 3는 n-1이 자신을 믿고있지만 3은 1을 믿고 있어 town judge라고 할 수 없다.

즉 나머지 모든 사람이 자기를 믿지만 자기가 다른 사람을 믿는다면 그는 town judge가 아니게 되는 반례를 주의하여야 한다.



# Approach
1. n+1 길이의 1차원 리스트 `table`을 생성한다.
2. trust[i] = [ai, bi]라고 할 때 `table[ai] -= 1`을 하고 `table[bi] += 1`을 한다.
   - 이렇게하면 위에서 언급한 반례를 해결할수가 있는게, town judge인 가능성이 높은 사람이 누군가를 믿는 사람이라고 한다면, 최종적으로 table[i]는 n-1이 될 수가 없게된다.

3. table의 성분들을 하나씩보며 n-1과 같으면 그때의 i를 반환한다.
4. 없으면 -1을 반환한다.



# Complexity
- Time complexity:

  $$O(n)$$

- Space complexity:
  $$O(n)$$

  

# My Code

```python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        table = [0] * (n + 1)

        for a, b in trust:
            table[a] -= 1
            table[b] += 1
            
        for i in range(1, len(table)):
            if table[i] == n-1:
                return i
        return -1
```



딕셔너리로도 풀어보려하였으나 `trust = []`인 반례가 있어 실패했다.

```python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        #table = [0] * (n + 1)
        table = {}
        for a, b in trust:
            if a in table:
                table[a] -= 1
            else:
                table[a] = -1
            
            if b in table:
                table[b] += 1
            else:
                table[b] = 1
            
        for i in range(1, n+1):
            if i in table:
                if table[i] == n-1:
                    return i
        else:
            return -1
```

