---
title: LeetCode-242.Valid-Anagram
author: EUNJI KWAK
date: 2023-1-17
categories: [LeetCode, EUNJI_L]
tags: [hash, 해시]
---

# [문제](https://leetcode.com/problems/valid-anagram/description/)

Given two strings `s` and `t`, return `true` *if* `t` *is an anagram of* `s`*, and* `false` *otherwise*.

An **Anagram** is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

## example 1:

```python
Input: s = "anagram", t = "nagaram"
Output: true
```

## example 2:

```
Input: s = "rat", t = "car"
Output: false
```

# [풀이]

- sorting 시키고 비교 !

```python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        s = sorted(s)
        t = sorted(t)
        if s != t:
            return False
        else:
            return True
```

- dictionary를 사용한 방법 !
    - contains duplicate 문제와 같은 방식으로 각각의 dictionary 만들어서 그 둘을 비교 !

```python
class Solution:
    def isAnagram(self, s: str, t: str) -> bool:
        dict_s = {}
        dict_t = {}
        
        for i in range(len(s)):
            if s[i] in dict_s.keys():
                dict_s[s[i]] += 1
            else:
                dict_s[s[i]] = 1
        
        for i in range(len(t)):
            if t[i] in dict_t.keys():
                dict_t[t[i]] += 1
            else:
                dict_t[t[i]] = 1

        if dict_s != dict_t:
            return False
        else:
            return True
```
