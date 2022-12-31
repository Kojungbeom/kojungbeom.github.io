---
title: LeetCode - 739. Daily Temperatures
author: MINJEONG KIM
date: 2022-12-28
category: Jekyll
layout: post
---

# [#739. Daily Temperatures](https://leetcode.com/problems/daily-temperatures/description/
`LeetCode`의 `Medium`난이도의 문제이다.

# 📖Description

Given an array of integers `temperatures` represents the daily temperatures, return *an array* `answer` *such that* `answer[i]` *is the number of days you have to wait after the* `ith` *day to get a warmer temperature*. If there is no future day for which this is possible, keep `answer[i] == 0` instead.

**Example 1:**

```
Input: temperatures = [73,74,75,71,69,72,76,73]
Output: [1,1,4,2,1,1,0,0]

```

**Example 2:**

```
Input: temperatures = [30,40,50,60]
Output: [1,1,1,0]

```

**Example 3:**

```
Input: temperatures = [30,60,90]
Output: [1,1,0]
```

# 🔍Approach

각각의 날에 대해서 따뜻한 날까지 걸리는 시간을 구하는 것!!

시간은 좀 어려울 수 있으니,  index라고 생각하면 됨

## 💡Intuition💡

직관적으로 어떻게 하면 풀 수 있을지 생각해보자. ⇒ **스택**을 활용해야 한다.

<aside>
💡 이중 for문의 굴레에서 벗어나서, **자료구조를 활용**하자!

</aside>

