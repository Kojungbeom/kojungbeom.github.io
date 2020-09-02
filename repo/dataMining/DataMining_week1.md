# 데이터 객체와 속성 유형

데이터 세트는 데이터 객체로 구성된다.



Data object는 entity를 나타낸다.

여러 분야의 Data base에서 Object는 다음과 같다.

**판매 데이터베이스에서**

- 고객, 물건, 판매

**의료 데이터베이스에서**

- 환자, 의사, 약

**대학교 데이터베이스에서**

- 학생, 교수, 강의



Object는 여러 분야에서 다양한 의미로 해석이 되고, 다른 이름으로 불려지는데,

**Database에서 Object는 tuple 형태로 저장되며,** 

**row는 Object, column은 Attributes(속성) 에 해당된다.**



---

## Attribute의 의미 (속성의 의미)

: Attribute는 Object의 특징을 나타낸다. (Data Field)

Dimensions, features, variable등 여러이름으로 불린다.

- Data warehousing에서 **Dimension**
- Machine Learning에서 **Feature**
- 통계학자들이 **Variable**

그리고 Data mining과 Database 전문가들이 Attribute라고 부른다.

Attribute는 예를들어,

Customer라는 Object가 있다고 했을 때, 이떄의 Attribute는

- Customer ID
- Name
- Address

같이 Object의 특징을 나타내는 것이다.

추가적으로,

- 관찰(**Observations**)은 지정된 속성에 대한 관측값
- 속성 벡터(**Attribute vector**)는 지정된 객체를 설명하는 데 사용된 속성 집합
- 단일 변량(**Univariate**)은 하나의 속성과 관련된 데이터 분포
- 이변량 분포(**Bivariate**)는 두개의 속성을 포함한 것



---

### 명목 속성 (Nominal Attributes)

: 쉽게말하면 이름, 기호, or category

- 사물의 기호나 이름을 사용

- 열거형을 사용함 (enumerations.)



ex) 사람

- 머리색 : {검은색, 갈색, 노랑색, 빨강색}
- 혼인상태 : {기혼, 미혼}



---

### 이진 속성 (Binary Attributes)

: 2개의 카테고리만을 가진 명목속성 (Yes or No, 1 or 0)

- 1은 있다, 0은 없다를 뜻한다.



대칭일수도 있고 비대칭일 수도 있다.

- 대칭 : 양쪽이 같은 가중치일 때
  - Gender (Male or Female)
- 비대칭 : 양쪽이 다른 가중치일 때
  - HIV에 대한 판단 (Positive인 경우는 unique함)

*가중치가 기준*



---

### 순서 속성 (Ordinal Attributes)

- 유의미한 순서나 순위를 갖는 속성
- **연속적인 값 사이 크기는 알 수 없음**
- ex )음료수 크기
  - 소형, 중형, 대형
- ex) 군인 직급
  - 이병, 일병, 상병, 병장 ..
- ex) 고객 만족도조사
  - 1: 매우 불만족, 2 : 불만족, 3 : 보통, 4 : 만족, 5 : 매우 만족
- 값의 범위를 **유한 개수의 순서 범주로 구분**하여 해당 값을 **분할**함으로써 얻을 수 있음 (Discretization)
  - ex) 20%까지 A, 50%까지 B, 나머지 C
- 최빈수, 중위수 표현에 사용 가능



위의 세가지 종류의 특성(명목, 이진, 순서 속성)은 qualitative(질적)이다.



---

### 숫자 속성 (Numeric Attributes)

위의 명목, 이전, 순서 속성과 다르게 quantitative(정량적)이다.

- 간격 척도 속성 (Interval-Scaled Attributes)
  - **정수 또는 실수 값으로 측정 가능 한 정량적 수치**
  - 온도, 간격, 연도
  - ex) 2012년과 2020년은 8년의 차이가 있다.

  True zero가 없다 -> 상대적인 difference를 비교한다.



