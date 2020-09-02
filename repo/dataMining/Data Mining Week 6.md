# Data Mining Week 6



## 데이터 큐브 기술

- Data Cube Computation: Preliminary Concepts
  - 계산하는법
- Data Cube Computation Methods
  - 계산하기 위한 방법들
- Processing Advanced Queries by Exploring Data Cube
  Technology
  - 계산된 질의방식을 어떻게 처리하는지
- Multidimensional Data Analysis in Cube Space
  - Cube space에서 다차원 데이터를 어떻게 처리하는지
- Summary

**데이터 큐브 기술은 Data warehouse의 핵심이다**



## Data Cube: A Lattice of Cuboids

![image-20200508090437403](/home/ines/.config/Typora/typora-user-images/image-20200508090437403.png)

N차원 cuboid

2차원 Cuboid:1차원 cuboid를 두개로 묶어서 표현하는 경우 2차원 cuboid

Base Cuboid: 차원의 수와, 그 차원을 다 포함해서 표현하는 경우를 Base cuboid

하나하나 Cell이라고도 표현한다.

Groupby를 이용해서 하나씩 뽑아낼 수 있을 것이다.

 aggregate cell(집계 셀): apex와 base 사이의 모든 cell들은 aggregate cell이라고 한다.

 cell의 수는 2^n개



각 집계 대상 차원은 *로 셀을 표기한다. == 'all'

n차원 큐브가 있다고 가정했을때,  a= (a...a_n)에서 aggregate를 하는 경우(m<=n)가 아닐경우 m차원의 셀로서 m차원 큐보이드에서 발생한다.

차원으로 month, city, customer_group, sales를 갖는 데이터 큐브가 있을 때,

sales은 dimension이 아니라 fact



- 집계 셀
- 베이스 셀
- 에이팩스 셀



time과 time이 포함된 모든 차원의 셀은 부모자식, 조상과 자손의 관계 (Ancestor vs descendant)



## Cube Materialization: Full Cube vs. Iceberg Cube
모든 데이터를 이용하는것이 좋겠지만, 데이터가 너무 방대해진다면 데이터를 관리하는건 쉬운일이 아닐 것이다.

그렇다면 전체 데이터중에서 일부의 데이터만 활용해서 좋은 성능으로...

- Full cube: 모든 데이터 다 사용
- Iceberg cube: 일부분만 사용

하드웨어의 용량과 성능의 관점에서 성능과 시간을 위해서는 일부만 이용할 수도있다. 조건을 부여해서 빙산의 일각만을 뽑아내는 방법! 가치가 떨어지는 데이터는 무시하고 좋은 데이터만 사용해서 처리하자라는 방법 -> Iceberg condition, 조건이 너무 작다면 Full cube와 다를바 없을것이고, 너무 크면 너무 적은 데이터만 사용해야할 수도 있다.



### Iceberg Cube, Closed Cube & Cube Shell

Iceberg cube단점

- 기저셀이 여러개가 되거나, 차원의 수가 많다면 쓸만한 데이터를 뽑아낸다는것 자체가 쉽지 않을 수 있음.

Closed cube

- 자손 cell이 없는 경우, Tree 구조의 leaf와 같은 거 closed cell로만 이루어진 cube를 closed cube라고 한다.

Cube Shell (참고로만 알아두길)

- 앞에 것을 미리 계산을 해놓고 나중에 써먹을 수가 있다?
- 데이터가 변경될 경우?



## Roadmap for Efficient Computation

어떻게 효율적으로 계산을 할 것이냐?

- Heuristics 계산
- Full/iceberg cubed의 세가지 방법
  - Bottom-up: 아래서 위로 다차원 배열 집계
  - Top-down: 위에서 아래로
  - star-cube: 섞은거

- High-dimensional OLAP



### General Heuristics (경험적인?)

사용자가 해봣을때 이런방식으로 하는게 더 낫더라하는 것들을 이용하는 방법이다.

전문가들이 사용하는 경우가 많다.

차원의 속성들을 조합하여 사용하는?

- Tuple을 묶어서 정렬해서 사용할 수 있다?
  - Smallest-child: 이전에 계산된 cuboid로부터 작은 애들만 활용하는 방식
  - Cache-results: Cache를 이용해서 빈번한 계산을 할때 속도를 더 빠르게 할 수있다.
    - 캐쉬라는건 빈번히 사용하는 데이터를 메모리에 저장해놓고 반복해서 사용할 수 있도록 만들어논거
  - Amortize-scans: 분할해서 사용하자? (분산처리처럼 다른 머신들에 존재하는게 아님)
  - Share-sorts: 공유의 개념, 레벨별 차원, cell에 의해 공유될 수있는 기법들을 사용?
    - Hash-based algorithm
  - Share-partition:??





## Data Cube Computation Methods

- Multi-Way Array Aggregation (다차원집계)
- BUC (Bottom-up computation)
- Star-Cubing (Star tree를 이용)
- High-Dimensional OLAP



