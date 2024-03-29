---
title: 프로그래머스 - 피로도 (MJ)
author: MINJEONG KIM
date: 2023-01-27
categories: [Programmers, MINJEONG_P]
tags: [Programmers, MINJEONG, 순열, 완전탐색, DFS]
---

# **[프로그래머스 - 고득점kit - 완전탐색 - 피로도](https://school.programmers.co.kr/learn/courses/30/lessons/87946)**

# 📖Problems

XX게임에는 피로도 시스템(0 이상의 정수로 표현합니다)이 있으며, 일정 피로도를 사용해서 던전을 탐험할 수 있습니다. 이때, 각 던전마다 탐험을 시작하기 위해 필요한 "최소 필요 피로도"와 던전 탐험을 마쳤을 때 소모되는 "소모 피로도"가 있습니다. "최소 필요 피로도"는 해당 던전을 탐험하기 위해 가지고 있어야 하는 최소한의 피로도를 나타내며, "소모 피로도"는 던전을 탐험한 후 소모되는 피로도를 나타냅니다. 예를 들어 "최소 필요 피로도"가 80, "소모 피로도"가 20인 던전을 탐험하기 위해서는 유저의 현재 남은 피로도는 80 이상 이어야 하며, 던전을 탐험한 후에는 피로도 20이 소모됩니다.

이 게임에는 하루에 한 번씩 탐험할 수 있는 던전이 여러개 있는데, 한 유저가 오늘 이 던전들을 최대한 많이 탐험하려 합니다. 유저의 현재 피로도 k와 각 던전별 "최소 필요 피로도", "소모 피로도"가 담긴 2차원 배열 dungeons 가 매개변수로 주어질 때, 유저가 탐험할수 있는 최대 던전 수를 return 하도록 solution 함수를 완성해주세요.

**입출력 예**

| k | dungeons | result |
| --- | --- | --- |
| 80 | [[80,20],[50,40],[30,10]] | 3 |

**입출력 예 설명**

현재 피로도는 80입니다.

만약, 첫 번째 → 두 번째 → 세 번째 던전 순서로 탐험한다면

- 현재 피로도는 80이며, 첫 번째 던전을 돌기위해 필요한 "최소 필요 피로도" 또한 80이므로, 첫 번째 던전을 탐험할 수 있습니다. 첫 번째 던전의 "소모 피로도"는 20이므로, 던전을 탐험한 후 남은 피로도는 60입니다.
- 남은 피로도는 60이며, 두 번째 던전을 돌기위해 필요한 "최소 필요 피로도"는 50이므로, 두 번째 던전을 탐험할 수 있습니다. 두 번째 던전의 "소모 피로도"는 40이므로, 던전을 탐험한 후 남은 피로도는 20입니다.
- 남은 피로도는 20이며, 세 번째 던전을 돌기위해 필요한 "최소 필요 피로도"는 30입니다. 따라서 세 번째 던전은 탐험할 수 없습니다.

만약, 첫 번째 → 세 번째 → 두 번째 던전 순서로 탐험한다면

- 현재 피로도는 80이며, 첫 번째 던전을 돌기위해 필요한 "최소 필요 피로도" 또한 80이므로, 첫 번째 던전을 탐험할 수 있습니다. 첫 번째 던전의 "소모 피로도"는 20이므로, 던전을 탐험한 후 남은 피로도는 60입니다.
- 남은 피로도는 60이며, 세 번째 던전을 돌기위해 필요한 "최소 필요 피로도"는 30이므로, 세 번째 던전을 탐험할 수 있습니다. 세 번째 던전의 "소모 피로도"는 10이므로, 던전을 탐험한 후 남은 피로도는 50입니다.
- 남은 피로도는 50이며, 두 번째 던전을 돌기위해 필요한 "최소 필요 피로도"는 50이므로, 두 번째 던전을 탐험할 수 있습니다. 두 번째 던전의 "소모 피로도"는 40이므로, 던전을 탐험한 후 남은 피로도는 10입니다.

# 🔍Concepts

## 완전탐색

문제에서 주어질 수 있는 **모든 경우의 수**를 탐색하는 알고리즘

- '**무식하게 푼다(brute-force)'**는 컴퓨터의 빠른 계산 능력을 이용해 가능한 경우의 수를 일일이 나열하면서 답을 찾는 방법을 의미. 이렇게 가능한 방법을 전부 만들어 보는 알고리즘을 뜻한다.
- 완전 탐색은 컴퓨터의 빠른 계산 속도를 잘 이용하는 방법이다.

## 완전 탐색 기법

