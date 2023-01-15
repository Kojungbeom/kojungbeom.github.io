---
title: [LeetCode] - 150.Evaluate Reverse Polish Notation
author: EUNJI KWAK
date: 2023-1-11
category: Jekyll
layout: post
-—

# [문제](https://leetcode.com/problems/evaluate-reverse-polish-notation/)

You are given an array of strings `tokens` that represents an arithmetic expression in a [Reverse Polish Notation](https://en.wikipedia.org/wiki/Reverse_Polish_notation).

Evaluate the expression. Return *an integer that represents the value of the expression*.

**Note** that:

- The valid operators are `'+'`, `'-'`, `'*'`, and `'/'`.
- Each operand may be an integer or another expression.
- The division between two integers always **truncates toward zero**.
- There will not be any division by zero.
- The input represents a valid arithmetic expression in a reverse polish notation.
- The answer and all the intermediate calculations can be represented in a **32-bit** integer.

## example 1:

```python
Input: tokens = ["4","13","5","/","+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6
```

# [풀이]

- Stack을 선택한 이유: 입력된 연산자의 순서와 반대로 연산이 진행되기 때문!
- 전략
1. tokens[i] for문 반복
2. if 피연산자일 경우 => stack.append(tokens[i]) => stack = [‘4’,’13’,’5’]
3. if tokens[i] 연산자일 경우 => b = stack.pop(), a = stack.pop()
4. if 연산자 파악 => result = int(b) 연산자 int(a) => stack.append(result)
5. len(tokens)까지 반복

```python
class Solution:
 def evalRPN(self, tokens: List[str]) -> int:
      result = 0
      stack = []
      arith = ["+", "-", "/","*"]
      for i in range(len(tokens)):
					#stack에는 숫자만 저장
          if tokens[i] not in arith:
              stack.append(int(tokens[i]))
          else:
              b = stack.pop()
              a = stack.pop()
              if tokens[i] == "+":
                  result = a + b
                  stack.append(result)
              if tokens[i] == "-":
                  result = a - b
                  stack.append(result)
              if tokens[i] == "/":
									#결과값으로 소수점이 나올 수 있기 때문에 int형을 취해서 처리
                  result = int(a / b)
                  stack.append(result)
              if tokens[i] == "*":
                  result = a * b
                  stack.append(result)
 
      return stack.pop()
```

- 시간복잡도 = O(n) ;데이터의 길이가 n이라고 할 때 for문이 n번 반복됨으로
- 공간복잡도 = O(n) ;stack 하나만 썼음
