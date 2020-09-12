# Linear Algebra week2

Reduced echelon form(하나의 matrics가 Linear system에 대해 유니크함)에서 정리를 하다보면, 처음으로 각각의 row에서 

- equivalent - 해가 같다.

augmented matrix = coefficient와 constant 가져다가 붙인거



pivot position은 위치

pivot column은 pivot이 있는 colunm을 의미한다.

어떤 matrix에서 pivot position이 어디냐?

- leading 1 in the reduced echelon form of A (pivot position의 정의)

Pivot column

- A pivot column is a column of A that contains a pivot position

#### example 2

1. 좌측상단에는 0이 있으면 안되니까 1가진거랑 바꿔줌
2. 그럼  그 1이 pivot position이 되고, 그 column은 pivot column
3. 아래쪽것들은 scalar multiple을 해서 0으로 만들어주

4. 만약 all 0가 나온다면 아닌거랑 interchange해줘야함
5. pivot이 결국 3개가 있고, pivot column또한 3개가 있다.

나중에 pivot position하고 column은 뭘 하느냐

- 변수들이 결정되는 부분에 개입함
- System of linear equation을 푸는데 있어서 핵심적인 녀석들의 위치를 나타낸다네



Matrix -> rref으로 바꾸면 뭐가 편해지나

- 쉽게 연립방정식을 풀 수 있다.
- Matrix -> rref로 가는 방법이 바로



#### Row Reduction Algorithm

총 네가지 스텝을 거치면 ef로 바꿀 수 있음, 5개를 거치면 ref로 바꿀 수 있음

row equvalent 하기 때문에 바꿔도 해는 똑같고, 역이 존재한데



>왼쪽 맨위 성분이 0이니까 다른 row하고 interchange하자

> pivot position하고 pivot column 확인하자

> 아래있는거 0으로 만들어주자

> echelon form 완성! (0은 다 아래로 내려가고, leading entry(pivot이 되는 녀석들)??) 어떤 순서로 했냐에 따라서 여러개가 만들어질거임

> pivot position에 있는것들 다 1로 만들어주기 (아래서 위로))
>
> 이때 이 reduced echelon form은 항상 unique(하나만 존재)함

forward phase (step 1~4)

- echelon form을 만드는 과정 (위에서 아래로)

backward phase (step 5)

- reduced echelon form을 만드는 과정 (아래서 위로)





## Solutions of Linear Systems

row reduction algorithm은 명시적인 솔루션의 집합을 표현한다. (해를 쉽게 구할 수 있는 equivalent한 형태로 바꿔서 표현했기 때문에)



Basic variables

- pivot columns에 있던 녀석들
- free variable에 의해 관계식형태로 나오게 됨

Free variable

- 무한대의 수를 가짐 (솔루션이 무한대)
- basic variable을 결정하게되는 요소
- The statement x_3 is free means that you are free to choose any value for x_3

- diffierent choice of x3 determines a solution of the system
  - 솔루션을 결정짓은 parameter라고 볼 수 있다.
  - parametric description??



## Parametric Descriptions of Solution Sets

The description in (5) is **parametric description** of solutions sets in which the **free variables act as parameters(매개변수)**.



#### consistent linear system

해가 있다

- 유니크한 해가 있다.
- 해가 무수히 많다.

has free variable?

-> hash many parametric descriptions





## Existence and Uniqueness Questions

해가 있냐? -> Existence

해가 유일하냐? -? Uniqueness

- 만약 0=b같은 게 있으면 해가 없는거
- every nonzero equation contains a **basic variable** with a nonzero coefficient -> 해가 있음





## Theorem 2: Existence and Uniqueness  Theorem

해가 있는지, 그리고 해가 유일한지 판단할 수 있는 Theorem에 대한 내용이 나올 것 같네

어떤 linear system이 consistent하다면 만족해야하는 조건

- augmented matrix에서 맨 오른쪽 열이 pivot column이 아니어야함
  - 0=b형태의 equation이 없다.
- 혹은 echelon form으로 바꿨을때도 마찬가지로 0=b형태가 없어야함

위 두 경우에는 솔루션이 없는 경우이니까 더이상 안풀어도 되는거지

- free variable이 없다면 해가 unique한거고
- free variable이 있으면 infinitely many solutions를 가지고 있는거고

## Using Row Reduction to Solve a Linear System

1. Write the **augmented matrix** of the system.
2. Use the **row reduction algorithm** to obtain an equivalent augmented matrix in echelon form. Decide whether the system is consistent. If there is no solution, stop; otherwise, go to the next step.
   - forward phase 진행, 근데 하다가 pivot position이 오른쪽에 나타났다? inconsistent한거라서 싱글벙글 해를 구할필요 없음, 왜냐면 없으니까 
3. Continue row reduction to obtain the **reduced echelon form**.
4. Write **the system of equations** corresponding to the matrix obtained in step 3.
5. Rewrite each nonzero equation from step 4 so that its **one basic variable is expressed in terms of any free variables** appearing in the equation.





# Vector Equations

다시 기억하자 Vector will mean an **ordered list of numbers**

vector에서 중요한건 순서(index), 순서를 가지고있는 숫자의 묶음



#### Vectors in R^2

R means a set of real numbers

Vectors in R^2 = <real number, real number>

column vector = column이 하나고, row가 여러개

row vector = row가 하나고, column이 여러개

두가지가 있는데, 우리 수업은 철저하게 column vector를 많이 쓸거임

- 순서가 틀려진다는걸 명심

x가 행, y를 열로 



백터 특성

- 두개의 vector가 R^2에 속할때, 같다고 하면 corresponding하는 위치에 있었던 entries가 같을 경우에만 같다고 한다.
- u 하고 v라는 벡터가 있을 때, u하고 v의 sum은 corresponding하는entries 끼리 더해준 것이다.
- real number c와 vector u가 잇을때 , scalar multiple은 하나의 scalar인 c를 모든 element에 다 곱해준 것이다.

연산에 대해서 닫혀있기 때문에 결과값도 real number의 집합에 포함된다.