- **단순 Brute-Force** : 단순히 for문과 if문 등으로 모든 case들을 만들어 답을 구하는 방법
- **비트마스크(Bitmask)** : 2진수를 이용하는 컴퓨터의 연산을 이용하는 방식이다.완전 탐색에서 비트마스크는 문제에서 나올 수 있는 모든 경우의 수가 *각각의 원소가 포함되거나, 포함되지 않는 두 가지 선택으로 구성*되는 경우에 유용하게 사용이 가능하다.
- **재귀 함수**
- **순열 (Permutation)** : 완전 탐색의 대표적인 유형이다. 순열에 원소를 하나씩 채워가는 방식
- **BFS / DFS** : 완전 탐색 + BFS/DFS 문제가 많이 나온다. 대표적인 유형으로 길 찾기 문제가 있다.

# 🔍Institution

- **`k` : 유저의 현재 피로도**
- **`dungeons` : 2차원 배열로, 최소 필요 피로도와 소모 피로도를 인자로 가짐**
- **`최소 필요 피로도` : 탐험하기 위해 가지고 있어야 하는 최소한의 피로도**
- **`소모 피로도` : 던전 탐험 후 소모되는 피로도**
- **`return` : 유저가 탐험할 수 있는 최대 던전 수**

이 문제는 완전탐색인 것은 확실하다.

하지만 어떤 방식으로 푸는 것이 좋을까? 바로 순열과 DFS이다. 

순열을 사용하는 방식은 아래와 같다.

```python
from itertools import permutations
arr = ['A', 'B', 'C']
nPr = permutations(arr, 2)
print(list(nPr))

# 결과 : [('A', 'B'), ('A', 'C'), ('B', 'A'), ('B', 'C'), ('C', 'A'), ('C', 'B')]
```

- 참고
    - 순열: 서로 다른 n개의 원소 중에 r개를 순서에 ‘상관있게’ 선택하여 나열하는 것
    - 조합 : 서로 다른 n개의 원소 중 r개를 순서와 ‘상관없이’선택하여 나열하는 것
        - 조합 사용 방식
        
        ```python
        from itertools import combinations
        arr = ['A', 'B', 'C']
        nCr = combinations(arr, 2)
        print(list(nCr))
        
        # 결과 : [('A', 'B'), ('A', 'C'), ('B', 'C')]
        ```
        
- 문제에 순열 적용할 경우 아래와 같은 경우의 수가  발생한다.

```python
from itertools import permutations

dungeon = [[80, 20], [50,40], [30,10]]

for d in permutations(dungeon, len(dungeon)):
    print(d)
```

```python
# 결과
([80, 20], [50, 40], [30, 10])
([80, 20], [30, 10], [50, 40])
([50, 40], [80, 20], [30, 10])
([50, 40], [30, 10], [80, 20])
([30, 10], [80, 20], [50, 40])
([30, 10], [50, 40], [80, 20])
```

# 🔍Approach

## 🚩1. **Permutations**

**Flow**

1. `dungeon`을 입력받는다.
2. python의 itertools의 `permutations`를 이용하여 for문을 돌린다. 
    1. `for d in permutations(dungeons, len(dungeons)):` 
    2. ([80, 20], [50, 40], [30, 10])
    ([80, 20], [30, 10], [50, 40])
    ([50, 40], [80, 20], [30, 10])
    ([50, 40], [30, 10], [80, 20])
    ([30, 10], [80, 20], [50, 40])
    ([30, 10], [50, 40], [80, 20])
3. for문을 매번 돌면서 `k`를 비교해야 하기 때문에 비교하기 위한 `k`를 `temp`에 저장한다. 또 던전 수를 구해 return해야 하므로 던전 수를 의미하는 `turn` 은 0으로 초기화한다.
4. permutation한 인덱스에 대해 다시 for문으로 돌린다. 
    
    d=0일때, ([80, 20], [50, 40], [30, 10]) 
    
    `d[0] = need` (최소 필요 피로도), `d[1] = use` (소모 피로도)
    
5. `temp`가 `need`보다 클 때, 던전을 탐험한 것이므로, 소모 피로도를 빼주고, `turn` 개수를 1 더한다. (`temp -= use, turn += 1`)
6. 해당 for문이 끝나면, `answer`에 `answer`와 turn중 큰 값을 저장한다.
7. 이를 2번 permutation을 통해 만든 순열 개수만큼 반복한다

```python
from itertools import permutations

def solution(k, dungeons):
    answer = -1
    
    for d in permutations(dungeons, len(dungeons)):
        temp = k
        turn = 0
        
        for need, use in d:
            if temp >= need:
                temp -= use
                turn += 1
            else:
                break
        answer = max(answer, turn)
    
    return answer
```

