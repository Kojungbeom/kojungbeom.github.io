---
title: [LeetCode] 36. Valid Sudoku
author: JUNGBEOM KO
date: 2023-1-25
category: Jekyll
layout: post
---

# [LeetCode] 36. Valid Sudoku

`LeetCode` 36번 문제를 풀어보았다.. [Link](https://leetcode.com/problems/valid-sudoku/description/)



# Problem

Determine if a `9 x 9` Sudoku board is valid. Only the filled cells need to be validated **according to the following rules**:

1. Each row must contain the digits `1-9` without repetition.
2. Each column must contain the digits `1-9` without repetition.
3. Each of the nine `3 x 3` sub-boxes of the grid must contain the digits `1-9` without repetition.

**Note:**

- A Sudoku board (partially filled) could be valid but is not necessarily solvable.
- Only the filled cells need to be validated according to the mentioned rules.



# Intuition

주어진 스도쿠 (2차원 배열로 표현된) 가 Valid한지 아닌지를 판별하는 문제.

같은 줄에 겹치는 숫자가 없고, 동시에 3x3 박스안에 겹치는 숫자가 없어야지 Valid하다고 할 수 있다.

숫자가 겹치는지 안겹치는지는 Dictionary나 set을 이용해서 많이 풀어본 문제로, 각 규칙을 검사하는 부분을 만들어 서로 겹치는 부분을 합쳐주면 풀 수 있는 문제였다.

하지만 9x9의 배열에서 3x3씩 나눠 체크하는 부분을 구현하는게 은근 어려웠어서 이번 기회에 잘 알아두면 좋을 것 같다.



# Approach
각 규칙을 검사할 Dictionary을 따로두어 숫자가 겹치는지 안겹치는지를 판별한다.

반복문을 사용하면서 index를 적절히 넣어주는게 중요하다.

각 Dictionary에 만약 겹치는 key값이 들어온다면 즉시 False를 return한다.

모든 규칙이 부합하는지 확인되면 (모든 반복문을 통과하면) True를 Return한다.

3x3박스를 체크하는 부분은 먼저 시작점을 인덱스 0,3,6으로 둔 뒤, 거기에 0,1,2를 더하는 방식으로 구현하였지만 NeetCode 영상에서 더 기발한 아이디어가 있었음으로 글 후반에 소개하겠다.



# Complexity
- Time complexity:

  스도쿠의 각 줄의 길이가 9이므로 $$O(9^2)$$이 된다.

- Space complexity:
  각 줄과 3x3박스를 검사하는데 Dictionary가 사용되어서 $$O(9*3) = O(9)$$가 된다. (맞나?)

  

# My Code

Approach에서 작성한대로 규칙별로 Dictionary를 따로 생성하여 Valid한지 아닌지를 검사하는 방식으로 코드를 작성하였다.

내가 생각한 3x3 박스를 체크하는 부분(규칙 3번)은 규칙 1,2번과 같은 판복문에서 돌 수 없었기 때문에 밖으로 뺄수밖에 없었다.

```python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        for i in range(len(board)):
            dic1 = {} # 규칙 1번 검사에 쓰이는 Dictionary
            dic2 = {} # 규칙 2번 검사에 쓰이는 Dictionary
            for j in range(len(board)):
                if board[i][j].isdigit():
                    if board[i][j] in dic1:
                        return False
                    else:
                        dic1[board[i][j]] = 1
                
                if board[j][i].isdigit():
                    if board[j][i] in dic2:
                        return False
                    else:
                        dic2[board[j][i]] = 1

        for i in range(0, len(board), 3):
            for j in range(0, len(board), 3):
                dic = {} # 규칙 3번 검사에 쓰이는 Dictionary
                for k in range(3):
                    for m in range(3):
                        if board[i+k][j+m].isdigit():
                            if board[i+k][j+m] in dic:
                                return False
                            else:
                                dic[board[i+k][j+m]] = 1
        return True
```

정답을 제출하고 NeetCode님의 강의를 보니 기발한 방법을 통해 하나의 반복문안에서 모든 규칙을 검사하는 방법이 있다는걸 발견했다.

그건 Dictionary가 Tuple을 Key값으로 할 수 있다는 특성을 활용하는 것이다.

규칙 3번을 위한 Dictionary는 9x9 박스를 3x3으로 나눴을 때 그때의 위치값을 Key값으로 하고있었다.

예를들어 맨 왼쪽 위 3x3에 대한 Key값은 (0,0)이 된다.

- (i // 3, j // 3)을 할 경우 0,1,2 --> 0이되고 3,4,5 --> 1이 되고 6,7,8은 2가 된다.

```python
class Solution:
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        dic3 = {}
        for i in range(len(board)):
            dic1 = {}
            dic2 = {}
            for j in range(len(board)):
                if board[i][j].isdigit():
                    if board[i][j] in dic1:
                        return False
                    else:
                        dic1[board[i][j]] = 1
                
                if board[j][i].isdigit():
                    if board[j][i] in dic2:
                        return False
                    else:
                        dic2[board[j][i]] = 1
                
                if board[i][j].isdigit():
                    if (i//3, j//3) in dic3:
                        if board[i][j] in dic3[(i//3, j//3)]:
                            return False
                        else:
                            dic3[(i//3, j//3)][board[i][j]] = 1
                    else:
                        dic3[(i//3, j//3)] = {}
                        if board[i][j] in dic3[(i//3, j//3)]:
                            return False
                        else:
                            dic3[(i//3, j//3)][board[i][j]] = 1
        return True
```

이렇게 바꾼게 사실 시간은 더 많이 걸리긴 했다. (아마 내가 내 코드에 맞게 각색해서 그런거같다..)

