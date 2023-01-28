---
title: 프로그래머스 - H-Index
author: JUNGBEOM KO
date: 2023-1-25
categories: [Programmers, JUNGBEOM_P]
tags: [Programmers, JUNGBEOM, 정렬]
---

# [프로그래머스] H-Index

[Link](https://school.programmers.co.kr/learn/courses/30/lessons/42747)



## 문제

H-Index는 과학자의 생산성과 영향력을 나타내는 지표입니다. 어느 과학자의 H-Index를 나타내는 값인 h를 구하려고 합니다. 위키백과[1](https://school.programmers.co.kr/learn/courses/30/lessons/42747#fn1)에 따르면, H-Index는 다음과 같이 구합니다.

어떤 과학자가 발표한 논문 `n`편 중, `h`번 이상 인용된 논문이 `h`편 이상이고 나머지 논문이 h번 이하 인용되었다면 `h`의 최댓값이 이 과학자의 H-Index입니다.

어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.

##### 제한사항

- 과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다.
- 논문별 인용 횟수는 0회 이상 10,000회 이하입니다.



## 입출력 예

| citations       | return |
| --------------- | ------ |
| [3, 0, 6, 1, 5] | 3      |



## 풀이

문제를 보자마자 딱 들었던 생각은 Brute force 방법으로 중첩 for loop을 사용하여 h값과 비교하면서 그때의 최대의 h를 찾아내면 되겠다라는 것 이었다.

자세히 말하면

1. h=1, count = 0
2. citations[i]가 h보다 크거나 같으면 count += 1
3. i가 len(citations)-1과 같을 때 까지만 반복
4. count가 h보다 크거나 같으면 answer = h
5. h += 1, count = 0
6. 2~5를 h가 len(citations)과 같을 때 까지만 반복

이러면 count가 h보다 크거나 같을 때 answer 가 그때의 h로 업데이트 되는데, 어차피 h는 매 반복마다 커지는 값으로 나중에 업데이트되면 그게 무조건 h의 최대값이다.

이를 코드로 옮기면 아래와 같다.

```python
def solution(citations):
    answer = 0
    for h in range(1, len(citations)+1):
        count = 0
        for i in range(len(citations)):
            if citations[i] >= h:
                count += 1
        if count >= h:
            answer = h
            
    return answer
```



하지만 이 방법의 공간복잡도는$$O(1)$$이지만 시간복잡도는 $$O(n^2)$$으로 느리다.

유명한 알고리즘 공부 책에 따르면 (책 이름이 기억안남) 쓰잘때없는 반복이 어느 부분에서 일어나고 있는지 찾아야한다고 했다.

위 코드에서는 두개의 반복문이 중첩되어 돌고 있다.

- h 점차 증가
- h와 citations[i] 비교



(여기서부턴 건너뛰어도 좋습니다.)

현재 citations는 정렬이 된 배열이 아니라 크기가 제각각이다.

만약 citations가 정렬이 되어있다면? citations[i]가 i+1보다 크다면? len(citations) - i개의 논문이 h (i+1과 같은 값임)보다 크다는 것을 의미한다.

그럼 H-index가 어떻게 계산되는지를 다시 생각해보자.

논문 n편중 h번 이상 인용된 논문이 h편 이상이면 그때의 h의 최대값이 H-index가 된다.

여기서 알수있는 H-index의 특징은 바로 H-index는 n이상이 될 수 없다는 것이다.

h번 이상 인용된 논문이 h편 이상이라는 제한조건이 있어서 H-index는 논문의 수보다 커지지 못한다.

이러한 특징과 정렬된 배열의 특징 (a = [1,2,3,4]가 있다고 할 때 a안에 a[2]보다 크거나 같은 수의 개수는 len(a)-2)을 사용한다면 시간복잡도를 줄일 수도 있다.

(주저리 주저리 끝)



입출력 예를 가지고 해보면 `citations`를 정렬하면 그때의 값은 `citations = [0,1,3,5,6]`이다.

H-index가 3이 되려면 만족해야하는 조건이

- 3보다 인용이 더 된 논문이 3편 이상이어야 한다.

citations의 길이는 총 5로, citations[5-3]가 3보다 더 커야지만 3보다 인용이 더 된 논문이 3편 이상이 될 수 있다.

citations[5-3]이 3보다 작다면 3보다 인용이 더 된 논문은 많아봐야 2편 이상이 된다. 이러면 H-index가 3이 될 수가 없다.

이러한 규칙을 활용하여 h를 0부터 len(citations)까지 반복한다면 H-index를 $$O(nlogn)$$의 시간복잡도로 해결할 수가 있다. (정렬에 nlogn이 소모됨)

이를 코드로 옮기면...

```python
def solution(citations):
    citations.sort()
    for h in range(len(citations)):
        if citations[h] >= len(citations) - h:
            return len(citations) - h
    return 0
```

