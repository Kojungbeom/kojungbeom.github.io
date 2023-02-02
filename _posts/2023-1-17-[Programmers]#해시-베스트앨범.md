---
title: Programmers - 베스트 앨범
author: EUNJI KWAK
date: 2023-1-17
categories: [Programmers, EUNJI_P]
tags: [Hash]
---

# [문제](https://school.programmers.co.kr/learn/courses/30/lessons/42579)

스트리밍 사이트에서 장르 별로 가장 많이 재생된 노래를 두 개씩 모아 베스트 앨범을 출시하려 합니다. 노래는 고유 번호로 구분하며, 노래를 수록하는 기준은 다음과 같습니다.

1. 속한 노래가 많이 재생된 장르를 먼저 수록합니다.
2. 장르 내에서 많이 재생된 노래를 먼저 수록합니다.
3. 장르 내에서 재생 횟수가 같은 노래 중에서는 고유 번호가 낮은 노래를 먼저 수록합니다.

노래의 장르를 나타내는 문자열 배열 genres와 노래별 재생 횟수를 나타내는 정수 배열 plays가 주어질 때, 베스트 앨범에 들어갈 노래의 고유 번호를 순서대로 return 하도록 solution 함수를 완성하세요.

### 제한사항

- genres[i]는 고유번호가 i인 노래의 장르입니다.
- plays[i]는 고유번호가 i인 노래가 재생된 횟수입니다.
- genres와 plays의 길이는 같으며, 이는 1 이상 10,000 이하입니다.
- 장르 종류는 100개 미만입니다.
- 장르에 속한 곡이 하나라면, 하나의 곡만 선택합니다.
- 모든 장르는 재생된 횟수가 다릅니다.

## [입출력 예]

| genres | plays | return |
| --- | --- | --- |
| ["classic", "pop", "classic", "classic", "pop"] | [500, 600, 150, 800, 2500] | [4, 1, 3, 0] |

### 입출력 예 설명

classic 장르는 1,450회 재생되었으며, classic 노래는 다음과 같습니다.

- 고유 번호 3: 800회 재생
- 고유 번호 0: 500회 재생
- 고유 번호 2: 150회 재생

pop 장르는 3,100회 재생되었으며, pop 노래는 다음과 같습니다.

- 고유 번호 4: 2,500회 재생
- 고유 번호 1: 600회 재생

따라서 pop 장르의 [4, 1]번 노래를 먼저, classic 장르의 [3, 0]번 노래를 그다음에 수록합니다.

- 장르 별로 가장 많이 재생된 노래를 최대 두 개까지 모아 베스트 앨범을 출시하므로 2번 노래는 수록되지 않습니다.

# [풀이]

- 목적: 장르 별로 가장 많이 재생된 노래를 ‘2개씩’ 모아 베스트 앨범을 출시 ; 베스트 노래 2개 → 앨범
- 노래 → 고유 번호
- 노래 수록 기준:
    - 속한 노래가 많이 재생된 장르
    - 장르 내에서 많이 재생된 노래
    - 재생횟수가 같은 노래 중에서 고유 번호가 낮은 노래 수록
- genres: [’classic’, ‘pop’, ‘classic’, ‘classic’, ‘pop’] → 노래의 장르, 각각의 index가 고유 번호가 됨
- plays: [500, 600, 150, 800, 2500] → 노래 별 재생횟수
- classic: 1450회, pop: 3100회
- genres[4] > genres[1] ⇒ genres.sort(reverse=True)
- genres[3] > genres[0] ⇒ [3,0]

```python
genres = ["classic", "pop", "classic", "classic", "pop"]
plays = [500, 600, 150, 800, 2500]
'''
1. 장르: 재생횟수 저장
2. 장르: [재생횟수, 고유번호] 저장 
=> 쨋든 해시에 장르에 해당하는 재생횟수와 고유번호를 모두 저장해야 함
3. 그 다음으로 장르별 sorting
4. 그 다음으로 장르 내의 노래 sorting
'''

answer = []
dict = {} #{장르: [재생횟수, 고유번호]}
playsdict = {} #{장르: 총 재생횟수}

#1. 장르: [재생횟수, 고유번호] -> 각 장르 내에서의 노래들을 정렬하기 위해
for i in range(len(genres)):
    if genres[i] in dict:
        dict[genres[i]].append([plays[i],i])
    else: 
        dict[genres[i]] = [[plays[i],i]]
print(dict)

#2. 장르: 총 재생횟수 -> 상위 장르 별로 정렬하기 위해서 
total = 0
for gen in dict.keys():
    #gen = 'classic', 'pop'
    for val in dict[gen]:
        print(val)
        total += val[0]
    playsdict[gen] = total
print(playsdict)

#3. 총 재생횟수 높은순으로 정렬 
playsdict = sorted(playsdict.items(), reverse=True)

#4. 그 재생횟수에서 상위 2개 pick
for gen in playsdict: #장르만 부르기
    #(장르, 총 재생횟수)
    sorted_plays = sorted(dict[gen[0]], reverse=True) #각 장르 내의 각각의 노래의 재생횟수를 오름차순으로 정리 
    temp = 0 #temp를 여기에 하는 이유: 다음 장르에서 다시 reset해야 다시 2개로 pick!
    for i in sorted_plays:
        answer.append(i[1])
        temp += 1
        if temp == 2:
            break
answer
```

```python
def solution(genres, plays):
    answer = []
    dict = {} #{장르: [재생횟수, 고유번호]}
    playsdict = {} #{장르: 총 재생횟수}

		#1. {장르: [재생횟수, 고유번호]} 저장
    for i in range(len(genres)):
        if genres[i] in dict:
            dict[genres[i]].append([plays[i],i])
        else: 
            dict[genres[i]] = [[plays[i],i]]

		#2. {장르: 총 재생횟수} 저장
    for gen in dict.keys():
        total = 0
        songs = dict[gen]
        for val in songs:
            total += val[0]
        playsdict[gen] = total

		#3. 총 재생횟수 토대로 장르별 SORTING: lambda를 통해 value요소의 1번과 비교 삽입
    playsdict = sorted(playsdict.items(), key=lambda x: x[1],reverse=True)

		#4. sorting된 장르 토대로 장르 내 베스트 노래 sorting
    for gen in playsdict: 
        sorted_plays = sorted(dict[gen[0]], key=lambda x:(-x[0],x[1])) 
        temp = 0 
        for i in sorted_plays:
            answer.append(i[1])
            temp += 1
            if temp == 2:
                break    
    return answer
```

### 다른 사람 풀이

```python
def solution(genres, plays):
    answer = []
    d = {e:[] for e in set(genres)}
    for e in zip(genres, plays, range(len(plays))):
        d[e[0]].append([e[1] , e[2]])
    genreSort =sorted(list(d.keys()), key= lambda x: sum( map(lambda y: y[0],d[x])), reverse = True)
    for g in genreSort:
        temp = [e[1] for e in sorted(d[g],key= lambda x: (x[0], -x[1]), reverse = True)]
        answer += temp[:min(len(temp),2)]
    return answer
```

이게 더 직관적인 풀이인듯 !

1. d = {장르: [], 장르1: []}
2. d = {장르: 재생횟수, 고유번호}
3. sorting d
4. 2개 pick
