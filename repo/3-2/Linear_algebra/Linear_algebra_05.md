#  Linear Algebra week3

The equation Ax=bAx=b has a solution if and only if bb is a linear combination of the columns of AA

Section 1.3 considered the existence 어쩌구 저쩌구



#### Theorem 4

Let **A** be an **m×n** matrix. Then the following statements are logically equivalent. That is, for a particular **A**, either they are all true statements or they are all false.

4개의 명제가 있는데, 하나가 성립하면 나머지도 다 성립한다.

1. For each b in R^m, the equation Ax has a solution
2. R^m에 속하는 b는 linear combination으로 만들어질 수 있다.

3. A의 column을 가지고 Linear combination해서 다 만들어낼 수 있다. (Span)
4. A의 모든 row에 pivot position이 있다. 

Theorem 4 is about a coefficient matrix, not an augmented matrix.

True or False로 나왔을 때 같은 의미인지 아닌지 알 수 있을 정도로 하는게 좋다. 



column vector를 linear combination으로 할 때는 matrix 전체에 집중하는거고 row vector rule은 스칼라 하나하나에 집중하는 기존에 우리가 계산해왔던 방식



#### Identity Matrix

- Square matrix: Row 와 Column의 수가 같은 Matrix

- Diagonal Matrix: Diagonal(대각) element가 아닌 부분들이 싹 다 0인 Matrix

Square matrix이고, Diagonal Matrix인데 Diagonal element가 1인 경우 Identity Matrix라고 한다.
$$
I\vec{x} = \vec{x}
$$


Column들로 이루어지는 Matrix, 그리고 \vec{x}와 내적하여 하나의 Equation으로 이루어지는 과정이 위에서 설명된거래
$$
A\vec{x} = \vec{b}로 하던걸\\
\vec{y} = A\vec{x}
$$
로 해서 Ax에 좀더 집중하겠다라는 의미라고 합니다.

COlumn vector들의 Linear combination



#### Theorem 5

1. Additivity를 만족한다. (나눔법칙?)

2. Homogeniety를 만족한다. (교환법칙)

이 두개를 만족하면 보통 Linear어쩌구 저쩌구



**Matrix와의 곱은 Linear transform이다. Matrix와의 곱으로 표현할 수 없는 Linear transform은 존재하지 않는다.** 





## 1.5 Solution Sets of Linear Systems

$$
A\vec{x} = \vec{b}
$$

Solution set을 가지고있다는건 식를 만족시키는 집합을 가지고 있다는건데, 원래는 하나의 scalar들에 집중했다면, 이제는 하나의 vector로 인식하고 geometric하게 생각할 수 있도록 Vector notation이란걸 사용한다.



#### Homogeneous Linear Systems

- Right side가 전부 0인 경우를 의미 (A\vec{x} = \vec{0})
  - Homogeneous하다.

Ax = 0이라고 했을 때 항상 존재하는 Solution이 있다. x가 0(Zero vector)면 Left side도 0이 나와서 Solution중 하나가 된다. 이건 사실 문제풀이에 큰 도움이 안된다. 이런 솔루션을 Trivial solution이라고 한다. 다만 무조건  Consistence 하다는 의미를 가진다. 결국 Nontrivial solution(=Free variable이 있다.)이 있는지 없는지가 중요한 질문이 된다. 만약 zero vector말고 다른 해가 있다면, 무한히 많은 해가 존재한다는건데, 이말은 선, 평면 등을 이루고있다는 뜻이 된다.

---

#### Non Homogeneous Linear System

- Right side가 0이 아닌 경우를 의미

만약 얘도 Consistence하고 여러 솔루션을 가진다고 하면, Parametric vector form으로 나온다. 근데 분석해보면 이중에 일부는 Homogeneous solution이 같이 있다는 걸 의미한다. 결국 S_H  = c_1\vec{v1} + c_2\vec{v2}....이거에 어떤 벡터하나를 탁 더해주면 S = S_H + v?가 되서 결국 non homogeneous Linear system에서의 전체 해가 된다. (공업수학에서 배웠다.) Example3 체크하자.



v라는 녀석이 이제 homogeneous로 했을때 나온 해인것이고, p가 뒤에 더해지는 벡터가 되고, 두개가 더해져서 translation된다.

---

