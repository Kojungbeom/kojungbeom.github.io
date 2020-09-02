## EM Algorithm

임의의 중심점에서 가까운 애들끼리 묶는다

->  expectation step

- 가장 가까운곳에 속하게 만드는거



클러스터내 각각의 객체로부터 최단점을 찾는다 (새로운 중심점)

->새로운 클러스터들이 만들어짐

- 새로운 중심점을 만드는게 Maximization step

반복

-> Expectation step과 Maximization을 반복



두개가 합쳐져서 EM 알고리즘



Maximum likelihood

- 유사성이 최대가 되도록한다



처음에는 임의의 점에서 시작하겠지만, 두개의 스텝을 반복해서, 일정범위에 수렴하는 경우에 반복을 종료한다.



expectation step은 kmean하고 비슷해보이네~



### Fuzzy Clustering using the EM Algorithm

한 객체를 기준으로 거리를 재서 비율로 표현하고 소속도를 만든다

어느 클러스터에 더 속하는지를 계산한다.

(k-mean)과 다른점은 소속도 측정이 필요하다는거

여기까지가 expectation step



새로 생성된 클러스터에 SSE(Sum of squared error)

소속도^2 * x좌표 / (소속도^2)

해서 현재 소속된 클러스터의 중심값을 계산한다.



### Univeriate Gaussian Mixture Model

확률밀도모델을 사용해서 두개를 만드는거고, 걔네도 마찬가지로 평균과 표준편차계산해서 EM algorithm을 사용하면 최적화할 수 있다.



### Advantages and Disadvantages of Mixture models

장점

- Mixture model을 처리할 수 있다.
- 파라미터들을 이용해서 클러스터를 표현할 수 있다.

단점

- EM의 공통적인 문제점은 글로벌 미니멈에 도달해야하는데, 로컬 미니멈에 빠질 수도 있다는 것
  - 극복하려면 초기값 설정을 여러번해주거나 하는 방법이 있음

- 확률분포가 너무 많으면 계산량이 너무 많음
- 데이터가 너무 작으면 확률분포 계산이 제대로 안됨
- 딥러닝하고 공통적으로 발생하는 부분이네..
- 클러스터의 수를 추정하는게 쉽지않음
  - 애매한 클러스터링이 될 수도 있음



그럼에도 불구하고! Mixture model은 많은 분야에서 사용되고 있음 (특히 EM algorithm과 같이)





# Clustering High-Dimensional Data

속성이 많은 데이터를 처리할 경우, 문제점들이 많다

이걸 해결할 수 있는 방안 두가지

- Subspace-clustering: 큰 규모의 속성들을 작은 규모로 쪼개서 사용하는 방식
- Dimensionality reduction approaches: 유의미한 차원만 사용해서 차원 축소를 시키는 방식



고차원데이터의 문제점

- 잡음에 민감하다



## Traditional Distance Measures May not be effective on high-D data

원래하던 방식대로 거리개념을 이용해보면.. 계산할게 겁나많다









---

##  PCA



## Subspace Clustering Method: Bi-clustering methods

gene각각이 서로다른 속성들을 가지고있다.

object는 여러 cluster에 속할 수 있다.

속성들도 여러 클러스터에 속할 수 있따.?





기존에 분류하는 방식은 속성들만 가지고 분류했음

하지만 빅데이터에 와서는 속성들도 여러 클러스터에 속할 수 있어서, 결국 객체도 여러 클러스터에 속할 수 있다는 것

- Fuzzy clustering하고 비슷해보이는군요

속성만 이용하는게 아니라 객체에 대한것도 신경써야해서 복잡해질 수 밖에 없다.



## Type of Bi-clusters

- Bi-clusters with constant values
  - 상수값을 이용해서, 이 상수값을 가지고있다면 그 값을 상수값으로 대체하는거?
- Bi-clusters with constant values on columns
  - Row를 상수값으로 대체하는 방식
- Bi-clusters with coherent values
  - 동일한 패턴에 의해서 값들을 변형시키는 방식? (Pattern base clustering)
- Bi-clusters with coherent evolutions on rows
  - 등비행 bi cluster라고 부름, 3번째것과 비슷한 맥락임





## Bi-Clustering Methods

- optimization-based method
  - 최적화 기법을 사용함
  - 서브행렬을 만들고, 서브행렬에서 의미있는 정보를 만들어내서 비용을 계산하고 그리드서치를 이용해서 최적의 어떤걸 찾아내는거
    - 매번 계산을 다시하고 그 계산값이 최적이 되도록 탐색하는 방식
  - 
- Enumeration methods
  - 허용할 수 있는 범위 안에서만 ~~하는?
  - 

## Bi-Clustering for Micro-Array Data Analysis

shift와 scaling을 이용해서 객체들을 구분해내는 방식!

최적값을 찾을때까지 반복!

(local minimum에 빠질수도 있다는거)



## \delta Bi-Ciuster

조건에 만족못하는 속성값은 제거하는 방식

조건에 만족하는 애들만 남으면 남아있는 데이터를 기준으로 확장한다.

삭제 - 추가 를 반복한다.



### \dalta pCluster

메이플 기법이라고도 불림



---

==Greedy algorithm은 heuristic을 사용해서 local minimum에 안빠지도록==







## Dimensionality-Reduction methods

차원을 줄여 오히려 더 명확하게 구분되도록하는 방법??

mapping -> 차원에 변화를 주는거

Projection을 해서 차원을 줄인다!



- 중요한 속성만 이용하고 나머지는 버리는 방식이 있고
  - 핵심은 어떤게 중요하고 어떤걸 버릴것인가?
  - 명확하게 통계적으로 구분할 수는 없고, 실험해서 정확도가 얼마나 높아지는지를 가지고 해야됨
- 변환을 이용하는 방식이 있고 (Spectral)





## Spectral Clustering: The NG 어쩌구

차원을 축소해서 변환좌표로 만들어내는거?

데이터를 매트릭스로 변환하고, eigen벡터를 구하고, 클러스터링을 한뒤, 원래대로 돌려놓는 방식







---

## Similarity Measure (1): Geodesic Distance

- 

