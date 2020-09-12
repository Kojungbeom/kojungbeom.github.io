# Linear Algebra 04

연립방정식을 푸는걸 목표로 삼는게 아니라, Vector와 matrix가 Linear equation에서 표현이 되고, 해를 가진다는 조건을 어떻게 만들어낼 수 있는가에 대해서 주목하며 이 단원을 공부해야한다.

> Vector will mean a ordered list of numbers

그리고 우리가 주로 쓸 것은 Column vector니까 이제부터 vector == Column vector라고 생각하면 된다. Bold체 소문자면 벡터다.



#### Vectors in R^2

- equal, Sum, Scalar multiple에 대한 이야기가 나온다.
  - Two vectors in R2R2 are **equal** if and only if their corresponding entires are equal.
  - Given two vectors uu and vv in R2R2, their **sum** is the vector u+vu+v obtained by adding corresponding entrires uu and vv.
  - Given a vector uu and a real number cc, the **scalar multiple** of uu by cc is the vector cucu obtained by multiplying each entry in uu by c

어떤 조건을 만족하는 전체집합을 Vector space고, 그 중 element 하나를 vector라고 한다. 위의 연산 방법도 굉장히 간단하기 때문에 코딩하기도 쉽다.



#### Geometric Descriptions of R Squared

vector space 자체가 어떤 공간이니까 기하학적으로 모델링할 수는 있지만, 3차원초과해서 넘어가게 되면 머리속에 그려지지가 않는다. 하지만 개념은 그대로 확장될 수 있다.

geometric point *(a, b)* with the column vector [ab][ab].

그럼 이대로 본다면, R^2는 하나의 무한히 넓은 Plane이라고 할 수 있고, 여기에 점을 하나 딱 찍으면 그게 Vector라고 할 수 있다.



#### Parallelogram Rule for Addition

Parallelogram - 평행사변형

중고딩 교육과정에서 배운거니까 잘 기억해보도록.

Vector의 성분: 방향, 크기

두개가 같으면 같은 Vector다.



#### Vectors in R cubed and R to the Power *n*

3차원으로 확장시켜보자. 

If nn is a positive integer, RnRn (read "r-n") denotes **the collection of all lists (or ordered nn-tuples) of nn real numbers**, usually written as n×1n×1 column matrices, such as
$$
u=⎡⎣⎢⎢⎢⎢u1u2⋮un⎤⎦⎥⎥⎥⎥
$$
확장하는 이유? 여기서 n은 일반화된 term이기 때문에, 수학적으로 이 term으로 만들어내면 다른것에도 확장을 시킬 수가 있기 때문에 그렇다.



#### Algebraic Properties of R to the Power n

교환, 결합, 분배법칙

zero vector - all elements are 0

8개의 대수적 법칙을 확인하자.



#### Linear Combinations

x와 b를 v와 y로 교환하면 여기서 c를 weight라고 볼 수 있겠다.

https://dsaint31x.github.io/ds_gitbook/posts/LinearAlgebra/la_01_03.html

latex 만들면서 정리하는게 낫겠다..



#### Span

is the collection of all vectors that can be written in the form

Span {v1.., vp} 그리고 이 친구는 R^n의 subset이 되는것이고, Linear combination으로 생성가능한 모든 벡터가 포함된다.

span(u,v)에서 서로서로를 선형조합으로 만들수 없어야지만 평면이 만들어진다.

If uu and vv are nonzero vector in R3R3, with vv not a multiple of uu, then Span {u,v}{u,v} is the plane in R3R3 that contains uu, vv, and 00. In particular, Span {u,v}{u,v} contains the line in R3R3 through uu and 00 and the line through vv and 00.



입력베ㅐㄱ터가 들어갔을때 , ㄴ가 만든 모델이 matrix로 되어있고, 