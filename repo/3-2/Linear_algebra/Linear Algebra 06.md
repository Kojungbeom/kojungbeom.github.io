# Linear Algebra 06

1. Argumented matrix 만들고 RREF로 구해내기
2. pivot element를 가지고 free variable이 있는지 없는지 확인하고 free variable

3. equation의 형태를 vector의 모양으로 바꿔서 vector equation 형태로 만들어라
4. Linear combination vector로 땅땅땅땅

결국 free variable이 일종의 parameter가 되는 것이다.

1. Row reduce the augmented matrix to **reduced echelon form, RREF**.
2. Express each basic variable in terms of any free variables appearing in an equation.
3. Write a typical solution xx as a vector whose entries depend on the free variables, if any.
4. Decompose xx into a **linear combination of vectors (with numeric entries)** using the free variables as parameters.





## 1.6 Applications of Linear Systems

공급되는 Free variable 하나가 결정이 나면 다른것에서 균형을 이룰수 있도록 하기위해 Linear algebra를 이용했다고 한다. (석탄, 전기, 어쩌구)

이거 숙제임





## 1.7 Linear Independence

Linear combination으로 만들어낼 수 없다면 서로 Linear independence이다. 독립관계가 아닐 경우에 보면 어떤 벡터들이 이루는 플레인안에 포함되버리는 벡터가 있을수도 있다는 말인데 이 경우에 그 벡터는 필요가 없다는 말이 될수도 있다.

span{v1} v1의 Linear combination으로 만들어낼수있는 모든 벡터의 집합

Trivial solution은 0을 항상 해로 가지고 있는거

오직 Trivial solution만 가지고 있으면 선형독립이라고 한다.

span{v1,v2}에서 둘이 Linear dependence라면 span{v1,v2} = span{v1} = span{v2}이기 때문에 가능한 적은 수의 vector로 같은 값을 만들어낸다면 좋은것이다.

rank에 따라서 span{}가 선,면,volume이 될수가 있다(line, matrix, tensor)

rank는 선형독립 벡터의 개수?



#### Linear Independence of Matrix Columns

Column vector들을 horizontal하게 쌓아논걸 Matrix라고 하는데, 

Suppose that we begin with a matrix A=[a1⋯an]A=[a1⋯an] instead of a set of vectors.

The matrix equation Ax=0Ax=0 can be written as x1a1+x2a2+⋯+xnan=0x1a1+x2a2+⋯+xnan=0

Each linear dependence relation among the columns of AA corresponds to a nontrivial solution of Ax=0Ax=0

> **The columns of matrix AA are linearly independent if and only if the equation Ax=0Ax=0 has only the trivial solution.**







#### Theorem 7

Theorem 7 does **not say that every vector in a linearly dependent set is a linear combination of the preceding vectors**.



어떤 vector집합에 zero vector가 들어가면 그 집합은 항상 Linear independent가 된다.