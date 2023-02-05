# [Programmers]#그리디_단속카메라

---
title: Programmers - 단속카메라
author: EUNJI KWAK
date: 2023-2-3
categories: [Programmers, EUNJI_p]
tags: [그리디]
---

# [문제]([https://school.programmers.co.kr/learn/courses/30/lessons/42884](https://school.programmers.co.kr/learn/courses/30/lessons/42884))

### **문제 설명**

고속도로를 이동하는 모든 차량이 고속도로를 이용하면서 단속용 카메라를 한 번은 만나도록 카메라를 설치하려고 합니다.

고속도로를 이동하는 차량의 경로 routes가 매개변수로 주어질 때, 모든 차량이 한 번은 단속용 카메라를 만나도록 하려면 최소 몇 대의 카메라를 설치해야 하는지를 return 하도록 solution 함수를 완성하세요.

**제한사항**

- 차량의 대수는 1대 이상 10,000대 이하입니다.
- routes에는 차량의 이동 경로가 포함되어 있으며 routes[i][0]에는 i번째 차량이 고속도로에 진입한 지점, routes[i][1]에는 i번째 차량이 고속도로에서 나간 지점이 적혀 있습니다.
- 차량의 진입/진출 지점에 카메라가 설치되어 있어도 카메라를 만난것으로 간주합니다.
- 차량의 진입 지점, 진출 지점은 -30,000 이상 30,000 이하입니다.

**입출력 예**

| routes | return |
| --- | --- |
| [[-20,-15], [-14,-5], [-18,-13], [-5,-3]] | 2 |

**입출력 예 설명**

- 5 지점에 카메라를 설치하면 두 번째, 네 번째 차량이 카메라를 만납니다.
- 15 지점에 카메라를 설치하면 첫 번째, 세 번째 차량이 카메라를 만납니다.

# [풀이]

“”모든 차량이 한 번은 단속 카메라를 만나도록 하는 최소 카메라의 개수””

1. 필요한 변수

→ 카메라의 위치, 카메라의 개수 ; 

카메라의 위치를 옮겨다니면서 경로 사이에 카메라가 위치하면 continue, 경로에 없다면 카메라 개수 증가

## 📌주목!

```python
def solution(routes):
    answer, camera = 0, -30001 
    routes = sorted(routes, key=lambda x : x[1])
    for i in range(len(routes)):
        if routes[i][0]  <= camera <= routes[i][1]:
            continue
        else:
            answer += 1
            camera = routes[i][1]

    return answer
```

heapq.heappop(list): list 내에서 가장 작은 값을 반환!

### 다른 사람 풀이

→ 대부분 다 저런 방식으로 풀이!