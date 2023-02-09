---
title: Programmers - 모음사전
author: EUNJI KWAK
date: 2023-2-1
categories: [Programmers, EUNJI_P]
tags: [완전탐색]
---

# [문제](https://school.programmers.co.kr/learn/courses/30/lessons/84512)

### **문제 설명**

사전에 알파벳 모음 'A', 'E', 'I', 'O', 'U'만을 사용하여 만들 수 있는, 길이 5 이하의 모든 단어가 수록되어 있습니다. 사전에서 첫 번째 단어는 "A"이고, 그다음은 "AA"이며, 마지막 단어는 "UUUUU"입니다.

단어 하나 word가 매개변수로 주어질 때, 이 단어가 사전에서 몇 번째 단어인지 return 하도록 solution 함수를 완성해주세요.

### 제한사항

- word의 길이는 1 이상 5 이하입니다.
- word는 알파벳 대문자 'A', 'E', 'I', 'O', 'U'로만 이루어져 있습니다.

---

### 입출력 예

| word | result |
| --- | --- |
| "AAAAE" | 6 |
| "AAAE" | 10 |
| "I" | 1563 |
| "EIO" | 1189 |

### 입출력 예 설명

입출력 예 #1

사전에서 첫 번째 단어는 "A"이고, 그다음은 "AA", "AAA", "AAAA", "AAAAA", "AAAAE", ... 와 같습니다. "AAAAE"는 사전에서 6번째 단어입니다.

입출력 예 #2

"AAAE"는 "A", "AA", "AAA", "AAAA", "AAAAA", "AAAAE", "AAAAI", "AAAAO", "AAAAU"의 다음인 10번째 단어입니다.

입출력 예 #3

"I"는 1563번째 단어입니다.

입출력 예 #4

"EIO"는 1189번째 단어입니다.

# [풀이]

문제를 푸는 방법은 크게 총 3가지라고 할 수 있다!

1. 수학적 규칙 발견
2. 중복 순열(production) 사용
3. DFS: 재귀함수 사용

## 📌Product(중복 순열)

- product: 주머니 속에 공이 있다고 했을때 각각의 공을 중복에 상관없이 뽑는 모든 경우의 수를 구할 때 사용
- product을 사용하는 이유: 단어를 만들 때 모음을 여러개 중복해서 뽑아 조합하여 사전을 만들 때 사용

```python
list = ["012", "abc", "!@#"]
pd = list(product(list))
# [('0', 'a', '!'), ('0', 'a', '@'), ('0', 'b', '!'), 
#('0', 'b', '@'), ('1', 'a', '!'), ('1', 'a', '@'), 
#('1', 'b', '!'), ('1', 'b', '@')]
```

- 구현

```python
from itertools import product
answer = []
list = ['A','E','I','O','U']
for i in range(1,6):
	for w in list(product(list)):
		answer.append(''.join(w)) #공백없이 단어를 묶음 !

answer
```

- 결과

