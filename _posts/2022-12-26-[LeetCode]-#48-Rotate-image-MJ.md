---
title: LeetCode - 48. Rotate image(MJ)
author: MINJEONG KIM
date: 2022-12-26
categories: [LeetCode, MINJEONG_L]
tags: [LeetCode, MINJEONG, Four Cells]
---

# [#48. Rotate image](https://leetcode.com/problems/rotate-image/)
`LeetCode`의 `Medium`등급의 문제이다.

# 📖Description

You are given an n x n 2D matrix representing an image, rotate the image by **90** degrees (clockwise).

You have to rotate the image **[in-place](https://en.wikipedia.org/wiki/In-place_algorithm)**, which means you have to modify the input 2D matrix directly. **DO NOT** allocate another 2D matrix and do the rotation.

**[문제해석]**

주어진 nxn 행렬을 시계방향으로 90도 회전시킨 행렬을 return하시오. **(단, 새로운 행렬 사용 불가, 주어진 행렬 안에서 값 이동해야 함)**
![example1](https://user-images.githubusercontent.com/101111603/210125448-5522d2e3-3b9f-4652-bb2a-8df11233628e.jpg)
![example2](https://user-images.githubusercontent.com/101111603/210125453-42b3aa96-7070-4ae9-808e-4257927c5d80.jpg)



# 🔍Approach


- **인덱스 사용 :** 새로운 리스트를 선언할 수 없기 때문에 내부의 index를 호출해 내부적으로 input 행렬 내에서 해당 인덱스 값을 통해 값을 할당하도록 해결한다.
- **규칙 찾아보기** : 90도로 회전하는 것이기 때문에 그림을 통해서 어떻게 변화하는지 하나하나 찾아본 후 코드로 구현한다.

# 🔍Process


## Try 1.

```python
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        matrix = [[1,2,3],[4,5,6],[7,8,9]]
matrix_len = len(matrix)
 
for i in range(0,matrix_len):
    for j in range(matrix_len):
        print(matrix[j][i])
```

→ 이 방식대로 코드를 구현하려 하였으나, 너무 복잡해져갔고 더 쉬운 방식이 있는 힌트를 받았기 때문에 방향을 틀었다.

## Try 2 ****: Rotate Groups of Four Cells****

혼자서는 도저히 방법이 생각나지 않아 reference 영상을 참고해 다시 재코딩해보았다.

[**Reference video :** ](https://youtu.be/fMSJSS7eO1w)

![KakaoTalk_20221230_163141137](https://user-images.githubusercontent.com/101111603/210125457-e4371d37-2280-44b7-99f3-0ac77594455b.jpg)


example1을 통해서 nxn을 회전시키면 n-1 rotation이 발생한다는 것을 알 수 있다.

example2의 경우도 살펴보자.
![KakaoTalk_20221230_163141137_01](https://user-images.githubusercontent.com/101111603/210125464-07380213-4515-4da6-8b47-cb91d15538d5.jpg)
![KakaoTalk_20221230_163141137_02](https://user-images.githubusercontent.com/101111603/210125466-a21d298d-3f64-4d89-a32a-9959e2408847.jpg)


하지만 이렇게 하면 Temp를 3번씩이나 바꿔야 한다. 

Temp를 한번만 쓸 수 있는 방법이 있다. 바로 역방향으로 집어넣는 것이다. 이 방법을 이용하면 temp에는 한번만 저장해도 된다. (그러나, 앞서 방법과 시간복잡도와 공간복잡도는 같다.)

![KakaoTalk_20221230_163933075](https://user-images.githubusercontent.com/101111603/210125475-33aca35f-9b63-4a24-a674-a1cef8372dba.jpg)
![KakaoTalk_20221230_163933075_01](https://user-images.githubusercontent.com/101111603/210125478-da394edf-5203-452d-bb53-05fd13b68f9d.jpg)


1번방법과 2번 방법을 이용하면 둘 다 아래와 같이 시계방향으로 90도 회전된 것을 확인할 수 있다.
![KakaoTalk_20221230_163141137_05](https://user-images.githubusercontent.com/101111603/210125480-16c0771e-edb4-450e-90dd-8f4cb4df3993.jpg)

이를 통해서 코드를 구현한다.

위의 그림을 참고해서 1번째 rotate에 한해서만 코드를 짜보겠다.

- 우선 left와 right, top, bottom의 값을 지정해줘야 한다.
    - `left, right = 0, matrix의 크기 -1`
    - `top, bottom = left, right`
- left는 right보다 크기가 작을 수밖에 없다. left와 right를 이동하면서 반복하며, 더이상 이동할 수 없을 때 반복을 종료한다. → `while left < right`
- 이후, for문을 통해서 해당 범위까지 이동시킨다. left부터 right까지 살펴볼 것이기 때문에 range에는 `right-left`로 넣어준다.
    1. LeftTop에 값을 저장한다.
    2. LeftBottom → LeftTop으로 이동
    3. RightBottom → LeftBottom으로 이동
    4. RigjhtTop → RightTop으로 이동
    5. LeftTop → RightTop으로 이동
- 이후, left와 right의 범위를 줄여가야 하기 때문에, `left = left+1`, `right = right-1`을 해준다. 
(top과 bottom은 for문 안에서 left와 right의 값을 받기 때문에 따로 추가 설정해주지 않아도 된다.)


```python
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        left, right = 0, len(matrix)-1

        while left < right:
            for i in range(right-left):
                top, bottom = left, right

                # 1. save the LeftTop
                LeftTop = matrix[top][left]

                # 2. LeftBottom -> LeftTop
                matrix[top][left] = matrix[bottom][left]

                # 3. RightBottom -> LeftBottom
                matrix[bottom][left] = matrix[bottom][right]

                # 4.RightTop -> RightBottom
                matrix[bottom][right] = matrix[top][right]

                #5. LeftTop -> RightTop
                matrix[top][right] = LeftTop
```

여기까지 했다면 아래 그림처럼 첫번째 rotate를 완료한 것이다. 하지만 여기서 두번재 rotate로 가려면 `left`, `right`, `top`, `bottom`의 값을 조정해주어야 한다. for문 안에서 돌고 있으므로 `i`를 이용해 이동할 수 있다.

1. LeftTop에 값을 저장한다. 이동할 경우 `matrix[top][left+i]`을 저장
2. LeftBottom→ LeftTop으로 이동 : 이동할 경우, `matrix[top][left+i]`에  `matrix[bottom-i][left]`을 저장
3. RightBottom → LeftBottom으로 이동 : 이동할 경우, `matrix[bottom-i][left] = matrix[bottom][right-i]`을 저장
4. RigjhtTop → RightTop으로 이동 : 이동할 경우, `matrix[bottom][right-i] = matrix[top+i][right]`을 저장
5. LeftTop → RightTop으로 이동 : 이동할 경우, `matrix[top+i][right] = LeftTop`을 

![KakaoTalk_20221230_163933075](https://user-images.githubusercontent.com/101111603/210125489-48653ab0-d323-464c-a7f3-1781c59e2e60.jpg)

아래는 최종 코드이다.
```python
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        left, right = 0, len(matrix)-1

        while left < right:
            for i in range(right-left):
                top, bottom = left, right

                # 1. save the LeftTop
                LeftTop = matrix[top][left+i]

                # 2. LeftBottom -> LeftTop
                matrix[top][left+i] = matrix[bottom-i][left]

                # 3. RightBottom -> LeftBottom
                matrix[bottom-i][left] = matrix[bottom][right-i]

                # 4.RightTop -> RightBottom
                matrix[bottom][right-i] = matrix[top+i][right]

                #5. LeftTop -> RightTop
                matrix[top+i][right] = LeftTop

            left += 1
            right -= 1
```

## Others submission

**중범선배 코드**

```python
class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
	len_m = len(matrix)
	for i in range(len_m):
		for j in range(i, len_m):
			temp = matrix[i][j]
                	matrix[i][j] = matrix[j][i]
                	matrix[j][i] = temp
		
	for i in range(int(len_m/2)):
		for j in range(len_m):
		temp = matrix[j][i]
		matrix[j][i] = matrix[j][len_m-1-i]
		matrix[j][len_m-1-i] = temp
		
	print(matrix)
	return matrix
```

```python
class Solution:

   def rotate(self, matrix: List[List[int]]) -> None:
       N = len(matrix)
       if N == 1: return

       # 행을 중심으로 뒤집기
       l, r = 0, N-1
       while l < r:
           matrix[l], matrix[r] = matrix[r], matrix[l]
           l += 1
           r -= 1

       # 대각선을 중심으로 뒤집기
       for i in range(N):
           for j in range(i):
               matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
```

```python
class Solution(object):
    def rotate(self, matrix):
        for i in range(0,len(matrix)  ):
            for j in range(0,len(matrix[0])):
                if i==j:
                    break
                if i!=j:
                    t=matrix[i][j]
                    matrix[i][j]=matrix[j][i]
                    matrix[j][i]=t
        for i in matrix:
            i.reverse()
        return matrix
```

# 💡Remembrance


- 문제를 풀 때는 전혀 코드 이해도 되지 않고 어려웠는데, 복습하면서 완벽히 이해해서 뿌듯함
- 이런 문제의 경우는 직접 그림을 그려가며 규칙을 발견하고 그대로 구현하는 방법이 가장 적합하다는 생각이 든다. 앞으로 이런 식으로 **행렬로 주어진 문제**는 **그 안의 규칙을 찾아보고 그림을 그린 후 코드로 옮기는 방식**으로 해야겠다.
