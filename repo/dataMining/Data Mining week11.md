## Overall Framwork of CHAMELEON	

knn으로 분할, closed하고 connectivity를 분석해서 다시 병합한다

Connectivity (상호연결성)

- 분할된 클러스터가 합쳐진다고 가정할때, 얼마나 유사하게 묶일 수가 있느냐

Closeness (인접성)

- 두개의 클래스가 얼마나 가까이 있으냐

이 두개를 기준으로 클러스팅하는 방식이 바로 카멜레온 알고리즘





## Probabilistic Hierarchical Clustering

- 눈으로 쉽게 이해가 가능하다는 건 장점
- 속성값이 Missing된 경우에 이런것들을 처리하기는 굉장히 힘듬
  - 전처리 과정에서 결손값을 채우면 되지만, 이 과정으로 인해 정확성에 문제가 발생할 수도 있음
- Heurisitc
  - 클러스터링의 목적은 가장 잘 된 클러스트를 만드는거
  - 이 알고리즘 같은 경우는 전문가의 의견이 반영되기는 어려움
    - k-mean에서는 k라는 값을 전문가의 의견을 반영할 수 있었는데, 이 방식은 k를 정하지 않고 하다보니까, 전문가의 경험적인 요소를 반영할 수가 없음



**위의 문제때문에 확률모델을 사용하자!!**

-> Probabilistic Hierarchical clustering

분산에 관련한 알고리즘들이 활용될거임





## Generative Model

- Gaussian Distribution모델로 클러스터가 만들어지도록 하자?
- 확률 모델링을 하고, 그 값이 likelihood라는 값이고, 그 값이 최대로 만들면 됨
  - 평균과 분산을 찾아내고 최대가 되도록 만드는게 목표?





## A Probabilstic Hierarchical Clustering Algorithm

두개의 클러스터를 merge해서 하나의 큰 클러스터를 만들고 싶다!

다양한 방법들이 있는데, 이 방법들을 다 계산해서 그 값이 가우시안 분포에 가장 가까운 값을 갖는 (전체 평균과 분산이 원하는 값 안에 들어가는) 쌍을 찾아서 묶는 것



그런데! 이 원하는 쌍을 찾기 위해서는 모든 경우를 다 계산해야하기 때문에 계산량이 매우 많아진다는 단점이 있음.

그럼에도 불구하고 이런 방식을 쓰는 이유는 결과가 가장 이상적으로 나오기 때문!





## Density-Based Clustering Methods

- 도너츠 형태, S자 형태의 데이터 형태일 경우에는 기존의 Distance 기반 기술을 가지고는 좋은 결과를 내기가 어렵다. 

  -> 다른 형태의 값을 이용해볼까?

밀도기반으로 클러스터링을 수행하자! 

- 한번만 스캔하면 됨
- 밀도 파라미터의 값이 필요함
- Discover clusters of arbitary shape
- Handle noise



### Basic Concepts

- Eps: Maximum radius of the neighborhood
- Minpts: 입실론 범위안에 있어야하는 최소 객체 수
- Directly density-reachable??



- Density-reachable
  - 입실론안에 Minpts를 만족한다면 그게 Density-reachable point가 되는거임
- Density-connected
  - Density-reachable point의 입실론 반경안에 있는 또다른 포인트가, 자신을 중심으로하는 Density-reachable point가 된다면? 그 두개의 point는 Denity-connected하다!



## DBSCAN

1. 모든 데이터에 Unvisited의 label를 붙이고, 그 중 하나를 랜덤하게 선택을 함
2. Density reachable, density connected 관계를 확인한다.
3. 이 조건을 만족하지 못한다면, 클러스터를 통합하는 단계에 포함하지 않도록 만든다.



### 알고리즘 정리

1. 임의의 데이터 선택 -> label를 visited로 변경
2. Density reachable인지 모든 point를 retrieve
   - 만약 p가 그렇다면 cluster form으로 만든다
   - 아니라면 (Border point라면) 다른 point를 visit함