- 비율 척도 속성 (Ratio-Scaled Attributes)
  
  - 어떤 값을 다른 값의 곱이나 비율로 표현가능
- ex) number of words, years of experience
    - Count attribute
    
    
  
  True zero가 있다.



---

### 이산형 vs 연속형 속성 (Discrete vs Continuous Attributes)

이산형 (Discrete Attributes)

- **정수단위**로 표현이 가능함
- 음료크기 (소,중,대)

연속형 (Continuous Attributes)

- 속성값이 주로 **실수단위**를 가짐 (연속적임)
- 온도, 키, 몸무게



---

# 데이터에 대한 기술 통계

## 기술통계

: 데이터 전처리가 중요한데, 성공하려면 **데이터에 대한 이해**가 중요하다.

그래서 여기서는 기본 통계에 대해 설명한다.

3가지 영역의 기본 통계가 있다.

- **Central tendancy (중심 경향 측정)**
  - 데이터 분포의 **중간이나 중앙**의 위치를 측정
  - Mean, Median, Mode, Midrange
- **Dispersion of the data (데이터 분포 측정)**
  - 데이터가 어떻게 **퍼져있는지** 측정한다. (분포 자체에 집중)
  - Range, Quartiles, Interquartile range, Five-number summary, Boxplots, Variance, Standard deviation
- **Graphic displays (데이터 시각화)**
  - 데이터를 이해하기 쉽게 시각화하는 방법들
  - Quantile plots, Quantile-quantile plots, Histograms, Scatter plots



---

### 중심 경향 측정

ex) 근로자의 급여 속성을 X라고 할 때,

변수 X에 대한 N개의 관측값이 있다고 한다.

- #### mean (평균)

  - 항상 데이터의 중심을 의미하는건 아니다.
  - 평균을 구할 때 데이터의 수가 적고, **이상치(noise)**가 있으면 결과에 큰 영향을 준다. (이상치에 민감하다.)
    
    - 예를들어, 평균연봉을 구하는데 직원들은 적고, 
    
      임원진들의 연봉이 너무 높아서 마치 회사 평균연봉이 높아보이는 현상
  - 위에 대한 해결책이 가중치 평균 (Weighted arithmetic mean or Weighted average)
  - **Trimmed mean** (일정범위를 잘라내고 평균값에 반영하지않음)
    
    - 상하단 20% 제거는 정보손실 야기 가능, 보통 2% 제거 (극단의 값을 버린다.)
    
  - $ \sum_{i=1}^N  x_i\over N $




- #### Median (중위수)

  - **정렬된 집합의 중간값 (오름차순, 홀수면 하나, 짝수면 두 값의 평균)**
  - The middle value in a set of ordered data values
  - 데이터가 크고 그룹화되어 있다면?
    - $ median = L_1 \ + \ {(N \ / \ 2 \ - \ ( \sum freq)_l)\over freq_{median}} $
    - 정확한 수치를 뽑는다기보다는, **정확한 수치의 예측값을 뽑아낸다**
    -  freq는 중앙값보다 작은 값들의 freq의 합
    - freq median은 중앙값이 존재하는 그룹의 수
    - L1은 중위수가 속하는 그룹의 최소값
    - Width는 그룹의 크기 (80~90에서 90-80 = 10)
  
  
  
- #### Mode (최빈수)

  - **해당 집합에서 가장 빈번하게 발생하는 값.**
  - 정상적이고 정량적인 속성 계산가능 (키가 크다, 키가 180이다 의 차이)
  - **Unimodal** : 한 개의 최빈수를 갖는 데이터 집합
  - **Bimodal** : 두 개의 최빈수를 갖는 데이터 집합
  - **Trimodal** : 세 개의 최빈수를 갖는 데이터 집합
  - **Multimodal** : 두 개 이상의 최빈수를 갖는 데이터 집합
  - $ mean - mode \approx 3 \times (mean - median)  $

  중복된 값이 없으면? 활용하기 쉽지않은 데이터

  다 중복된 값이라면, 보통 그룹으로 만들어서 사용

