---
title: Programmers - 구명보트
author: EUNJI KWAK
date: 2023-2-2
categories: [Programmers, EUNJI_p]
tags: [Heap, 힙]
---

# [문제](https://school.programmers.co.kr/learn/courses/30/lessons/42885)

### **문제 설명**

무인도에 갇힌 사람들을 구명보트를 이용하여 구출하려고 합니다. 구명보트는 작아서 한 번에 최대 **2명**씩 밖에 탈 수 없고, 무게 제한도 있습니다.

예를 들어, 사람들의 몸무게가 [70kg, 50kg, 80kg, 50kg]이고 구명보트의 무게 제한이 100kg이라면 2번째 사람과 4번째 사람은 같이 탈 수 있지만 1번째 사람과 3번째 사람의 무게의 합은 150kg이므로 구명보트의 무게 제한을 초과하여 같이 탈 수 없습니다.

구명보트를 최대한 적게 사용하여 모든 사람을 구출하려고 합니다.

사람들의 몸무게를 담은 배열 people과 구명보트의 무게 제한 limit가 매개변수로 주어질 때, 모든 사람을 구출하기 위해 필요한 구명보트 개수의 최솟값을 return 하도록 solution 함수를 작성해주세요.

### 제한사항

- 무인도에 갇힌 사람은 1명 이상 50,000명 이하입니다.
- 각 사람의 몸무게는 40kg 이상 240kg 이하입니다.
- 구명보트의 무게 제한은 40kg 이상 240kg 이하입니다.
- 구명보트의 무게 제한은 항상 사람들의 몸무게 중 최댓값보다 크게 주어지므로 사람들을 구출할 수 없는 경우는 없습니다.

### 입출력 예

| people | limit | return |
| --- | --- | --- |
| [70, 50, 80, 50] | 100 | 3 |
| [70, 80, 50] | 100 | 3 |

# [풀이]

1. 리스트 sorting
2. 각 리스트의 각 끝 지점에서부터 옮기기 시작
3. 각 요소의 합이 limit보다 작거나 같을 경우 answer +=1 && 오른쪽으로 한 칸 이동

⇒ 두 명이 한 보트에 타는 경우 

1. return len(people) - answer 

⇒ ( 각자가 하나의 보트를 타는 경우 ) - ( 가장 무거운 사람과 가벼운 사람을 묶어서 태우는 경우 = answer )

```python
def solution(people, limit) :
    answer = 0
    people.sort()

    start = 0
    end = len(people) - 1
    while start < end :
        if people[end] + people[start] <= limit :
            start += 1
            answer += 1
        end -= 1
    return len(people) - answer
```

## 📌주목!

- 전형적인 Two Pointer 유형의 문제로 Two Sum 2 문제 참조할 것 !