과정은 아래 그림과 같다.
![KakaoTalk_20221231_102028167](https://user-images.githubusercontent.com/101111603/210125585-f7a027fc-11ab-4bd8-b7eb-786cc0a069fe.jpg)
![KakaoTalk_20221231_102028167_01](https://user-images.githubusercontent.com/101111603/210125589-4dff2c7d-f0f0-487e-80b9-fdf7dac26f90.jpg)
![KakaoTalk_20221231_102028167_02](https://user-images.githubusercontent.com/101111603/210125591-14f9dbe3-ec73-40f5-b16b-6f2fdd2d5e37.jpg)
![KakaoTalk_20221231_102028167_03](https://user-images.githubusercontent.com/101111603/210125593-82cc5dca-2a47-403f-9fff-c0d11d398832.jpg)
![KakaoTalk_20221231_102028167_04](https://user-images.githubusercontent.com/101111603/210125597-af04288f-a46d-44c9-9616-d9cb787e0231.jpg)
![KakaoTalk_20221231_102028167_05](https://user-images.githubusercontent.com/101111603/210125601-a3c657b2-0bc3-4856-942d-76989df054f2.jpg)
![KakaoTalk_20221231_102028167_06](https://user-images.githubusercontent.com/101111603/210125613-5dc324da-2416-426e-9e66-8b3af0483673.jpg)
![KakaoTalk_20221231_102028167_07](https://user-images.githubusercontent.com/101111603/210125614-6dc7ccbf-1d64-4536-a237-24c811d0444b.jpg)
![KakaoTalk_20221231_102028167_08](https://user-images.githubusercontent.com/101111603/210125616-37ef3e0c-ab51-4fc5-8c8e-387dd8b1ca07.jpg)
![KakaoTalk_20221231_102028167_09](https://user-images.githubusercontent.com/101111603/210125620-b901494a-ebdd-4e75-aee2-a3368adad0ca.jpg)
![KakaoTalk_20221231_102028167_10](https://user-images.githubusercontent.com/101111603/210125623-b8ec0493-1930-4099-8c20-c00e496002d0.jpg)
![KakaoTalk_20221231_102028167_11](https://user-images.githubusercontent.com/101111603/210125627-d4ed323d-7914-48af-8fc1-c430e5179815.jpg)




## 🚩Try : 1

```python
class Solution(object):
    def dailyTemperatures(self, temperatures):
        """
        :type temperatures: List[int]
        :rtype: List[int]
        """
        stack = [0]
        ans = []
        for i in range(len(temperatures)):
            while len(stack) > 0 and temperatures[i] > temperatures[stack[-1]]:
                stack.pop()
                if len(stack) == 0:
                    ans.append(0)
                else:
                    ans.append(i-stack[-1])
            stack.append(i)
        print(ans)
        return ans
```

→ 이렇게 while문의 조건을 수정했다.

그랬더니 TimeLimit은 처리됐는데 wrong answer가 나왔다.
![wrong_answer](https://user-images.githubusercontent.com/101111603/210125642-366f0552-852e-4a0f-9c05-296811b2bdf5.jpg)


## 🚩Try : 2

```python
class Solution(object):
    def dailyTemperatures(self, temperatures):
        """
        :type temperatures: List[int]
        :rtype: List[int]
        """
        stack = [0]
        ans = [0]
        comp, value = 0, 0
        for i in range(1, len(temperatures)):
            while len(stack) > 0 and temperatures[i] > temperatures[stack[-1]]:
                value = stack.pop()
                ans[comp] = i -comp
            stack.append(i)
        print(ans)
        return ans
```
![wrong_answer 1](https://user-images.githubusercontent.com/101111603/210125648-2094f87f-7f0f-45b3-8ab6-9aee06d47915.jpg)



## 🤔🎯Submission

이해가 되지 않아, 결국은 [참고자료](https://youtu.be/cTBiBSnjO3c)를 봤다. 

```python
class Solution(object):
    def dailyTemperatures(self, temperatures):
        """
        :type temperatures: List[int]
        :rtype: List[int]
        """
        stack = []
        output = [0] * len(temperatures)

        for i, temp in enumerate(temperatures):
            while stack and temp > temperatures[stack[-1]]:
                stackIdx = stack.pop()
                output[stackIdx] = i - stackIdx
            stack.append(i)

        return output
```

1. 오늘의 온도와 다른 날의 온도와 비교했을 때 더 큰 것이 없다면 0으로 들어가야 한다. 따라서 이는 default값으로 초반에 0으로 다 초기화함으로써 해결한다. (`output = [0] * len(temperatures)`)
2. 위의 그림에서도 봤듯이, `stack`에 들어올 때 `stack`의 index도 함께 저장되어야 한다. 따라서 `enumerate`를 사용한다. (`for i, temp in enumerate(temperatures):` )
3. `stack`은 index값이 저장되고 있다. `stack`의 최상단에 있는 index에 해당하는 temperatures보다 그 오늘의 온도(`temp`)가 더 크다면, stackIdx에 최상단 index를 **pop**한다.
    - `stack`에 요소가 있고, 오늘의 온도보다 작으면 스택안에 있는 요소를 **pop**한다.
    - output의 해당하는 index에 해당 날과 오늘의 차이를 구해 저장한다.
    - 스택에 요소가 없거나 오늘의 온도가 더 작을 때까지 반복한다.
    - 반복이 끝나면 `stack`에 오늘의 온도를 추가한다.(`i`)
    - 1~3번을 반복한다.
    

# 💡Rememberance

- 스택, 그리고 자료구조에 대해 다시 공부해야겠다.
- 스택은 개념은 쉽지만 코드를 짤 때는 뭐가 나와야 하고 뭐가 들어가야 하는지 이런 거를 잘 봐야 할 것 같다.
- 이 문제는 내가 직접 짜지 않았기 때문에 나중에 다시 복습해봐야 할 것 같다.
- 영상을 보고 직접 하나하나 그림을 그려 과정을 살펴보았다. 그 후 다시 코드를 보니 이해가 되었다. 무엇이든 코드를 짜기 전에 머릿속에 있는 것을 그림이나 숫자로 그리거나 나열해본 후에 돌입해야 할 것 같다.
- 저번 괄호 문제는 ‘짝’을 맞춰야 하기 때문에 stack을 사용했다면 이 문제는 브루트포스가 아니라 더 간결하게 더 큰 온도만 남도록 하기 위해 stack을 사용하였다. (아니 정확한 이유는 아직 잘 가늠이 안 간다) 그래도 이렇게 정리하면서 조금 이라도 이해해서 다행이다. 다음에는 아무것도 안 보고 혼자서 짜보고 싶다.
