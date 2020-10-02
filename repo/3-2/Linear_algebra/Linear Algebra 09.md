# Linear Algebra 09

#### Powers of a Matrix (제곱)

Matrix를 기본적으로 자기자신을 곱하려면 n*n matrix(square matrix)이여야 한다. 다음과 같이 표기한다.
$$
A^k = A...A
$$

- A가 nonzero고 x가 real number중 하나면, A^kx는 
- If k=0이면 A^kx = x 그 자체다. (A^0 = I)
- A0은 



#### Transpose

Denoted by A^T whose columns are formed from the corresponding rows of A

- 입출력을 묘사하는 경우가 많아진다.
- 영상처리같은곳에서는 뭐 관계들이 transpose형태를 띄고있고 뭐 그렇다네

The transpose of a product of matrices equals the product of their transposes in the reverse order.

Additivity를 성립하는 Transpose! (2번)

Homogeneous도 성립하는 Transpose (3번, Scalar에 대해서만)

4가지 규칙을 기억하자

- $$
  1.(A^T)^T = A \\
  2. (A+B)^T = A^T + B^T \\
  3. For\ an\ scalar\ r, (rA)^T = rA^T \\
  4. (AB)^T = B^TA^T
  $$

AB != BA라는거 조심하자. Matrix는 곱의 순서가 굉장히 중요하기 때문이다. Matrix로 표현된 Linear system은 순서가 굉장히 중요하다는걸 명심해야한다. 



## Inverse Matrix

하기전에 제일먼저 기억해야하는건 I_n이다. (identity matrix, digonal element가 다 1이고 나머지가 0인 square matrix) 

matrix A가 있을때, A의 inverse를 가질때 invertible한거고, 이 두개를 곱하면 I가 된다. (좀 다른정의임)

Inverse는 항상 square matrix로 존재한다.

만약 onto관계일때 얘를 inverse할때 어디로 가야할지 모르니까 inverse를 가질수가 없는것이다. 이말은 즉, reverse가 불가능하다는것이고 이런 정보를 담고있기 때문에 invertible 하다는 정보는 중요하다는 것이다. 



#### Theorem 4

Invertible한지 어떻게 판단하나 보자
$$
A^{-1} = {1 \over {ad-bc}}어쩌구 저쩌구
$$
2 by 2에서 ad-bc !=0 이면 A는 invertible하다. 반대로 ad-bc면 inverse가 없다. 이때 ad-bc를 determinant라고 한다.   



#### Theorem 5

A가 invertible하고 (deterniant A !=0) n*n matrix일 때, R^n의 각각의 b vector이 있을 때, Ax = b라는 Linear system은 unique한 solution을 가진다. 



#### Theorem 6

1.  **If A is an invertible matrix(-> n*n square matrix), A^{-1}도 invertible하다.** 그래서 A inverse의 inverse는 자기 자신이다. 
2. If A and B가 shape이 같고 invertible할 때, AB에 대한 inverse는 transpose와 유사하게 순서가 바뀌면서 inverse로 바뀐다.
3. A가 invertible할 때, A^T도 invertible하고 A^T의 inverse는 A^-1의 transpose한 것이다. 

The product of n×nn×n invertible matrices is invertible, and the inverse is **the product of their inverses in the reverse order**.

주의 한방향으로 했을떄 identityㄱ ㅏ나오는건 invertible이 아니다.



## Elementary Matrices

하나의 identity를 가지고 Single elementary row operation을 수행해서 구해진 matrix가 elementary matrix라고한다고?

- interchange
- replacement
- scaling



row operation같은데 matrix operation으로 변환이 되고, matrix operation은 어떻게보면 Linear transform이고, 결국 row operation은 linear transform으로 할 수 있다?



- Addition of -4 time row 1 of AA to row 3 produces E1AE1A : **Relplacement**.

- An **interchange** of rows 1 and 2 of AA produces E2AE2A, and

- multiplication of row 3 of AA by 5 produces E3AE3A : **Scaling**.

- Left-multiplication (that is, multiplication on the left) by E1E1

   

  in Example 1 has

   

  the same effect on any 3×n3×n matrix

  .

  > 매우 중요함. Elementary Matrix를 우리가 배우는 이유 중 하나임.

- Since

   

  

  E1I=E1E1I=E1

  , we see that

   

  

  E1E1

   

  itself is prodcued by this same row operation on the identity.

  > 매우 쉽게 Elementary Matrix를 구할 수 있음. row operation을 product of matrix로 구현할 수 있음

Example 5 illustrates the following general fact about elementary matrices.

- If an elementary row operation is performed on an m×nm×n matrix AA, the **resulting matrix can be written as EAEA**
  where the m×mm×m matrix EE is created by performing **the same row operation on ImIm**.
- ==**Each elementary matrix EE is invertible**. The inverse of EE is **the elementary matrix** of the same type that transforms EE back into II.==



#### Theorem 7

A가 square matrix고 invertible하면 (if and only -> 두개가 똑같다는?) A가 I_n과 row equivalent 하다면 A를 I_n으로 바꿀수 있는 시퀀스가 있다. 



#### Algorithm for finding A^-1

1. [A I]형태로 Augmented matrix를 만들어라. (옛날에는 coefficient matrix랑 b랑 합쳐진거였지 [A b vecotr])

2. A가 I랑 row equivalent하다면 [A I]는 [I A^-1]랑 row equivalent하다.
   - I에 row equivalent 시키는 과정을 똑같이 가해주면 I가 A^-1이 된다.
3. Otherwise, A does not have an inverse.

진행하기 전에 주의해야할건 invertible해야 이게 가능하니까 determinant 먼저 계산해보는걸 추천한다. 