3. 모든 point에 대해서 계속 처리



Minpts를 어떻게 하냐에 따라서 결과가 바뀔 수 밖에 없겠다!



## OPTICS

point와 입실론의 수를 지정해놓지않고, 직접 찾게 만드는 방법은 없을까헤서 나온게 OPTICS 알고리즘 (minpts는 필요함)

- Ordering point 정보를 가지고 Clustering을 함

- 핵심거리? (Core Distance)

  - 앞에서는 입실론 범위안에 minpts만큼의 수를 포함하고 있어야 density reachable point가 되는거였음
  - 이건 이 minpts를 만족하기 위한 최소 입실론이 core-distance

- 접근 거리 (Reachability Distance)

  - Core distance보다 안에 있는 얘들과의 거리는 입실론이라고 하고(실제로는 더 짧겠지만) 그 밖에 있는 얘들의 길이는 실제거리를 사용한다.

    

오브젝트의 클러스터 순서가 뭐야

- 모든 객체로 부터 Core distance를 계산하고, Reachability Distance를 계산해서 가지고 저장해서 값이 큰 애들부터 꺼내서 사용하는거
- 결론은 거리가 짧은 애들끼리 뭉치게 됨



결국 공간정보를 이용하게 됨 (x,y,z)

공간정보를 이용하면 계산이 더 쉬워지긴하는데





## DENCLUE: Using Statistical Density Functions

가우시안 분포 이용함



---





## Assessing Clustering Tendency

클러스터링의 경향성 (Tendency)

- 쏠려있는지, 잘 분포되어있는지 판단하는거 
  - 가우시안 분포 만들어놓고 그 안에 들어오느냐를 파악하면 됨
- Hopkins Statistic

- 샘플링된 데이터를 가지고 해서 통계적으로 분포를 파악하고, 경향성을 판단함



클러스터의 수를 어떻게 결정하느냐 (K-mean같이 k를 지정해줘야하는 경우)

- 굉장히 어려운 문제
- 대부분의 경우는 실험에 의해 무한 반복해서 가장 좋은 성능을 낸 클러스터의 수를 사용
- Empirical method: #of clusters
- Elbow method: 클러스터의 수가 너무 많지 않도록해야하고 클러스터 수를 결정하는데 있어 Variance를 사용한다?

- Cross validation method



클러스터링 결과의 품질 (잘되었나 안되었나)

- 2가지 방법 extrinsic, intrinsic
- Extrinsic
  - Supuervised (실제 수치값을 가지고 있는 경우! 실제의 클러스터가 이렇게 되어야한다는걸 알고 있는 경우 -> Ground Truth)
  - Precision과 Recall을 사용
  - 동질성, 완결성(얼마나 잘 구분되느냐), 미분류된건 얼마나 있느냐, 클러스터를 작게 유지할 수 있느냐
- Intrinsic
  - Unsupervised (정답을 모르고 있는 경우)
  - Silhouette coefficient
  - 클러스터들이 구분이 되었으면 클러스터 안의 유사도의 평균값과 다른거의 평균값을 비교해서 계산하는거









## Summary



클러스터 분석을 위한 방법들에 대한 설명



객체들을 유사성을 기준으로해서 유사성이 큰 경우 하나의 클러스터로 묶는것

다른 클러스터들과는 비유사성이 높도록 만드는거

데이터의 속성값을 기준으로 구분이 된다

여러 메소드들이 있다

거리기반 방법이 있는데 그 단점을 보안하기 위해서 Density base를 썻다

- 기존 클러스터링 기법에서 구의 범위에만 국한된 한계를 해결했다는 점에서 사용됨





확률모델이 나오는 이유

- 단순하게는 Parameter를 지정하고 싶지않아서



제일 많이 쓰이는 방식은 Grid와 Density 방식을 합쳐서 쓰는 방식이 많이 쓰임