- 보거나 이해하기 쉬운 답
- 하지만 time complexity : $O(n^2)$
    
    ![%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-01-26_16-07-20 1](https://user-images.githubusercontent.com/101111603/215277613-a1e5f3c6-a05a-4bb3-8e91-f05cbc6ef506.png)


## 🚩2. Others submission : DFS

이후 다른 방법으로 푼 풀이는 없을까, 하고 찾아보니 DFS로 푼 방식들이 있었다.

### **DFS 구현 방법**

- **스택/큐 이용**
    - list 이용
    - deque 이용
- **재귀함수 이용**
    - 넘기는 인자에 대해서 생각해보자! 어떤 것을 넘겨야 하는가?에 대한 고민이 필요하다.

문제에 적용할 때는, 

**방문을 했는지의 여부를 확인하는 리스트가 필요하다!! 방문 여부(check 리스트)**와 **방문 횟수(cnt)**를 이전 노드까지 탐색했을 때의 값으로 **복구**해줘야 한다.

참고한 사이트들은 아래와 같다.

[[DFS(완전탐색)] 피로도 (프로그래머스 강의, Level2)](https://velog.io/@soorim_yoon/DFS%EC%99%84%EC%A0%84%ED%83%90%EC%83%89-%ED%94%BC%EB%A1%9C%EB%8F%84-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-Level2)

[[프로그래머스] 피로도 - python](https://alreadyusedadress.tistory.com/294)

```python
answer = 0
N = 0
visited = []

def dfs(k, cnt, dungeons):
    global answer
    if cnt > answer:
        answer = cnt

    for j in range(N):
        if k >= dungeons[j][0] and not visited[j]:
            visited[j] = 1
            dfs(k - dungeons[j][1], cnt + 1, dungeons)
            visited[j] = 0

def solution(k, dungeons):
    global N, visited
    N = len(dungeons)
    visited = [0] * N
    dfs(k, 0, dungeons)
    return answer
```

- 두 풀이 모두 시간복잡도는 $O(n)$ 이다.
- dfs 함수 안에서 for문을 돌려야 하는 이유는 for문 없이 돌리면 한 줄기만 탐색되기 때문이다.

![%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-01-26_16-07-20](https://user-images.githubusercontent.com/101111603/215277627-266be525-b35c-4197-a52d-5a4e67bd15bc.png)

![%EC%8A%A4%ED%81%AC%EB%A6%B0%EC%83%B7_2023-01-26_20-06-23](https://user-images.githubusercontent.com/101111603/215277630-f0aa648d-8f2d-4178-b650-992302c2ca52.png)

- 좌: 순열 / 우 : 재귀
- 재귀로 푸는 것이 더 빠르다.

[다른 dfs 코드](https://lyeong-gwa.tistory.com/32)

```python
def solution(k, dungeons):
    return search(k,dungeons,0)

def search(k,list_d,count):
    #print('피로도 : {} 탐색한 던전 수: {}  남은 던전: {}'.format(k,count,list_d))
    count_list=[count]
    for i in range(len(list_d)):
        if list_d[i][0]<=k:
            tmp_list=list_d.copy()
            del tmp_list[i]
            count_list.append(search(k-list_d[i][1],tmp_list,count+1))
    #        if count==0:
    #            print('----------------------------------------------')
    return max(count_list)
```

>>실행결과

| 입력값 〉 | 80, [[80, 20], [50, 40], [30, 10]] |
| --- | --- |
| 기댓값 〉 | 3 |
| 실행 결과 〉 | 테스트를 통과하였습니다. |

```python

피로도 : 80 탐색한 던전 수: 0  남은 던전: [[80, 20], [50, 40], [30, 10]]
피로도 : 60 탐색한 던전 수: 1  남은 던전: [[50, 40], [30, 10]]
피로도 : 20 탐색한 던전 수: 2  남은 던전: [[30, 10]]
피로도 : 50 탐색한 던전 수: 2  남은 던전: [[50, 40]]
피로도 : 10 탐색한 던전 수: 3  남은 던전: []
----------------------------------------------
피로도 : 40 탐색한 던전 수: 1  남은 던전: [[80, 20], [30, 10]]
피로도 : 30 탐색한 던전 수: 2  남은 던전: [[80, 20]]
----------------------------------------------
피로도 : 70 탐색한 던전 수: 1  남은 던전: [[80, 20], [50, 40]]
피로도 : 30 탐색한 던전 수: 2  남은 던전: [[80, 20]]
----------------------------------------------
```

# 💡TIL(Today I Learn)

2가지의 풀이가 가능한 문제였다.

1. 순열
2. 백트래킹 (dfs)

- 이 문제를 통해서 순열을 어떻게 사용하는지에 대해 배우게 되었다.
    
    ```python
    from itertools import permutations
    arr = ['A', 'B', 'C']
    nPr = permutations(arr, 2)
    print(list(nPr))
    
    # 결과 : [('A', 'B'), ('A', 'C'), ('B', 'A'), ('B', 'C'), ('C', 'A'), ('C', 'B')]
    ```
    
    - permutation으로 2차원 리스트에 저장되는 것을 다시 for문으로 돌리는 것이 인상적이었다.
- dfs를 오랜만에 복습하면서 재귀함수와 마주하게 되었는데 역시나 어렵다… 이해가 되지 않아 시간을 엄청 잡아먹었다. 아직 dfs 를 풀 수준은 아니지만 여러 번 복습이 필요한 개념인 것 같다 특히 재귀함수.
