---
title: 프로그래머스 - H-Index
author: MINJEONG KIM
date: 2023-1-25
categories: [Programmers, MINJEONG_P]
tags: [Programmers, MINJEONG, Sort]
---


# [프로그래머스 - 고득점 kit - 정렬 - H-Index](https://school.programmers.co.kr/learn/courses/30/lessons/42747)

# 📖Problems

H-Index는 과학자의 생산성과 영향력을 나타내는 지표입니다. 어느 과학자의 H-Index를 나타내는 값인 h를 구하려고 합니다. 위키백과[1](https://school.programmers.co.kr/learn/courses/30/lessons/42747#fn1)에 따르면, H-Index는 다음과 같이 구합니다.

어떤 과학자가 발표한 논문 `n`편 중, `h`번 이상 인용된 논문이 `h`편 이상이고 나머지 논문이 h번 이하 인용되었다면 `h`의 최댓값이 이 과학자의 H-Index입니다.

어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.

**제한사항**

- 과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다.
- 논문별 인용 횟수는 0회 이상 10,000회 이하입니다.

**입출력 예**

| citations | return |
| --- | --- |
| [3, 0, 6, 1, 5] | 3 |

**입출력 예 설명**

이 과학자가 발표한 논문의 수는 5편이고, 그중 3편의 논문은 3회 이상 인용되었습니다. 그리고 나머지 2편의 논문은 3회 이하 인용되었기 때문에 이 과학자의 H-Index는 3입니다

# 🔍Institution

- input: citations(각각의 논문이 인용된 횟수)
- output: 리스트 중에서 h편 이상 인용이 된 논문 개수인 h

“과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고, 나머지 논문이 h번 이하 인용될 때, h의 최댓값”

| case1. citations = [3, 0, 6, 1, 5] | case2. citations = [3, 0, 6, 1, 5, 5, 5] |
| --- | --- |
| h = 0 → 0회 이상 : 0개 이상임. 5개로 통과임. 하지만 h=0
h = 1 → 1회 이상 : 1개 이상임. 4개로 통과임. 하지만 h=1
h = 2 → 2회 이상 : 2개 이상임. 3개로 통과임. h = 2
h = 3 → 3회 이상 : 3개 이상임. 3개로 통과임.  h=3
h = 4 → 0회 이상 : 4개 이상이 아니므로 불통
h = 5 → 5회 이상 : 5개 이상이 아니므로 불통
h = 6 → 6회 이상 : 6개 이상이 아니므로 불통 | h = 0 → 0회 이상 : 0개 이상임. 7개로 통과임. 하지만 h=0
h = 1 → 1회 이상 : 1개 이상임. 6개로 통과임. 하지만 h=1
h = 2 → 2회 이상 : 2개 이상임. 6개로 통과임. h = 2
h = 3 → 3회 이상 : 3개 이상임. 5개로 통과임.  h=3
h = 4 → 0회 이상 : 4개 이상임. 4개로 통과. h = 4
h = 5 → 5회 이상 : 5개 이상이 아니므로 불통
h = 6 → 6회 이상 : 6개 이상이 아니므로 불통 |
| h 최댓값 = 3 | h 최댓값 = 4 |

# 🔍Approach

이중 for문을 쓰더라도 일단 돌아가도록 만드는 것을 먼저 했다 (1차).

이후, 어떻게 시간복잡도를 구할 수 있을까 고민하다가, 스터디 선배의 힌트로 풀게 되었다. (2차) (프로그래머스에도 올라와있는 답안이기도 하다.)

## 🚩1차 : 이중 for문

**Flow**

1. `h`는 문제에서 구하고자 하는 **h-index**이며, `count`는 논문이 인용된 편이 몇 편인지 확인하는 변수이다. 
2. `citations`를 정렬한다. 
3. 이중 for문으로 `citations`(논문 인용횟수)의 `i`번째 값과 `h`를 비교한다. `h`를 기준으로 더 클 경우, `h`이상이므로, `count`에 1을 더한다.
4. 만약 논문이 인용된 편(`count`)이 h와 같거나 클 때, `answer`에 `h`의 값을 집어넣는다.
5. 이후 다시 `count`를 초기화하고 논문 개수(`len(citations)`) 만큼 이중 for문을 반복한다.

```python
def solution(citations):
    answer = 0
    h, count = 0, 0
    citations.sort()
    for h in range(len(citations)+1):
        for i in range(len(citations)):
            if h <= citations[i]:
                count += 1
        if count >= h:
            answer = h
        count = 0
        print(answer)
    return answer
```

**Time complexity : $O(n^2)$**

## 🚩2차 : 시간복잡도를 줄이자

s

| H | H번 이상 인용 |
| --- | --- |
| 0 | 5 |
| 1 | 4 |
| 2 | 3 |
| 3 | 3 |
| 4 | 2 |
| 5 | 2 |
| …6 |  |

위의 표를 보면 h-index는 논문의 수보다 클 수 없다. 또한 sort() 함으로써 얻을 수 있는 것을 이용한다. sort를 함으로써 counting하는 부분을 지울 수 있다. 

위의 표를 잘 보면 어떤 수를 기준으로 값이 작아지거나 커지거나 한다. 그 값은 전체 논문 개수에서 index 값을 뺀 값과 같다. 

이를 이용해서 코드를 구현한다. 

```python
def solution(citations):
    answer = 0
    citations.sort()
    # 0, 1, 3, 5, 6
    for i in range(len(citations)):
        if citations[i] >= len(citations) - i :
            answer = len(citations) - i
            return answer
    return 0
```

citations[0] = 0 **`≥`** 5-0 = 5 →조건 만족 X 

citations[1] = 1 **`≥`** 5-1 = 4 →조건 만족 X

citations[2] = 3 **`≥`** 5-2 = 3 → 조건 만족 O ⇒ 만족되면 바로 **`return`**

citations[3] = 5 **`≥`** 5-3 = 2

citations[4] = 6 **`≥`** 5-1 = 1

**Time complexity : $O(nlogn)$**

- `sort()` : $O(logn)$
- `for`: $O(n)$

![스크린샷, 2023-01-25 12-54-17.png](%E1%84%8C%E1%85%A5%E1%86%BC%E1%84%85%E1%85%A7%E1%86%AF%20-%20H-Index%2052fa0ee061ca45a5a97e8b573ba1a9e6/%25EC%258A%25A4%25ED%2581%25AC%25EB%25A6%25B0%25EC%2583%25B7_2023-01-25_12-54-17.png)

참고한 답안 ⬆️

# others submit

- 오름차순으로 정렬했을 때

```python
def solution(citations):
    citations.sort()
    for idx , citation in enumerate(citations):
        if citation >= len(citations) - idx :
            return len(citations) - idx
    return 0
```

- 내림차순으로 정렬했을 때

```python
def solution(citations):
    citations.sort(reverse=True)
    for idx , citation in enumerate(citations):
        if idx >= citation:
            return idx
    return len(citations)
```

# 💡Retrospect

- 규칙을 생각할 필요가 있는 문제였다. 또 정렬을 사용함으로써 시간복잡도가 줄어드는 것을 확인할 수 있는 좋은 문제였다.
- sort를 했을 때 무언가 하나를 할 필요가 없어지는 것. 즉 counting 했던 부분이 없어지는 것을 배웠다.
- 동시에 이런 아이디어를 내는 것이 어려웠다.
- 또 이중 for문 회피하려다가 더 생각이 꼬이게 되었다.  코드를 짜기 어렵다면 일단 이중 for문이라도 짜보자. 코드 짜고 작동이 잘 된다면 그때 시간복잡도를 줄인 효율적인 코드로 변경하자.
