# Data Warehousing and Online Analytical Processing

OLAP (Online Analytical Processing)

## What is a Data Warehouse

Data warehousing은 데이터를 체계적으로 구성, 이해 및 사용하여 전략적 결정을 내릴 수 있도록 Architecture와 Tool를 제공한다.

요즘같은 시대에 있어서 꼭 필요한 마케팅 무기이다.

그래서 Data warehouse가 도대체 무엇일까? 여러가지 방식으로 정의되어서 Rigorous한 정의를 내리기 어렵다. 

- Data warehouse는 조직의 기능적인 데이터베이스로 부터 따로 유지되는 Data repository이다. 

- 분석을 위한 Consolidate하고, Historical한 Data을 위한 Solid platform을 제공함으로써 Information processing를 Support한다.

A data warehouse is a subject-oriented, integrated, time-variant, and nonvolatile collection of data in support of management's decision-making process.

Data warehouse는 경영진의 의사 결정 프로세스를 지원하는 주제 중심, 통합, 시변 및 비 휘발성 Data collection입니다.

4가지 특성

- Subject-Oriented

  - Major subjects를 중심으로 조직화되어있다.
  - Decision maker를 위한 Data Modeling과 Analysis에 초점을 맞췄다.
  - Decision support process에 유용하지 않은 데이터 제외함으로써 특정 subject에 대한 Simple하고 Concise한 view를 제공한다. 

- Integrated

  - 여러가지 데이터 소스로부터 온 데이터를 통합해서 구성한다.
    - 관련된 Databases, flat files, online transaction records
  - Data cleaning과 Data integration technique이 적용된다.
    - Naming conventions, encoding structures, attribute measures
  - 데이터가 Warehouse로 가게되면, 변형된다.

- Time Variant

  - DB가 Current value data를 가지고있다면, Data warehouse는 historical한 data를 가지고 있다.
  - 역사적인 관점에서 정보를 제공하기 위해 데이터가 저장됩니다.
  - 모든 key structure는 시간요소가 implicitly or explicitly하게 저장되어 있다.

- Nonvolatile

  - Operational environment에서부터 변형된 데이터가 물리적으로 분리된 데이터 저장소이다.
  - Data의 Operational update는 Data warehouse environment에서 일어나지 않는다.
    - Transaction processing, recovery, and concurrency control mechanism이 요구되지 않는다.
      - initial loading하고 access만 있으면 됨

  

Data warehousing을 쓰는 이유



increasing customer focus, which includes the analysis of customer buying patterns (such as buying preference, buying time, budget cycles, and appetites for spending); (2) repositioning products and managing product portfolios by comparing the performance of sales by quarter, by year, and by geographic regions in order to fine tune production strategies; (3) analyzing operations and looking for sources of profit; and (4) managing customer relationships, making environmental corrections, and managing the cost of corporate assets

However, a data warehouse brings high performance to the integrated
heterogeneous database system because data are copied, preprocessed, integrated, annotated, summarized, and restructured into one semantic data store.



A major reason for such
a separation is to help promote the high performance of both systems.

Processing OLAP queries in operational databases would substantially degrade
the performance of operational tasks.

Concurrency control and recovery mechanisms, if applied for such OLAP operations, may jeopardize the execution of concurrent transactions and thus substantially reduce the throughput of an OLTP system.

# Why a Separate Data Warehouse

- 두개의 시스템에서 좋은 성능을 내기 위해서
  - DBMS-tuned for OLTP
  - Warehouse-tuned for OLAP
- 다른 function과 다른 data를 가지고 작업한다.
  - OLAP에서 decision support에는 consolidate한 데이터가 필요하다.
  - OLTP에서는 그날그날의 Data가 필요함
    - 데이터가 잘 정돈되있는 상태가 아니기때문에 그에따라서 function도 많음



# Three Data Warehouse Models

- Enterprise warehouse
  - 전체조직에 걸친 subject에 대한 모든 정보를 수집한다.
- Data Mart
  - 특정 사용자 그룹에게 가치가 있는 전체 데이터의 하위 집합. 범위는 특성 선택된 그룹으로 제한된다
  - Independent vs dependent
    - Independent: Data captured from operational system
    - Dependent: From enterprise data warehouse
- Virtual warehouse
  - 일부 요약보기만 구체화 될 수 있다.
  - Operational database에 대한 일련의 view



# Extraction, Transformation, and Loading (ETL)

Data warehouse에는 Data를 refresh해주는 back-end tool과 utility가 있다. 이것들은 다음과 같은 function을 가지고 있다.

- Data extraction
  - 데이터를 여러곳에서 얻는것
- Data cleaning
  - 데이터의 error를 감지하고, 가능하면 이를 수정것
- Data transformation
  - 데이터를 warehouse에 맞는 format으로 바꾸는것
- Load
  - sort, summarize, consolidate, compute views, check integrity 등등
- Refresh
  - 데이터 소스로부터의 업데이트를 data warehouse에 전파하는것



# Metadata Repository 

메타데이터란 데이터에 대한 데이터를 의미한다. Data warehouse에서는 metadata는 warehouse의 object를 정의하는 데이터를 의미한다. metadata repository는 다음과 같은 것들을 가지고 있어야한다.

- Warehouse schema, view, dimensions, hierarchies, derived data defn, data mart locatios and contents을 포함하는 Data warehouse구조에 대한 설명이 있어야한다.
- Data lienage, Currency of data, monitoring information과 같은 Operational meta-data가 있어야한다.
- Summarization에 쓸 algorithm이 있어야한다.
- Operational environment에서 Data warehouse로의 Mapping



