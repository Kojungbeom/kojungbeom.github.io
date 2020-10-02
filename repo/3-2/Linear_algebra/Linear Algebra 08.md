# Linear Algebra 08



#### Definition: onto (전사)

어떤 vector x가 matrix와의 곱에 의해 다른 차원의 vector로 매핑이 되는 규칙,함수를 Transformation이라고 했었다. 여기서 전사란 모든 codomain이 domain과 전부 mapping이 되어었을때를 onto관계라고도 이야기한다. R-m에 속한 모든 벡터들이 domain에 있는 녀석들하고 최소한 하나이상 매핑된 상황이다. 이때 결국 range 자체가 R_m이 된다?



#### Definition: one to one

onto와는 다르게 하나이상이 아니라 각각의 domain과 codomain이 기껏해봤자 최대하나씩이랑만 매핑되있는 관계이다.



Ax = b에서

[Ab]가 argumented matrix

A = coefficient matrix

consistence -> 해가 하나이상 존재

그럼 consistent하다는 말은 onto or one to one이라는 말이다. 근데 여기서 보면 free variable이 무조건 하나 존재한다. 왜냐면 unknown이 4개인데 equation은 3개이기 때문이다. 이말은 해가 무수히 많다는 소리이고, one to one이 아니라 onto다.



#### Theorem 11

T가 one to one이다 (if and only는 필요충분조건) Ax=0가 오직 **trivial solution(x=zero vector)만 해로 가질때 (Linear independent)**

one to one이다

- Trivial solution만 가지고있다.
  - Linear independent하다.

Proof of theorem 11

하나에 매핑되는게 기껏해야 하나다. (T is linear, T(0)=0은 one to one이라는 말과 똑같다.)  one to one과 linear.. 



만약 one to one이 아니면

T(u-v) = T(u) - T(v) = b - b = 0이지만 u-v !=0이다. 각각 다른 수가 같은 수로 매핑될 수 있는거니까



one to one이 담고있는 의미는 많다. 그놈의 coefficient matrix는 homogeneous solution은 trivial solution밖에 없고, Linear ㅇ쩌구 저쩌구



#### Theorem 12

onto라는 단서는 codomain = span A와 같은걸 의미한다.

The vector u−uu−u is not zero, since u≠uu≠u. Hence the equation T(x)=0T(x)=0 has more than one solution. So, either the two conditions in the theorem are both true or they are both false.

one to one이면서 onto면 (전부 1대1 mapping)이 되어있으면 역이 성립하고, 역행렬이 존재한다는 거니까 이런 녀석들을 non singler matrix라고 하자.





## Matrix Algebra

Matrix의 더하기 뺴기 등등을 자세히 서술한 부분인것같다.

#### Matrix Operations

- matrix는 A라는 column vector가 줄줄이 소세지인 것으로 표현할 수 있다.

- a_ij는 i번쨰 행, j번째 열에 있다.

- 행과 열이 같으면 diagonal entries라고 한다. 그리고 이 대각선 부분을 Main diagonal이라고 부른다.

- n by n matrix(정사각 매트릭스, square matrix)중에서 nondiagonal entries는 전부 0일 때를 의미한다. 심지어 diagonal entries가 다 0이도 diagonal이라고 함
- The two matrices are **equal** if they have the same size (i.e., the same number of rows and the same number of columns) an if their corresponding columns are equal, which amounts to saying that their corresponding entires are equal.
  - 두개의 matrix는 같은 사이즈이고 corresponding하는 matrix의 Colunm vector도 다 같으면 두 matrix는 같다.



#### Sums and Scalar Multiples

sum: 대응하는 녀석끼리 더하면 된다. **주의해야할것은 size가 같아야한다는 것이다.**



#### Matrix Multiplication

Transformation하고 비슷하다 생각했는데 맞네 ㅎㅎ matrix끼리였을때 말고 벡터랑햇을때..

**Multiplication of matrices corresponds to composition of linear transformations.**



### Row—column rule for computing A B

If a product ABAB is defined, then the entry in row ii and column jj of ABAB is the sum of the products of corresponding entries from row ii of AA and column jj of BB. If (AB)ij(AB)ij denotes the (i,j)(i,j)-entry in ABAB, and if AA is an m×nm×n matrix, then

(AB)ij=ai1b1j+ai2b2j+⋯+ainbnj