### Multi-Way Array Aggregation (다차원집계)

배열기반으로 사용된다. **연산속도를 빠르게하고 사용하는 메모리의 양을 줄이는게 핵심**

- 배열의 개념을 활용하되, Chunk라는 조각개념을 만들어내서 어떻게 빠르게 연산하고 반복되지 않게 연산하느냐가 핵심
- Iceberg처럼 일부만 사용하는게 아니라 전체를 사용할거다.

![image-20200508093616812](/home/ines/.config/Typora/typora-user-images/image-20200508093616812.png)

- Array를 chunk단위(sub-cube)로 쪼갠다.(Partitioning) 전체 큐브를 메모리에 한번에 올리는게 어렵기 때문이다.
- 쪼갠 큐브를 압축한다.
  - 배열의 주소를 저장하지 않고 유추할 수 있도록 만들어서 처리
  - ex) 3차원배열에서 중간의 agg 배열값을 하나 찾아온다고하면, **인덱싱정보를 이용하면 접근할 수 있다.** 배열의 정보를 활용하자는게 핵심이래
  - 어떻게 각각의 sub-cube를 방문하면서 효과적으로 처리할것인가

![image-20200508093957546](/home/ines/.config/Typora/typora-user-images/image-20200508093957546.png)

넓이가 차이나는 이유는? 카데널러티에 따라서 다르다

하나의 차원이 가질수있는 데이터의 종류 (Tuple의 수)가 카데널러티

3차원이었던 cube를 2차원의 plane으로 각각 만들어버린다.

sub cube를 어떻게 효과적으로 잘 저장할것이냐?

작은 카데널러티를 가진것부터 계산하는게 효과적인 방법중 하나이다.

1,2,3,4 chunk를 방문할때, ab-plane뿐만아니라 c0인 애들도 한번에 연산을 같이 할 수있다.

-> 메모리 사용량도 줄어들면서 반복도 적게필요할것



정리하면

- 평면은 오름차순으로 정렬되어있고, 카디널리티가 작은애들에서 큰애들 순서로 계산
  - Cache에 있는 데이터를 재활용?
  - 메모리 사용량 감소
- 이런건 차원이 작을때나 가능하다.
  - 차원이 커지면 커질수록 연산하는 기법도 고민이 필요하고 어려워지고, 연산량이 또다시 늘어날 수 밖에 없음
  - Top-down방식할 때 불편해짐



### Bottom-Up Computation (BUC)

아래서 위로 올라가는 방식이라고 써져있지만, Top-down방식하고 굉장히 유사하다.

- Apex에서부터 시작한다. 근데 이거 발표하신분은 apex를 맨 아래로두고 하셔서 그럼
- 앞에서 처럼 dividing하는 방식을 사용한다.
- 가지치기 개념을 도입해서 계산안할거는 아예 계산안해버린다?
- 깊이우선의 탐색을 한다

![image-20200508095330600](/home/ines/.config/Typora/typora-user-images/image-20200508095330600.png)



### Star-Cubing: An Integrating Method

커피사러갔다가 못들음



### Iceberg Pruning in Shared Dimensions

- Anti-monotonic
  - 집계값이 iceberg condition을 만족하면 더이상 확장하지 않는다.
- Intuition
  - Apriori: prun하는거 처럼 이전차원에서 정보를 이미 다 가지고있어서 다음차원에서 활용할 필요가 없다라고 판단이 되면 지워버리는거?
- 문제는 다차원의 데이터를 어떻게 prun할 것이냐가 문제



### Cell Trees

- H-tree랑 비슷함
- Traverse 방식은 tree랑 똑같음





### Star Attributes and Star Nodes

하나로 연결되는 놈은 그냥 하나로 처리?



### Example: Star Reduction

최소값을 2로하는 가정을 해보면,

![image-20200508101348022](/home/ines/.config/Typora/typora-user-images/image-20200508101348022.png)

![image-20200508101355007](/home/ines/.config/Typora/typora-user-images/image-20200508101355007.png)

이런식으로 바뀌지.,.

아래쪽을보면 똑같은게 2개있지, 위에도 그렇고

![image-20200508101431504](/home/ines/.config/Typora/typora-user-images/image-20200508101431504.png)

그래서 이렇게 바꿀 수 있다.

-> 처리해야하는 기본 데이터 수를 줄일 수 있따.



### Star Tree

- The star tree is a lossless compression of the original cell tree

- 다른 특성을 구분하는데 도움이 안된다면 *로 일반화한다.
- 



---





## The Curse of Dimensionality

차원이 커지면 커질수록 기하급수적으로 계산량이 늘어난다.

![image-20200508102304556](/home/ines/.config/Typora/typora-user-images/image-20200508102304556.png)

- Quotient는 9차원까지밖에 안됨





## Motivation of High-D OLAP

