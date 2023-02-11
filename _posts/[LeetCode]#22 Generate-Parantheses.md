# [LeetCode]#22.Generate-Parantheses

---
title: LeetCode - 22.Generate-Parantheses
author: EUNJI KWAK
date: 2023-2-12
categories: [LeetCode, EUNJI_l]
tags: [stack]
-—

# [문제]([https://leetcode.com/problems/generate-parentheses/](https://leetcode.com/problems/generate-parentheses/))

Given `n` pairs of parentheses, write a function to *generate all combinations of well-formed parentheses*.

**Example 1:**

```
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]

```

**Example 2:**

```
Input: n = 1
Output: ["()"]

```

**Constraints:**

- `1 <= n <= 8`

# [풀이]

- stack 문제로 분류되어 있었는데.. 답을 보니 다들 backtracking을 사용..
- 왼쪽, 오른쪽 각각에 괄호 채우기
- 종료조건: 만들어진 괄호가 2*N이 되면 종료 → 해당 길이 만큼 괄호 만들었음

```python

class Solution(object):
    def generateParenthesis(self, N):
        ans = []
        def backtrack(S = '', left = 0, right = 0):
            if len(S) == 2 * N:
                ans.append(S)
                return
            if left < N:
                backtrack(S+'(', left+1, right)
            if right < left:
                backtrack(S+')', left, right+1)
 
        backtrack()
        return ans
```