```python
["A","E","I","O","U","AA","AE","AI","AO","AU","EA","EE","EI","EO","EU","IA","IE","II","IO","IU","OA","OE","OI","OO","OU","UA","UE","UI","UO","UU","AAA","AAE","AAI","AAO","AAU","AEA","AEE","AEI","AEO","AEU","AIA","AIE","AII","AIO","AIU","AOA","AOE","AOI","AOO","AOU","AUA","AUE","AUI","AUO","AUU","EAA","EAE","EAI","EAO","EAU","EEA","EEE","EEI","EEO","EEU","EIA","EIE","EII","EIO","EIU","EOA","EOE","EOI","EOO","EOU","EUA","EUE","EUI","EUO","EUU","IAA","IAE","IAI","IAO","IAU","IEA","IEE","IEI","IEO","IEU","IIA","IIE","III","IIO","IIU","IOA","IOE","IOI","IOO","IOU","IUA","IUE","IUI","IUO","IUU","OAA","OAE","OAI","OAO","OAU","OEA","OEE","OEI","OEO","OEU","OIA","OIE","OII","OIO","OIU","OOA","OOE","OOI","OOO","OOU","OUA","OUE","OUI","OUO","OUU","UAA","UAE","UAI","UAO","UAU","UEA","UEE","UEI","UEO","UEU","UIA","UIE","UII","UIO","UIU","UOA","UOE","UOI","UOO","UOU","UUA","UUE","UUI","UUO","UUU","AAAA","AAAE","AAAI","AAAO","AAAU","AAEA","AAEE","AAEI","AAEO","AAEU","AAIA","AAIE","AAII","AAIO","AAIU","AAOA","AAOE","AAOI","AAOO","AAOU","AAUA","AAUE","AAUI","AAUO","AAUU","AEAA","AEAE","AEAI","AEAO","AEAU","AEEA","AEEE","AEEI","AEEO","AEEU","AEIA","AEIE","AEII","AEIO","AEIU","AEOA","AEOE","AEOI","AEOO","AEOU","AEUA","AEUE","AEUI","AEUO","AEUU","AIAA","AIAE","AIAI","AIAO","AIAU","AIEA","AIEE","AIEI","AIEO","AIEU","AIIA","AIIE","AIII","AIIO","AIIU","AIOA","AIOE","AIOI","AIOO","AIOU","AIUA","AIUE","AIUI","AIUO","AIUU","AOAA","AOAE","AOAI","AOAO","AOAU","AOEA","AOEE","AOEI","AOEO","AOEU","AOIA","AOIE","AOII","AOIO","AOIU","AOOA","AOOE","AOOI","AOOO","AOOU","AOUA","AOUE","AOUI","AOUO","AOUU","AUAA","AUAE","AUAI","AUAO","AUAU","AUEA","AUEE","AUEI","AUEO","AUEU","AUIA","AUIE","AUII","AUIO","AUIU","AUOA","AUOE","AUOI","AUOO","AUOU","AUUA","AUUE","AUUI","AUUO","AUUU","EAAA","EAAE","EAAI","EAAO","EAAU","EAEA","EAEE","EAEI","EAEO","EAEU","EAIA","EAIE","EAII","EAIO","EAIU","EAOA","EAOE","EAOI","EAOO","EAOU","EAUA","EAUE","EAUI","EAUO","EAUU","EEAA","EEAE","EEAI","EEAO","EEAU","EEEA","EEEE","EEEI","EEEO","EEEU","EEIA","EEIE","EEII","EEIO","EEIU","EEOA","EEOE","EEOI","EEOO","EEOU","EEUA","EEUE","EEUI","EEUO","EEUU","EIAA","EIAE","EIAI","EIAO","EIAU","EIEA","EIEE","EIEI","EIEO","EIEU","EIIA","EIIE","EIII","EIIO","EIIU","EIOA","EIOE","EIOI","EIOO","EIOU","EIUA","EIUE","EIUI","EIUO","EIUU","EOAA","EOAE","EOAI","EOAO","EOAU","EOEA","EOEE","EOEI",
```

- 최종 코드

```python
from itertools import product
def solution(word):
    answer = []
    list = ['A','E','I','O','U']
    for i in range(1,6):
        for comb in product(list,repeat=i):
            #['a', 'b', 'c'] 이런 식의 리스트를 'abc'의 문자열로
            answer.append(''.join(comb))
    answer.sort()
    return answer.index(word)+1
```

## 📌DFS(재귀함수)

```python
def solution(word):
    answer = 0
    word_list = []
    words = 'AEIOU'
    
    def dfs(cnt, w):
        if cnt == 5:
            return 
        for i in range(len(words)):
            word_list.append(w + words[i])
            dfs(cnt+1, w + words[i])
            
    dfs(0,"")
    
    return word_list.index(word)+1
```

- DFS
    - `word_list`에 A, AA, AAA, AAAA, AAAAA을 넣으면서 DFS를 돌다가
    - `cnt = 5`일 때 되돌아가면 AAAAE, AAAAI, AAAAO, AAAAU를 넣다가
    - AAAE, AAAEA, AAAEI ... 를 넣게 된다. 이런 식으로 완전 탐색 진행
- 우리가 찾는 `word`의 순서는 `word_list`에서 `word`의 인덱스 + 1

## 📌주목!

- 완전 탐색 문제는 “재귀”로 푸는 것이 가장 효율적 !
- 그리디 알고리즘과 다른 점이 모든 경우의 수를 구한 다음에 조건에 맞는 답들만 고르는 형식

++ 그리디 알고리즘 같은 경우에는 모든 경우의 수보다 그때그때 조건에 맞을 경우 바로 return