- #### Midrange

  - $ Max() + Min() \over 2 $



Symmetric datam Positively skewed data, Negatively skewed data에서의

Mean, Median, Mode의 위치를 보면

- In Symmetric data
  - Same places
- In Positively skewed data
  - Mode - Median - mean
- In Negatively skewed data
  - Mean - Median - Mode



---

### 데이터 분포 측정

- X1, .. Xn은 X에 대한 관측값의 집합
- **오름차순**으로 정렬
- **Range**
  
  - 최대값과 최소값 간의 차이
- **Quartiles** (사분위수)
  
  - **동일한 크기**로 4개의 영역으로 나눈다.
- **Percentiles** (백분위수)
  
  - 데이터 분포를 100개의 동일한 크기의 집합으로 구분한 결과
- **Inter-quartile range** (사분위 범위)
  - Q3 - Q1 (첫번째와 세번째 분위의 거리)
  - 이런걸로 데이터 분포를 설명하기는 쉽지않음
- **Five-number summary** (5개의 숫자 요약)
  
  - Q1,Q2,Q3에 최저값, 최고값으로
- **Boxplots and Outliers** (박스플롯과 이상치)
  
  - 위의 5개의 숫자를 가지고 표현하고 그 범위를 벗어나는 녀석은 이상치 (1.5 * IQR 을 넘어가는 경우)
    - Q3보다 1.5*IQR이상으로 크거나, Q1보다 1.5*IQR 미만으로 작거나
  - 중위수(Median)는 상자내부에 선으로 표시
- **Variance and Standard Deviation** (많이쓰임) (분산과 표준편차)
  
  - **데이터가 분산된 정도를 수치로 확인할 수 있음 (퍼짐의 정도)**
  
    $$ \sigma^2 = {1\over N}\sum_{i=1}^N (x_i - \bar x)^2 = ({1\over N}\sum_{i=1}^N x_i^2) - \bar x^2$
  - **표준편차의 특성**
    
    - 평균에 대한 분산을 측정하여 **평균을 중심척도로 선택한 경우에만 고려**
    - 모든 데이터가 같으면 표준편차가 0이다.
- **Quantile plot** (분위수 플롯)
  
  - $ f_i = {i-0.5\over N} $
  - N은 quantile의 수(4개?)
- **Quantile-Quantile plot** (분위수 대조 플롯)
  
  - 분포간 치우침이 있는가를 확인 할 수 있음.
- **Histogram** (히스토그램)
  
  - 막대의 높이는 빈도(Count)를 의미함
  - Histo(막대) + gram(차트)
  - 그룹화를 한것이 앞에서 나온 개념과 다른점



기본 기술 통계값의 가시화

- 산점도를 사용 -> 분포를 2차원적으로 보여줌
  - 상관관계를 파악하기 어려운 데이터의 사례도 확인해볼것!



---

### 데이터 시각화

Data visualization aims to communicate
data clearly and effectively through graphical representation.

- 데이터를 명확하게 이해하기 위한 "도구" (숫자만 보면 이해하기 힘드니까)
- 그래픽 표현을 통해 데이터를 명확하고 효과적으로 전달하는 것을 목표로 함
- 여기저기 많이 쓰인다.
- 5가지 기술
  - 픽셀 지향 시각화 기술 (Pixel-Oriented Visualization Technique)
    - 2차원 좌표형태
  - 기하학적 투사 기술 (Geometric Projection Visualization Technique)
    - 기하학을 이용하여 다차원의 데이터를 화면상에 표현하기 위한 기술
  - 아이콘 기반 기술 (Icon-Based Visulization Technique)
    - 최근에는 잘 안쓰이는데, 간략화해서 표현하기 위한 기술
  - 계층적인 그래픽 기반 기술 (Hierarchical Visualization Technique)
  - 복잡한 데이터와 관계의 가시화 방법 (Visualizaing Complex Data and Relations)





