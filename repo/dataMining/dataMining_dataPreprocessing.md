# Data Preprocessing



## Data Quality : Why preprocess the data

- Measures for data quality : 다차원적인 시각
  - Accuracy: 맞는지 틀린지, 정확한지 아닌지
  - Completeness: 없어진 데이터, 사용할 수 없는 데이터
  - Consistency: 일관성이 없는 데이터
  - Timeliness: 업데이트가 정기적으로 잘 되었는지
  - Believability: 얼마나 신뢰성있는 데이터인지
  - Interpretability: 데이터가 이해하기 쉬운지



## Major Tasks in Data Preprocessing

- Data cleaning
- Data integration
- Data reduction
- Data transformation and data discretization







# Data Cleaning



- 일관성이 없다 (Inconsistent)
  - 나이가 24살인데 1997년생이 아닌 경우
- 데이터가 없다 (Incomplete)
  - Occupation = ''
- 노이즈가 많다 (noisy)
  - Age = -10
- 의도적으로 잘못넣은 데이터 (Intentional)

-> 사람이 잘못 입력하거나 알고리즘이 잘못되서 일어난다.



## Incomplete Data

휴대폰으로 설문조사를 하던중 휴대폰이 꺼지는 경우

잘못 이해해서 아예 써넣지 않는 경우



### 이런 Missing data를 어떻게 처리?

그 데이터를 아예 무시

사람이 하나하나 채워넣기

정확한 값을 알 수 없기떄문에 결국엔 추론값이 들어가야됨

보통 평균값을 넣는다. (Or decision tree)

- Class의 정보를 알고있어야지만 가능하다.





## Noisy Data

장치가 잘못되서 발생하는 경우

네트워크 상에서 오류가 발생하는 경우

기술적 한계가 있는 경우

Naming에 의해 발생하는 경우

Nosiy 종류

- Duplicate record
- incomplete data
- inconsistent data



### 어떻게 처리?

- Binning (양자화)
- Regression : 
- Clustering
- Combined computer and human inspection (눈으로 하나하나 체크하는 방식)



## 프로세스로서의 데이터 정제

- 결측치, 노이즈, 비일관성은 부정확한 데이터의 원인 파악
  - 사용자의 의도인지
  - 네트워크 문제인지
  - 기기 문제인지
- 프로세스로서 데이터 정제 작업은 어떠한지
  - 어떻게해야 더 효율적으로 할 수 있을지 
- 얼마나 정확히 이 작업을 공략할 수 있을지
  - 신뢰할 수 있는 데이터를 만들어낼 수 있겠느냐
- 도움이 될 만한 툴이 있는지



### Data Discrepancy의 발생 요인

- 잘못 설계한 데이터 입력 포맷으로
- 사람의 입력 오류
- 응답자의 의도적인 오류
- 신규데이터로 개정되지 못한 오래된 데이터
  - 형식을 통일해줘야한다.

#### Data Discrepancy Detection

- Use metatdata
  - 데이터의 정보를 정의, 얘는 리스트고, 단위는 뭐고 등등 

- Check field overloading
  - 무조건 error라고 판단하는게 아니라 한번 검토?
- Check uniqueness rule, Consecutive rule and null rule
  - null값으로 하면 오류가 발생하도록 만들어놓는거지

- Use commercial tools
  - Data scrubbing
  - Data auditing
  - 데이터의 불일치성을 판단하는 툴들이다.



#### Data Migration and integration

- Data migration tools
- ETL(Extraction/Transformation/Loading)
  - GUI기반으로 이런거를 제공해주는 툴



#### Integration of two processes

- Iterative and interactive





## 데이터 통합 (Data Integration)

여러종류의 데이터 (여러개의 데이터 파일 or 다른기종의 데이터파일 or 여러가지의 데이터베이스)를 묶어서 사용할 수 있어야 한다.

- Schema integration ex) A에서는 cust-id, B에서는 cust-#

  - Multiple source들로부터 metadata를 통합하는것

- Entity identification problem

  - 같은 사람의 데이터인것을 알아채도록

- Detecting and resolving data value conflicts

  중복된 데이터를 어떻게 검출하고 어떻게 해결할 것인가

  - 현실세계에서는 하나의 개념도 다 다르게 표현될 수있음
    - 이런걸 인식할 수 있어야함
  - 표현의 방식
    - 길이를 표현할때, cm or m같은걸 고려해야함
  - 







---

Chi square로 연관성 판단

- 값이 클수록 연관성이 크다
  - 크다고해서 항상 좋은 값은 아닐수도 있음
    - 다른요인이 있을 수도있으니까

뒤에 남녀 소설 예시를 봐보자





---

Corralation analysis (numeric data에만 적용가능)

pearson상관계수 확인 

correlation (numeric data에만 적용가능)

0보다 클때, 작을때 0일때확인



covariance 확인 (numberic data에만 가능)

0보다 클때, 작을때 0일때

주가가 동일 산업동향에 의해 영향을 받아, 동반 상승과 하락이 이루어지는 지 알아보자

책을 보고 정리하는게 낫겠다. ㅠㅠㅠ



## Data Reduction Strategies

데이터가 엄청많을텐데, 그냥 처리하게되면 엄청 복잡하기 때문에 줄이는게 중요함



축소전략

- Dimensionality reduction
  - 차원을 줄이는 방식
- Numerosity reduction
  - 숫자축소기술
  - 데이터의 수 자체를 줄이는 방식
- Data compression
  - 데이터 손실기법

### Dimensionality Reduction

- Curse of dimensionality
  - 
- Dimensionality reduction
- Dimensionality reduction techniques



#### DWT

wavelet transform

중요한 부분들을 뽑아내서 그것을 축소해서 표현하고, 마지막에는 차원이 축소된 오리지널이미지를 만들어냄

4개의 채널로 표현한걸 1/4로 줄여서 또 표현하고 또 표현하고 마지막에는 축소된 이미지

중요점은 차원을 줄여나가면서 강하게 남는것들이 중요점이라고한다

-> 이 중요점을 이용하는것이 wavelet transformation의 핵심

Detail coefficients는 빼주는거?

최종적으로 결과값과 coefficient를 가지는데

나중에 이 두개를가지고 다시 원본으로 돌릴 수 있음

이상치를 제거하는것이랑 복잡도가 작다는것이 장점

현재 JPG의 압축기법으로 사용됨

훨씬 압축법의 효율이 좋다. DFT보다



## PCA

모양을 분석할 때 많이 쓰이는 기법

N차원의 데이터를 N차원으로 표현

데이터집합의 장축과 단축분석

- 어느쪽으로 쏠려있는지 판단하는 기준이된다. -> 주축과 단축을 찾아야함



## Attribute subset selection

Feature 몇개만 골라서 사용

중복되는 속성이 많을것이다.

쓸때없는 속성들은 분석에 사용할 필요가 없다

예를들어 부가세같은거는 모두에게 똑같이 부가되는거니까 이런 일정한 데이터는 필요없다.

속성을 선택하는 기법들

Heuristic search (경험적? 노하우?)

- 전진선택법
- 후향제거법
- 의사결정나무 도입



전진선택법과 후향제거법을 





## Parametric data Reduction: Regression and log-linear models

- Linear regression
- Multiple regression
  - 여러개의 속성들을 구분하기위한 
- Log-linear model

데이터 집합이 있을때 데이터 집합을 구분하기 위해서 라인을 만들어내는것

J(θ)=12m[∑i=1m(hθ(x(i))−y(i))2+λ∑j=1nθ2j]