고차원의 OLAP을 처리하려면 어떻게 해야하는가?

- 차원에 의한 계산수 폭발을 iceberg같은걸로 delay할 수는 있지만 멈추지는 못한다.
- 고차원의 OLAP을 처리하려면 ??





### Fast High-D OLAP with Minimal Cubing

작은 Cube형태로 쪼개서 고차원데이터를 처리하자!

1. shell fragment를 만든다.
2. inverted indice라는 변형된 index를 만들어서 사용한다
3. 사전계산된 fragment cube를 이용한다.



### Properties of Proposed Method

- 수직적으로 파티셔닝한다 (축을 변환하겠다.)
- 고차원을 저차원으로 축소시킨다.
- 실시간으로 재구성한다.
- Lossless reduction
- 사전에 처리해야하는 양과 실시간 계산속도의 tradeoff



![image-20200508102935689](/home/ines/.config/Typora/typora-user-images/image-20200508102935689.png)

얘를

![image-20200508102945905](/home/ines/.config/Typora/typora-user-images/image-20200508102945905.png)

이렇게 변형해서 사용하겠다. 어떻게?



### Shell Fragment Cubes: Ideas

- 두개가 동시에 존재하는 경우를 계산 count
  -  

![image-20200508103034929](/home/ines/.config/Typora/typora-user-images/image-20200508103034929.png)

### Shell Fragment Cubes: Size and Design

결국 데이터 개수를 줄일수 있다?

관련지식을 가지고있어야 어떻게 할 수있을것이다.



### ID_Measure Table

앞에서는 count 많이 썻는데 사실 다른걸로 해도 상관없음



## The Frag-Shells Algorithm

1. 차원의 집합들을 K개의 fragment로 쪼갠다.
2. 각각에 대해서 ID-Measure table로 만든다.
3. Inverted indice를 만든다.
4. fragment에 대해서 cube로 만들어내면된다.

---

## Processing Advanced Queries by Exploring Data Cube Technology
- Sampling Cube
- Ranking Cube
- -





###  Statistical Surveys and OLAP

- 조사라는건 일부의 sample을 가지고 예측을 하는거 (다 조사할 수 없기때문에??)
- 정보를 모아서 새로운 것들을 만들어내는거
- 통계툴에서 중요한것은 가설이 잘맞는지와, 신뢰구간
- 이런걸 다차원데이터 분석에서도 활용할 수 있을까?



### Example

전체데이터가 있어도 연산속도같은거에 대해서 비효율적이다.



Sampling하게되면 small data가 남을거고, 얘네를 이용하면 된다.

- 데이터가 아예없어지는 결과가 일어나면 안됨
  - 줄이다보니까 아예 0으로 만들어버리는경우
- 차원의 저주는 피해야함
  - 현실세계에서는 600차원이상의 것이 생길수 밖에없다.





## Confidence Interval

신뢰구간은 어떻게 계산하느냐? (간략하게)

몰라 신뢰구간은 높으면 좋고, 낮으면 안좋은거니까 높게 나올 수 있도록 만들어야한다는거야

efficient computing은 넘어가자



### Example 2: Query Expansion

sample사이즈가 너무 작으면? -> 신뢰도가 떨어진다 -> Confidence interval이 '크다'

- 오차를 만들어낼수밖에 없다. -> 데이터를 활용할 수 없다.

전수조사한 데이터를 다시사용하자!

- 이건 좀 어려워 현실세계에서는

다른 차원의 정보를 사용할 수 있지 않을까?

- 근데 아무거나 가져다쓰면 안돼

차원을 다른쪽으로 확장하자

### Intra-Cuboid Expansion: Choice 1

어쩌구 저쩌구 2가지 방식

![image-20200508105447990](/home/ines/.config/Typora/typora-user-images/image-20200508105447990.png)

### 

- Combine other cells’ data into own to “boost” confidence
  - Semantic이 유사한 경우
  - 더 큰 sample size를 가지고 있는 경우 cofidence interval을 줄일 수 있겠지

- Cell segment similarity
- Cell value similarity
  - 어느것은 숫자로 되어있고 어느건 숫자로 되어있으면 유사성이 떨어지는거지
  - 스케일이 달라도 그렇지



### Inter-Cuboid Expansion

큐브값이 관련이 없는경우, small sample이 밑으로 확장하는 경우에 사이즈가 작아서 문제가 되는 경우에 Inter-cuboid expansion을 사용하는게 좋다.

차원을 없애버리고 *로 검색하는 방법을 쓸 수도 있음

데이터를 늘리기 위해 확장을 한다?



두가지의 차이점 핵심









## Ranking Cubes - Efficient Computation of
Ranking queries

Orderby가 핵심

어떻게 순위를 매길것인가?를 생각해야한다?





1. 전체 데이터에 대해서 파티셔닝을 한다.
2. Slicing한다.
3. 또 Slicing한다.
4.  





### Materialize Ranking-Cube