#### 픽셀 지향 시각화 기술

- M차원의 데이터 집합에 대해서 각 차원별로 스크린 상에 M개의 윈도우를 생성하고, M차원의 레코드 값을 윈도우 상의 해당 지점에 M개의 픽셀에 매핑하여, **픽셀 색상을 통해 해당값을 반영**
  - **검은색일수록 더 큰 값, 하얀색일 수록 더 작은 값**
- M개의 윈도우를 생성하고 각각의 속성으로 윈도우를 만든다.
- 단점
  - 오른쪽 끝의 데이터와 한칸위의 왼쪽 끝의 데이터는 **사실은 굉장히 가까운 데이터인데 마치 먼 데이터인것처럼 사용됨**
  - 넓은 윈도우에는 적합하지 않음
  - 이런 문제들을 해결하기위해 공간채우기곡선 사용 (떨어져있는 아이들을 어떻게 이어서 보여줄 것인가.)
    - 나중에 자세히
  - 꼭 사각형으로 표현하는게 아니라서, 원이나 6각형도 가능

#### 기하학적 투사 기술

- 픽셀지향 가시화 기술의 단점

  -> 다차원 공간의 데이터 분포를 이해하기 어렵다. (분리해서 표현하는건 쉽지만, 묶어서 표현하기는 어렵다)

- 데이터를 분포할 때 산점도 처럼 단순히 점만 있는게 아니라, 다양한 모양으로 표현

  - 모양으로 3차원속성까지 표현하고 있는 것

- Figure 2.14

- 산점도 행렬의 단점

  - 차원이 증가하게 되면 효과가 떨어짐 -> 모양으로 구분하더라도 차원의 특성을 나타내기 힘들어진다.
  - 평행좌표도로 위의 문제 해결가능

방식이 엄청많음.. 





##  

#### 아이콘 기반 기술

- 다차원 데이터 값을 표현하기 위해 작은 아이콘 사용한다.

- 숫자가 아니라 그림으로 표현
- 여러개의 속성들을 눈,귀,입,코같은데에 반영을 시킨다.
- 규칙성과 비규칙성 가시화
- 단점
  - 표현할 수 있는게 제한적이다.



---

#### 계층적 가시화 기술

- 도입된 이유 : 데이터의 차원수가 너무 크다.
  - 차원수를 표현하기 위해서 많은 기법들이 나왔지만, 아무리 그래도 가시화하기 어려웠음

- Dimensional stacking
  - 속성안의 속성을 표현함
- Tree-map
  - 각각의 공간을 분할 (4분할을 또 4분할을 또 4분할 (정형화된 크기로가 아니라 그냥 사각형이면 됨))



## 복잡한 데이터와 관계의 가시화 방법

- 기존 가시화 기술은 숫자형 데이터에만 한정됨
- 최근에는 텍스트나 네트워크 같은 비숫자형 데이터의 가시화 연구가 많음
- Newsmap

> **시각화의 공통된 목적은 데이터를 이해하기 위함이다.**



# 데이터 유사도와 비유사도 측정

**데이터 유사도** (Data Similarity)

- 상점주인의 경우, 물건을 잘 사가는 고객 그룹과 비슷한 그룹을 찾고싶어 할 것이다.
- 군집은 같은 성격을 가지고 있다.
  - 객체의 집합
  - 이상치 분석은 군집기반기술을 사용하여 나머지 값과 상이한 객체를 잠정적 이상치로 구분한다.
- 유사도를 통해서 속하는지, 속하지 않는지를 판단



**Simuilarity**

- 두 개 이상의 객체들이 얼마나 가까운지 숫자로 표현
- 일반적으로 값은 [0,1]의 범위를 가진다. (Nomalized 된 값을 보통 가짐)

**Dissimilarity**

- Distance 개념을 많이 씀
- **얼마나 다를지를 숫자로 표현**
- 0이 최소 비유사도 값, 최대값은 없다.