---

## A Concept Hierarchy: Dimension (location)

계층적인 구조

ex) 위에서부터 all -> 국가 -> 주 -> 시 or bottom up 방식이면 거꾸로 시 -> 주 -> 국가 -> all

여러 방식으로 표현이 가능하다.

generalize가 뭔지



## Data Cube Measures: Three Categories

측도를 어떻게 계산하는가에 따라서 3가지로 나뉜다.

집계함수가 3개로 나뉜다.

- Distributive
  - 분배된 데이터의 형태, n개의 데이터가 있다고 하면 그걸 여러 그룹으로 만들어내는 방식
  - 파티셔닝은 아니고, 단순히 묶어내는 함수 ex) count(), sum(), min(), max()
- Algebraic
  - 대수함수를 이용하는 경우 ex) avg(), standard_deviation()
-  Holistic
  - 전체 데이터를 묶어서 하나로 처리하는 부분?
  - 디바이드하는건 아니고, 서브 집합들을 설명하는 방식
  - ex) median(), mode()



## Typical OLAP Operations

- Roll up: 차원을 축소시키면서 데이터를 요약? (Drill-up, 하위에서 상위로)
- Roll down: Roll up과 반대, 상위에서 하위로 
- Slice and dice: 3차원데이터를 2차원데이터를 만든다던가 하는 방식들
- Pivot (rotate): 보는 관점을 바꾸게 하는? 축을 바꾸는
- Drill across: fact table 한개 이상을 참여시켜서 하는 방식?
- Drill Through: 제일 아래단부터 시작해서 관계를 만들어내는 작업?

figure 4.12 참고



# A star-Net Query Model

긴 줄은 속성값이고, 점들은 가운데가 원점이라고했을때, 원점과 멀어질수록 그 속성에서의 상위개념을 나타내는데, 이 점들을 조합(연결)해서 사용한다.

figure 4.13 확인



## 데이터 웨어하우스에서 얻을 수 있는 것

- 다양한 정보를 얻을 수 있고, 경쟁력 확보 가능
  - 작업 데이터 베이스로부터 추출한 함축적이고 요약되어있는 데이터들을 통해서 다양한 정보를 추출할 수 있고, 추출한 정보들의 품질에 따라서 다른 업체보다 더 경쟁력을 가질 수 있음
- 조직의 현 상태를 정확히 판단할 수 있는 정보가 된다.
  - 비지니스에 활용가능, 뭐가 잘팔리고 언제 잘팔리고 어디서 잘팔리고 등등
- CRM(고객관리)부분에서 큰 도움이 된다.
- 신뢰성의 부분이다. 장기경향,패턴,예외사항을 일관성있고 신뢰성있게 추적하여 비용절감



## 관점들

- Top-down view
  - 데이터 웨어하우스의 모든 정보의 선택이 허락된다?
  - 다양한 조합이 가능해지고, 원하는 정보들을 선택하는게 가능하다.
- Data source view
  - 여러 모든 정보들을 가지고있고, 그것들은 하나의 entity로 만들어질 수도 있고, 툴같은것들을 이용해서 자세하게 모델링하는것이 가능?
- Data warehouse view
  - Consists of fact tables and dimension table
- Business query view
  - 어쩌구 저쩌구



## Data warehouse design process

네가지 관점들을 어떻게 활용하는가?

- Top-down: 하향접근법, 
- Bottom-up: prototype에서 시작한다? (rapid) 피드백을 받아서 좋은기능들을 더 추가



소프트웨어 개발자적인 측면에서 봤을때

- Waterfall: 폭포수방법론, 물이 위에서 아래로 떨어지듯이 절차적으로 처리하는거
  - 각각의 스텝들을 반복적으로 하는방식?
- Spiral: 나선형방법론, 주로 빠르게 개발할때 쓰는방식, 각각의 스텝들을 더 짧게 만드는거?

위 방법들을 구조적 방법론이라고 한다.



Typical data warehouse design process

1. Business process 선택하기
   - 만들려는게 어떤걸 위한건지 분석해서 원하는 형태의 모델을 만들기위한 process 선택해야함
2. ㅇ
3. ㅇ
4. 단위를 선택해야한다.



## Data warehouse usage

사용하기위한 몇가지 Process들

- information processing
  - 리포팅업무를 주로 지원하는 부분들 (차트, 그래프, 테이블 등등)
-  Analytical processing
  - OLAP이라는 기술을 이용해서 사용한다
  - 다차원 분석을 하는거
- Data mining
  - 숨겨진 패턴들을 찾거나, 연관성을 찾거나, 분류와 예측작업을 하는거
  - 최종결과를 가시화하고 제공하는 기법들





## OLAM (Online Analytical Mining)

왜 사용하는가

- 더 하이 퀄리터의 데이터
- 다양한 정보처리의 구조가 사용이 가능하다
  - ㄴㅁㅇㅁ
- OLAP기반 다양한 기법들을 활용할 수 있다.
- 함수를 선택하는 측면에서도 데이터를 활용하기가 더 좋다. 



## Efficient Data Cube Computation

cuboid에서 제일 아래가 base cuboid

제일 위에 있는게 apex라고 부른다.







groupby를 이용하면 관련부분을 집합으로 만들어서 처리하는게 가능해진다.



recall은 아니라고 한게 진짜 아닐확률

precision은 맞다고 한게 진짜 맞을 확률

일단 잡아내고 다시 또 정밀검사하는게 유리해서 recall이 높은게 더 좋음

Precision