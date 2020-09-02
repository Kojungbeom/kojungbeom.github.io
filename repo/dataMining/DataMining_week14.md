# 데이터 마이닝 Week14





위에 못들음





## Distance-Based Outlier Detection

중첩방법론을 이용해서 가까운 다른 오브젝트까지의 거리를 계산한다. 몇개가 있는지를 따져서 normal인지 outlier인지 판단한다.

거리를 이용하니까 당연하게 O(n^2)에 육박하는 시간복잡도를 보여준다.



### A Grid-Based Method

어디까지 도달하는데 몇단계를 거쳐하는지를 계산해서 level로 표현하는거

이게 정해진 범위안에 들어오는지 안들어오는지를 기준으로 판단한다.



## Density-Based Outlier Detection

밀도를 이용하는 방법, 얼마나 응집성을 가지고 있느냐가 기준이 된다.





## Local Outlier Factor: LOF

지역인접성 Outlier를 이용한다. 지역성을 판단한다. 가장 먼 거리에 있는 얘들 중에서 일정범위안에 들어오느냐 안들어오느냐



## Clustering-Based Outlier Detection

- Case1. 클러스터가 만들어졌을 때, 어떤 클래스에 포함되지 못하는 얘들을 outlier로 판단
- Case2. 가장 가까운 클러스터와 얼마의 거리를 가지고 있느냐, 거리가 크면 outlier로 판단
- Case3. 들어온 객체를 각각의 클러스터에 대한 LOF를 계산하여 우리가 정의한 p?가 더 작다면 outlier



## Clustering-Based Method: Strength and Weakness

- strength





- Weakness
  - outlier detection에 최적화할수 없다.
  - 미리 정의된 distance 임계값을 만드는거 자체가 어렵다
  - 기존 존재하는 클러스터가 있었을때 이걸가지고 확장해 나가는게 불확실하다.





## Classification-Based Method 1: One-Class model





## Classification-Based Method 2: Semi-Supervised Learning

일부의 데이터는 레이블을 가지고 있고 일부의 데이터는 레이블을 가지고있지 않을때 쓰는 방법인데, 





맥락아웃라이어?

- 기온이 28도라고 예를들면, 남극에선 비정상, 현재 한국의 여름에는 정상
  - 이런게 바로 contextual outlier 맥락 아웃라이어



- Contextual attributes
  - age, postal code
- Behavioral attributes
  - amount, total trans







# FUZZY는 뭐더라





# DBSCAN

밀도기반 clustering 알고리즘



각각의 속성에 대해서 전체 데이터들이 어떻게 구분이 되고있는지





## Comparing different clustering algorithm on toy datasets

실습파일중에 있음