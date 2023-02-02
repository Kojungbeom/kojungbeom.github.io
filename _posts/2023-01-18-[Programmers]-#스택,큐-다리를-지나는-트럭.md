---
title: Programmers-스택큐-다리를-지나는-트럭
author: EUNJI KWAK
date: 2023-1-18
categories: [Programmers, EUNJI_P]
tags: [Queue, 큐]
---

# 문제

**트럭 여러 대**가 강을 가로지르는 **일차선 다리를 정해진 순으로 건너려 합니다.** **모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다.**

다리에는 트럭이 최대 bridge_length대 올라갈 수 있으며, 다리는 weight 이하까지의 무게를 견딜 수 있습니다. 단, 다리에 완전히 오르지 않은 트럭의 무게는 무시합니다.

예를 들어, 트럭 2대가 올라갈 수 있고 무게를 10kg까지 견디는 다리가 있습니다.

무게가 [7, 4, 5, 6]kg인 트럭이 순서대로 최단 시간 안에 다리를 건너려면 다음과 같이 건너야 합니다.

| 경과 시간 | 다리를 지난 트럭 | 다리를 건너는 트럭 | 대기 트럭 |
| --- | --- | --- | --- |
| 0 | [] | [] | [7,4,5,6] |
| 1~2 | [] | [7] | [4,5,6] |
| 3 | [7] | [4] | [5,6] |
| 4 | [7] | [4,5] | [6] |
| 5 | [7,4] | [5] | [6] |
| 6~7 | [7,4,5] | [6] | [] |
| 8 | [7,4,5,6] | [] | [] |

따라서, 모든 트럭이 다리를 지나려면 최소 8초가 걸립니다.

solution 함수의 매개변수로 다리에 올라갈 수 있는 트럭 수 bridge_length, 다리가 견딜 수 있는 무게 weight, 트럭 별 무게 truck_weights가 주어집니다. 이때 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 return 하도록 solution 함수를 완성하세요.

### 제한 조건

- bridge_length는 1 이상 10,000 이하입니다.
- weight는 1 이상 10,000 이하입니다.
- truck_weights의 길이는 1 이상 10,000 이하입니다.
- 모든 트럭의 무게는 1 이상 weight 이하입니다.

### 입출력 예 설명

| bridge_length | weight | truck_weights | return |
| --- | --- | --- | --- |
| 2 | 10 | [7,4,5,6] | 8 |
| 100 | 100 | [10] | 101 |
| 100 | 100 | [10,10,10,10,10,10,10,10,10,10] | 110 |

# [풀이]

input: 트럭 weight, length, weight

- 다리길이 = 트럭이 다리를 건너는데 걸리는 시간 ?
- 문제 유형: 큐 (FIFO); 트럭 무게 순으로 처음부터 차례로 나가야하기 때문

- 무엇을 추가? truck_weights

- 언제 pop? bridge에 올라온 truck의 무게와 다음 트럭의 무게의 합이 기준 weight보다 작을 때 pop!

- flow:
1. input: 트럭 weight 리스트, 다리에 올라갈 수 있는 트럭 수, 다리가 견딜 수 있는 무게
2. bridge = [] : 조건을 만족한 truck의 무게를 저장하는 곳
3. while 문을 돌려서 truck_weights[i]들을 계속 입장 → if문을 통해 확인
    1. 최대로 올릴 수 있는 트럭의 개수(bridge_length) : bridge 리스트의 length를 bridge_length만큼 만들어서 특정 길이 이상으로 append하지 못하도록 !
    2. 어느 정도 무게까지 견딜 수 있는지 : 다리 위 트럭(bridge) + truck_weights[i]이 최대무게보다 작거나 같은지
4. 조건 만족 시 → bridge.append(truck_weights.pop(0)) 
5. 조건 불만족 시 → 0을 append
6. answer에는 트럭이 다리를 지날때마다 +1 

```python
def solution(bridge_length, weight, truck_weights):
    
    answer = 0
    bridge = [0]*bridge_length
    
    while bridge:
        
        answer += 1
        bridge.pop(0)
        
        if truck_weights:
            if sum(bridge) + truck_weights[0] <= weight:            
                bridge.append(truck_weights.pop(0))
            else:
                bridge.append(0)
                 
         
    return answer
```

### 다른 사람 풀이

```python
from collections import deque

def solution(bridge_length, weight, truck_weights):
    bridge = deque(0 for _ in range(bridge_length))
    total_weight = 0
    step = 0
    truck_weights.reverse()

    while truck_weights:
        total_weight -= bridge.popleft()
        if total_weight + truck_weights[-1] > weight:
            bridge.append(0)
        else:
            truck = truck_weights.pop()
            bridge.append(truck)
            total_weight += truck
        step += 1

    step += bridge_length

    return step
```

- deque 사용!
- reverse() method를 사용한게 인상적임!
