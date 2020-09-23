# Linear Algebra 07

선형독립성을 가지고 있느냐는 굉장히 중요한 요소이다. 



- non trivial을 가지면 Linearly dependent
- trivial만 가지면 Linearly independent

하지만 Free variable이 존재한다는건 Linearly dependent하다.

component가 3개가 있는 벡터가 있는데, 이거보다 해가? 많다면 linearly dependent?



#### Theorem 9

Zero vector가 존재하면 얘는 Non trivial solution을 만들 수 있고, Linearly dependent하다.



머신러닝에서 봤을 때 이러한 Linear dependent는 결국 같은 결과는 내는것들이 겹치게 적용되는 일이 벌어질 수 있기 때문에 Linearly Independent 관계를 가지고 있는 Feature를 모은다. (Feature들이 Unique한 특성을 반영하도록 만든다.) 이런 관계를 파악하는게 중요하기 때문에 Free variable, trivial solution, non-trivial solution과 같은 정보는 매우 소중하다.



## 1.8 Introduction to Linear Transformations

중요한 개념: Transformation(or Function or Mapping과 동의어)

n차원 실수로 이루어진 벡터공간에서 m차원으로 mapping을 떠주는 규칙을 Transformation이라고 한다. 이게 Linear한 성질을 가지게되면 Linear transformation이라고 한다. (머신러닝에서도 아주 중요한 개념)

- Domain(정의역), Codomain(공역)
- 거울을 본다고했을때 3차원 공간이 거울이라는 2차원공간에 매핑된건데 이때 거울에 있는걸 상(Image)라고 한다. (여기서는 한점을 말하는것 같네)

- T(x)의 집합을 T의 Range(치역)이라고 한다. 

위에 Domain, Codomain, Range, image는 반드시 이해하고 손으로 그릴 수 있어야 한다.



#### Matrix Transformations

- Matrix가 Transformation되면 Matrix Transformation이고, 얘는 선형적인 특성을 가지고 있다.
- Observe that the domain of is when has columns and the codomain of is when each column of has entries.
- 벡터와 matrix의 곱을 전개해보면 Linear combination 형식이고, 결국 b(Codomain)을 구할 수 있게된다.
- Span{a}는 실제적으로 Range of T가 된다.

ex) 2차원의 A라는 matrix를 3차원에 mapping한다.

- A = 3*2의 matrix
- x = 2*1의 vector
- b = 3*1의 vector가 된다.

확인해보면 B는 A의 Linear combination형태로 만들어져있다.



#### Shear Transformation

상(Image)를 기울이는 것이다. Line segment를 각각 mapping을 뜬 것이다. 

- onto란? 뭐 투영이런거인거같은데



#### Definition: A transformation (or Mapping) T is linear if

- Additivity: 둘을 더해서 Transformation하든, 둘다 Transformation하고 더하든 같은 결과가 나와야한다.
- Homogeneneity: scalar multiple을 먼저하고 tranformation하든, Transformation하고 scalar multiple을 하든 같은 결과가 나와야한다.

위의 두가지 속성을 만족하면 Linear Transformation이다. 그리고 이 두가지를 만족한다면 Matrix Transformation으로 표현이 가능하다.

- T(0) = 0
  - zero vector는 Transformation해도 무조건 0이다. 원점자리를 지킨다.
- Engineering에서 5번식을 Superposition principle이 쓰인다. 이것도 Linear tranformation

<br>

#### Contraction and Dilation (팽창과 수축)





## 1.9 The Matrix of a Linear Transformation

![image-20200921115753726](/home/ines/.config/Typora/typora-user-images/image-20200921115753726.png)

A라는 column vector가 모인 Matrix가 있dmfEo , 여기서 j번째 identity matrix의 j번쨰 column을 e_j라고하면 T(e_j)라고?

 

이 부분 proof하는건 다시 봐야 위에말이 이해가 가겠다.