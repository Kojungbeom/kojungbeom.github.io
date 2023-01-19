---
title: LeetCode-70.Climbing Stairs
author: EUNJI KWAK
date: 2023-1-19
category: Jekyll
layout: post
-—

# [문제](https://leetcode.com/problems/climbing-stairs/description/)

You are climbing a staircase. It takes `n` steps to reach the top.

Each time you can either climb `1` or `2` steps. In how many distinct ways can you climb to the top?

## example 1:

```python
Input: n = 2
Output: 2
Explanation: There are two ways to climb to the top.
1. 1 step + 1 step
2. 2 steps
```

## example 2:

```python
Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

# [풀이]

1. **재귀함수 사용 → Time Limit Exceeded**

```python
										climbStairs(6)
									 /               \
								cS(5)       +          cS(4)
					    /    \                  /    \
				cS(4)   +   cS(3)         cS(3) + cS(2)
			 /  \        /   \         /   \
cS(3) + cS(2) cS(2) + cS(1) cS(2) + cS(1)
/  \
cS(2) + cS(1)
```

- n = 3, returm 3
- n = 4, climb(3) + climb(2)
    - [1 1 1 1], [2 2], [2 1 1], [1 2 1], [1 1 2]
    - climb(3) → climb(2) + climb(1) → return 2 + 1 = 3
    - climb(2) → return 2

```python
class Solution:
    def climbStairs(self, n: int) -> int:
        def climb(n):
            if n == 1: 
                return 1
            if n == 2: 
                return 2
            return climb(n-1) + climb(n-2)
        return climb(n)
```

- input: n에 따라 계산이 반복되기 때문에 시간 복잡도에서 걸린듯!

1. **다이내믹 프로그래밍 → PASS!!!**
- n=3
    - dp=[0,0,0,0], dp=[0,1,2,0]
    - for i in range(3,4): dp[3] = dp[2]+dp[1] = 2+1 = 3 → dp = [0,1,2,3]
- n=4
    - dp=[0,0,0,0,0] , dp=[0,1,2,0,0]
    - for i in range(3,5):
        - dp[3]=dp[2]+dp[1]=2+1=3 → dp = [0,1,2,3,0]
        - dp[4]=dp[3]+dp[2]=3+2=5 → return dp=[0,1,2,3,5]

```python
class Solution:
    def climbStairs(self, n: int) -> int:
        if n == 0: return 0
        if n == 1: return 1
        if n == 2: return 2
        dp = [0]*(n+1)
        dp[1]=1
        dp[2]=2
        for i in range(3, n+1):
            dp[i]=dp[i-1]+dp[i-2]
        print(dp)
        return dp[n]
```

- 피보나치 수열 문제인데 어떻게 구현하느라에 따라 달라지는 문제인 것 같음 !!!
- 결과적으로 dp table을 사용하는게 훨씬 시간 복잡도를 줄임!
