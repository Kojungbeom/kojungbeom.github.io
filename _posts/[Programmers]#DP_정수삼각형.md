---
title: Programmers - 모음사전
author: EUNJI KWAK
date: 2023-2-7
categories: [Programmers, EUNJI_p]
tags: [다이나믹 프로그래밍, DP, Dynamic Programming]
---

# [문제](https://school.programmers.co.kr/learn/courses/30/lessons/43105?language=python3)

### **문제 설명**

![https://grepp-programmers.s3.amazonaws.com/files/production/97ec02cc39/296a0863-a418-431d-9e8c-e57f7a9722ac.png](https://grepp-programmers.s3.amazonaws.com/files/production/97ec02cc39/296a0863-a418-431d-9e8c-e57f7a9722ac.png)

위와 같은 삼각형의 꼭대기에서 바닥까지 이어지는 경로 중, 거쳐간 숫자의 합이 가장 큰 경우를 찾아보려고 합니다. 아래 칸으로 이동할 때는 대각선 방향으로 한 칸 오른쪽 또는 왼쪽으로만 이동 가능합니다. 예를 들어 3에서는 그 아래칸의 8 또는 1로만 이동이 가능합니다.

삼각형의 정보가 담긴 배열 triangle이 매개변수로 주어질 때, 거쳐간 숫자의 최댓값을 return 하도록 solution 함수를 완성하세요.

### 제한사항

- 삼각형의 높이는 1 이상 500 이하입니다.
- 삼각형을 이루고 있는 숫자는 0 이상 9,999 이하의 정수입니다.

### 입출력 예

| triangle | result |
| --- | --- |
| [[7], [3, 8], [8, 1, 0], [2, 7, 4, 4], [4, 5, 2, 6, 5]] | 30 |

# [풀이]

**반복되는 것**

1. 둘 중의 큰 수를 비교 -> 큰 수를 기존의 값에 누적하여 더하기
2. 대소 비교 함수
1-1. 파라미터로 리스트의 인덱스 받기 def cal(idx1, idx2)
2-1. big = max(triangle[idx1], traingle[idx2])
3-1. return answer += big

[7] = triangle[0][0]
[3, 8] = [traingle[1][0], triangle[1][0]]
[8,1,0]=[traingle[2][0],traingle[2][1],triangle[2][2]]
[2,7,4,4]=[triangle[3][0], triangle[3][1], trianle[3][2], triangle[3][3]]

## 📌Dynamic Programming

- 최종 코드

```python
def solution(triangle):
    for i in range(1,len(triangle)):
        for j in range(i+1): #3,8
            if j == 0: #왼쪽 끝에 있는 값 누적
                triangle[i][j] += triangle[i-1][0]
            elif i == j: #오른쪽 끝에 있는 값
                triangle[i][j] += triangle[i-1][-1]
            else: #그 외의 중간에 있는 값 대소 비교 후 누적
                triangle[i][j] += max(triangle[i-1][j-1], triangle[i-1][j])
    answer =max(triangle[-1])
                
    return answer
```

## 📌주목!

- 동적계획법: 하나의 큰 문제를 여러 개의 작은 문제로 나누어서 그 결과를 저장하여 다시 큰 문제를 해결할 때 사용하는 것
    - Bottom-Up: 반복문 사용(TABLE 채우는 형식)
    - Top-Down: 재귀 사용
