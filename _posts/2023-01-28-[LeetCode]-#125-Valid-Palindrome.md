---
title: LeetCode-125.Valid-Palindrome
author: EUNJI KWAK
date: 2023-1-28
categories: [LeetCode, EUNJI_L]
tags: [Two Pointer, array]
---

# [문제](https://leetcode.com/problems/valid-palindrome/description/)

A phrase is a **palindrome** if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string `s`, return `true` *if it is a **palindrome**, or* `false` *otherwise*.

**Example 1:**

```
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

```

**Example 2:**

```
Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.

```

**Example 3:**

```
Input: s = " "
Output: true
Explanation: s is an empty string "" after removing non-alphanumeric characters.
Since an empty string reads the same forward and backward, it is a palindrome.

```

**Constraints:**

- `1 <= s.length <= 2 * 105`
- `s` consists only of printable ASCII characters.

# [풀이]

### 1. 리스트 사용

```python

class Solution:
    def isPalindrome(self, s: str) -> bool:
        strs = []
        for char in s:
            if char.isalnum():
                strs.append(char.lower())
        
        while len(strs) > 1:
            if strs.pop(0) != strs.pop():
                return False

        return True
```

- Palindrome 특성 상 양끝이 “대칭”이기 때문에 양끝을 pop()시켜서 비교!

## 📌주목

```python
input: s = "A man, a plan, a canal: Panama"

for char in s:
	if char.isalnum():
		print(char)

output:
A
m
a
n
a
p
l
a
n
a
c
a
n
a
l
P
a
n
a
m
a
```

- .isalnum() : 문자열이 영어, 혹은 한글, 숫자로 되어 있으면 참 return

### 2. 다른 사람 풀이.. Dictionary를 사용한 방법!

```python
class Solution:
    def isPalindrome(self, s: str) -> bool:
        i, j = 0, len(s) - 1
				#양끝에서 차례로 보는 구조
        while i < j:
            forw = s[i].lower()
            backw = s[j].lower()
						#쉼표나 띄어쓰기와 비교하는것을 막기 위해서
            if forw.isalnum() and backw.isalnum():
                if forw == backw:
                    i, j = i +1, j -1
                    continue
                else:
                    return False
						# 알파벳이 아닐 경우에 다음칸으로 이동
            i, j = i + (not forw.isalnum()), j - (not backw.isalnum())
        return True
```

- 단점: 메모리나 런타임 측면에서는 리스트 사용이 훨씬 좋음