## 데이터 행렬 vs 차이 행렬 (Data Matrix vs Dissimilarity Matrix)

- **Data matrix**
  - 행과 열로 이루어져 있고, 열은 각각의 속성들을 의미한다.
- **Dissimilarity matrix**
  - 근접도를 저장함 (proximity)



## 명목 속성의 비유사도 측정

- $ d(i, j) = {p - m\over p}$
  - i와 j의 비유사도(or Distance)를 계산하는 함수이다.
  - P는 Attribute의 수, m은 i와 j가 Same state인 경우의 수
  - (유사도) = 1 - (비유사도) = $ M \over p $



---

## 이진 속성의 유사도

앞에서 p는 Attribute의 수라고 이야기를 했다. 그렇다면 p는 여러개가 있을 수 있다는 것이다.

Binary Attritube는 category가 두개뿐인 속성을 말한다.

- 식 2.13

- 비대칭 이진
  - 식 2.14
  - t를 제거
  - 

D는 작을수록 유사도는 클 수록 좋음





## 수치형 데이터의 유사도 (민코브스키 거리)

- 데이터 정규화
- 유클리드 거리
  - 직선 거리나 최단거리 계싼에 사용
  - L2 norm 이 용어로 더 많이 쓰임
  - 식 2.16
- 맨하탄 거리
  - L1 distance
  - 직선상의 거리만 고려하는 유클리드 거리의 단점을 보완
  - Taxi distance라고도 부름
  - 도시의 두 지점 간 블록 거리
  - 루트를 씌우지않고 절대값을 사용
  - 식 2.17
- 위 두가지가 계산이 간단해서 많이 쓰임
- 민코브스키 거리
  - 유클리드와 멘하탄을 일반화한 방법
- 최소 상계거리
  - h가 무한대일때 민코브스키 거리를 일반화한 결과
  - L norm or 체비세프 거리라고도 부름
  - 둘중에 최고인애를 선택한거(모든 요소의 차이를 구해서 그중의 최고를 선택하는거)
  - 식 2.19
  - 추가적으로 가중치 적용하면 식 2.20처럼 됨



## 서열 속성에 대한 유사도 측정

ex) 크고 작음을 알고있지만, 그 차이를 정확하게 수치적으로 말하는게 아니라 소,중,대같이

- 서열을 가짐
- 연속 값 간의 차이는 알 수 없음
- 어떻게 분석?
  - 각각의 텍스트 분석?
- 소,중,대를 0~1.0 사이로 매핑한다
  - 소,중,대를 숫자로 매핑하는 과정에서 오류가 발생할 수도 있음



## 혼합 유형 속성에 대한 차이

: 속성이 복잡하게 섞여있는 경우

- distance를 어떻게 계산하느냐
  - 단순하게 만들어서 측정함
  - 각각의 속성별로 계산
- ppt확인;;



## 코사인 유사도

내적에서 나온 개념 -> 두 벡터간의 각도를 구할 수 있다

-> 두 벡터가 향하는 방향을 의미 -> 두 벡터가 동일한 방향을 향하고 있는지 여부를 판단

- 텍스트 분석에 가장 많이 쓰임
- Term-frequency 벡터 (?) 뭐야 이거
  - 문서가 있을때 각 문서에서 나오는 단어의 중복성 체크
  - 정보수집, 텍스트 문서비교, 군집화, 생물학, 분류학 ..
- 코사인 유사도
  - 식 2.23 확인, example 2.23
  - 여기서 x 자신의 길이란?
    - 원점에서부터 x의 거리를 의미



문서 전체를 비교하는게 아니어서 어떤경우에는 잘 맞지않을수도있음

실제 최근 문서비교는 이런건 잘 안씀



다음주 수업에는 파이썬이 정상가동이 가능한 상태로 맞춰서 오도록

질문은 메일이나 게시판을 사용할 예정