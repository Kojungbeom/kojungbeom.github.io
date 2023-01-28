# [LeetCode]#7997. Find the Town Judge

---
title: LeetCode - 7**997. Find the Town Judge**
author: EUNJI KWAK
date: 2023-1-26
category: Jekyll
layout: post
-—

# [문제]([https://leetcode.com/problems/find-the-town-judge/](https://leetcode.com/problems/find-the-town-judge/))

In a town, there are `n` people labeled from `1` to `n`. There is a rumor that one of these people is secretly the town judge.

If the town judge exists, then:

1. The town judge trusts nobody.
2. Everybody (except for the town judge) trusts the town judge.
3. There is exactly one person that satisfies properties **1** and **2**.

You are given an array `trust` where `trust[i] = [ai, bi]` representing that the person labeled `ai` trusts the person labeled `bi`. If a trust relationship does not exist in `trust` array, then such a trust relationship does not exist.

Return *the label of the town judge if the town judge exists and can be identified, or return* `-1` *otherwise*.

**Example 1:**

```
Input: n = 2, trust = [[1,2]]
Output: 2

```

**Example 2:**

```
Input: n = 3, trust = [[1,3],[2,3]]
Output: 3

```

**Example 3:**

```
Input: n = 3, trust = [[1,3],[2,3],[3,1]]
Output: -1

```

**Constraints:**

- `1 <= n <= 1000`
- `0 <= trust.length <= 104`
- `trust[i].length == 2`
- All the pairs of `trust` are **unique**.
- `ai != bi`
- `1 <= ai, bi <= n`

# [풀이]

### 1. stack 이용

```python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        stack = []
        stack.append(trust[0][1]) #stack = [3]
        for i in range(1,len(trust)): #i = 1, i=2 #stack = [3]

            if trust[i][1] not in stack: #1 == 3, stack = []
                return -1
            else:
                stack.append(trust[i][1])
        return trust[0][1]
```

- test case를 모두 통과하였으나,, 다른 test case에서 막힘
    
    ```python
    4
    [[1,3],[1,4],[2,3],[2,4],[4,3]]
    ```
    

### 2. 다른 사람 풀이.. << 뭐 이런 풀이가 .. 똑똑하다

```python
class Solution:
    def findJudge(self, n: int, trust: List[List[int]]) -> int:
        if n == 1 and len(trust) == 0:
            return 1
        if len(trust) == 0:
            return -1
        
        persons = []
        for i in range(n+1):
            persons.append({'id':i,'trusting':0,'trusted':0})
				
				#믿는 사람의 수와 믿음을 받는 사람의 수 적립
        for i, v in enumerate(trust):
            persons[v[0]]['trusted'] +=1
            persons[v[1]]['trusting'] +=1

        #믿음을 받는 사람이 0명이고, 믿는 사람의 수가 (n-1)이면 id return
				#왜 (n-1)이냐면? 믿음을 받는 한 사람 빼고 나머지는 다 그 사람을 믿음!
        for p in persons:
            if p['trusted'] == 0 and p['trusting'] == n -1:
                return p['id']
        return -1
```