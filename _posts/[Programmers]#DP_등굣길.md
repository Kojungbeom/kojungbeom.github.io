# [Programmers]#DP_등굣길

---
title: Programmers - 등굣길
author: EUNJI KWAK
date: 2023-2-10
categories: [Programmers, EUNJI_p]
tags: [다이나믹 프로그래밍, DP, Dynamic Programming]
---

# [문제]([https://school.programmers.co.kr/learn/courses/30/lessons/42898](https://school.programmers.co.kr/learn/courses/30/lessons/42898))

### **문제 설명**

계속되는 폭우로 일부 지역이 물에 잠겼습니다. 물에 잠기지 않은 지역을 통해 학교를 가려고 합니다. 집에서 학교까지 가는 길은 m x n 크기의 격자모양으로 나타낼 수 있습니다.

아래 그림은 m = 4, n = 3 인 경우입니다.

![https://grepp-programmers.s3.amazonaws.com/files/ybm/056f54e618/f167a3bc-e140-4fa8-a8f8-326a99e0f567.png](https://grepp-programmers.s3.amazonaws.com/files/ybm/056f54e618/f167a3bc-e140-4fa8-a8f8-326a99e0f567.png)

가장 왼쪽 위, 즉 집이 있는 곳의 좌표는 (1, 1)로 나타내고 가장 오른쪽 아래, 즉 학교가 있는 곳의 좌표는 (m, n)으로 나타냅니다.

격자의 크기 m, n과 물이 잠긴 지역의 좌표를 담은 2차원 배열 puddles이 매개변수로 주어집니다. **오른쪽과 아래쪽으로만 움직여** 집에서 학교까지 갈 수 있는 최단경로의 개수를 1,000,000,007로 나눈 나머지를 return 하도록 solution 함수를 작성해주세요.

### 제한사항

- 격자의 크기 m, n은 1 이상 100 이하인 자연수입니다.
    - m과 n이 모두 1인 경우는 입력으로 주어지지 않습니다.
- 물에 잠긴 지역은 0개 이상 10개 이하입니다.
- 집과 학교가 물에 잠긴 경우는 입력으로 주어지지 않습니다.

### 입출력 예

| m | n | puddles | return |
| --- | --- | --- | --- |
| 4 | 3 | [[2, 2]] | 4 |

### 입출력 예 설명

![https://grepp-programmers.s3.amazonaws.com/files/ybm/32c67958d5/729216f3-f305-4ad1-b3b0-04c2ba0b379a.png](https://grepp-programmers.s3.amazonaws.com/files/ybm/32c67958d5/729216f3-f305-4ad1-b3b0-04c2ba0b379a.png)

# [풀이]

**초등학생 때 풀었던 최단 경로 구하는 문제와 완전 동일!!**

- 테두리를 1로 채우고 목적지까지 대각 성분들을 더해가면서 최단경로 산출
    - dp[j][k] = dp[j][k-1] + dp[j-1][k]
    - if j==k==1:
                    continue
- 장애물이 있는 경우: 그 장애물이 있는 칸은 계산 제외!
    - dp = [m+1][n+1] ← dp table의 행, 열에 한 칸 더 추가한 이유:
    
    바깥에 0으로 채워서 테두리를 1로 채워지도록 함 
    
    - return dp[n][m] ← 마지막 목적지에 저장된 값 return

## 📌Dynamic Programming

- 최종 코드

```python
def solution(m, n, puddles):
    answer = 0
    puddles = [[q,p] for [p,q] in puddles]
    print(puddles)
    dp = [[0] * (m + 1) for i in range(n + 1)] 
    dp[1][1] = 1
    for j in range(1,n+1):
        for k in range(1,m+1):
            if j==k==1:
                continue
            if [j,k] in puddles:
                continue
            else:
                dp[j][k] = dp[j][k-1] + dp[j-1][k]

                
    return dp[n][m] %1000000007
```