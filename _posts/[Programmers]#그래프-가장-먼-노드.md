---
title: Programmers - 가장먼노드
author: EUNJI KWAK
date: 2023-3-3
categories: [Programmers, EUNJI_p]
tags: [그래프]
---

# [문제](https://school.programmers.co.kr/learn/courses/30/lessons/49189)

### **문제 설명**

n개의 노드가 있는 그래프가 있습니다. 각 노드는 1부터 n까지 번호가 적혀있습니다. 1번 노드에서 가장 멀리 떨어진 노드의 갯수를 구하려고 합니다. 가장 멀리 떨어진 노드란 최단경로로 이동했을 때 간선의 개수가 가장 많은 노드들을 의미합니다.

노드의 개수 n, 간선에 대한 정보가 담긴 2차원 배열 vertex가 매개변수로 주어질 때, 1번 노드로부터 가장 멀리 떨어진 노드가 몇 개인지를 return 하도록 solution 함수를 작성해주세요.

### 제한사항

- 노드의 개수 n은 2 이상 20,000 이하입니다.
- 간선은 양방향이며 총 1개 이상 50,000개 이하의 간선이 있습니다.
- vertex 배열 각 행 [a, b]는 a번 노드와 b번 노드 사이에 간선이 있다는 의미입니다.

### 입출력 예

| n | vertex | return |
| --- | --- | --- |
| 6 | [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2], [2, 4], [5, 2]] | 3 |

### 입출력 예 설명

예제의 그래프를 표현하면 아래 그림과 같고, 1번 노드에서 가장 멀리 떨어진 노드는 4,5,6번 노드입니다.

![https://grepp-programmers.s3.amazonaws.com/files/ybm/fadbae38bb/dec85ab5-0273-47b3-ba73-fc0b5f6be28a.png](https://grepp-programmers.s3.amazonaws.com/files/ybm/fadbae38bb/dec85ab5-0273-47b3-ba73-fc0b5f6be28a.png)

# [풀이]

## 그래프 문제 푸는 법: BFS

- DFS는 안되는 이유: 깊이가 깊어지는 간선부터 탐색하기 때문에 깊이 차원에서 모순이 생김
- BFS 푸는 법: 가까운 지점을 모두 방문/방문했던 정점으로 시작하여 다시 인접한 지점을 차례대로 방문/큐 사용/그때 그때 방문 여부 확인

## FLOW

1. 상위 노드를 key값으로 설정하고, 하위 노드를 value값을 append시킴
2. 추가한 하위 노드를 방문했다고 표시
3. 모든 노드를 방문했을 시에 반복문 종료

## 📌코드

```python
from collections import deque

def solution(n, edge):
    answer = 0
    queue = deque([[1, 0]])
    visited = [0]*(n+1)
    nodes = 0
    temp = []
    dict = {}
    
    for i in range(1, n+1):
        dict[i] = []
        
    for i in range(len(edge)):
        dict[edge[i][0]].append(edge[i][1])
        dict[edge[i][1]].append(edge[i][0])
    visited[1] =1
    while queue:
        n, d = queue.popleft()
        for i in dict[n]:
            if not visited[i]:
                queue.append([i, d+1])
                visited[i] = 1
        if not temp:
            temp.append([n, d])
        else:
            if d == temp[0][1]:
                temp.append([n,d])
            elif d > temp[0][1]:
                temp = []
                temp.append([n,d])        
    return len(temp)
```
