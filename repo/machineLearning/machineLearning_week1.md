



==가천대학교 김행근 교수님의 기계학습 강의를 듣고 정리한 내용입니다.==

---

# 기계학습 (Machine Learning)



기계학습은 1959년에 만들어진 말.

> **명시적인 프로그래밍 없이 컴퓨터가 학습하는 능력을 갖추게 하는 연구분야**
>
> The field of study that gives computers the ability to learn without being explicitly programmed1.27.

(explicit = 암시적인)



컴퓨터가 직접 데이터로부터

**작업수행방법을 학습할 수 있도록 해주는 알고리즘(?)**을 쓴다.



기계학습은 **AI를 구현하기 위한 구체적인 접근 방식**이며,

인공지능을 가능하게 하기 위한 한 분야



기존에는 Implicit하게 Programming 했다면,

기계학습은 Explicit하게 Programming



필요한 건 두가지

- 알고리즘 (Optimization하기 위해서) 
  - **Deap Learning도 알고리즘 중 하나임**
- 대량의 데이터



(E를 이용해서 어떤 T를 수행하는 P를 계속해서 향상시키는 것?)

- **T** : Classification
- **P** : Accuracy, Recall(=Sensitivity), Precision
  - tp = True positive, fp = False positive, fn = False negative, tn = True negative
  - Accuracy = correct / total
  - Precision = tp / (tp + fp)
  - Recall = tp / (tp +fn)
- **E** : Training Dataset



---

# AI의 시작

다트머스에 모여서 학술회의를 함

"2달동안 10명이 모여서 연구를 하면, 인공지능에 대해서 싹다 연구해서 눈에 띄는 Prograss를 낼 수 있을 것 이다." 라고 하면서 시작함.



---

## **AI란**?

기계 혹은 시스템으로부터 만들어진 지능

**위와 같은 지능**을 만들 수 있는 **방법론** 등을 연구하는 분야.

- 인간처럼 사고하는 시스템
- 인간처럼 행동하는 시스템
- 합리적으로 사고하는 시스템
- 합리적으로 행동하는 시스템

인간처럼 vs 합리적으로

생각하는 vs 행동하는



---

## **Turing Test란?**

: 기계에 지능이 있는지를 판별하고자 하는 테스트

- Natural Language Processing
- Knowledge Representation
- Automated Reasoning
- Machine Learning
- Computer Vision
- Robotics Engineering

일반적으로 아래 두개는 빼고 테스트함



---

# Machine Learning이란?

> **A computer program is said to learn from experience E(=data)** with respect to some task T and some performance measure P, if its performance on T, as measured by P, improves with experience E.



**기계학습을 위한 알고리즘 방식**

- Decision Tree
- 귀납논리 프로그래밍
- Clustering
- Reinforcement Learning
- Bayesian Network
- ANN (-> Deep Learning)



요즘에는 **좁은 영역(분야)에서 사람보다 더 잘하는 AI를 만드는것**을 많이 함

-> Narrow AI



---

## Deep Learning이란?

: 

(Deep Learning is a particular kind of machine learning)

AI, ML, DL의 정의와 차이에 대해 잘 알아야함



다시 정리하면

> **Artificial Intelligence**는 특정 분야에서 인간처럼, 혹은 그 이상의 성능을 보이는 기술
>
> **Machine Learning**는 AI를 구현하기 위한 기술 (Explicit Programming)
>
> **Deep Learning**은 현재 가장 우수한 성능의 ML을 구현하는 기술

AI > ML > DL



---

## ML이 유용한 분야

- 기존에 **이미** implicit 프로그래밍 방식으로 해결했지만

  **Problem에 변화가 너무많아서** hand-tuning이나 규칙에 변화가 필요한 분야

  (하나의 ML Model로 이런것들을 쉽게 해결할 수 있기 떄문에 유용함)

  - ex) 스팸메일 필터 (스팸메일 수법이 계속 바뀌더라도 괜찮음)

- 기존방식으로는 해결방법이 없는 복잡한 문제 (**만능은 아님**)

- Flunctuation environment (**계속적으로 유동적인 환경**)

- 복잡하고 대량의 데이터가 있는 경우 (Data Mining)
  - **겉으로 보이지 않던 패턴을 발견**,

    기계로 Solution을 내고, 그것을 사람이 **역추적**해서 패턴을 발견

    -> 문제에 대한  **insight** 제공!

    

---

## Types of Machine Learning

--차이를 인식하기 위해 알아야 할 용어들--

**Attribute** = type(Data)

- ML에서는 ""데이터의 타입". ex) 주행거리

**Feature** = attribute + value

- ex) 주행거리 = 15,000
- 많은 경우 혼재되서 사용
- 일반적인 의미는 **입력데이터에서 주어진 task에 가장 잘 수행할 수 있는 특징을 정량화**한 것.

**Feature를 뽑아내는건 모델의 성능을 좌지우지 할정도로 굉장히 중요함**

(Deep Learning은 Feature를 자기가 알아서 뽑음. 이래서 떴음.)

-> 전문가 없이도 어떠한 분야에서 feature를 뽑아낼 수 있음.

**Target (Label)**

- 학습 데이터의 **속성**을 **우리가 분석하고자 하는 관점에서 정의 (**Defined)
- ex) 개 사진의 '개', 고양이 사진에는 '고양이'

---



머신러닝의 Type은 여러 기준으로 나눌 수 있다.

---

## 사람의 관여 정도에 따라서 (Human supervision)

### Supervised Learning

- labeled data (**답안지가 있음**)
- classification, regression에 많이 쓰임



#### Classification vs Regression

**Classification**같은 경우는 **Supervised Learning이 아닌것도 있음.**



"결과값 고정" vs "결과값이 범위 내 어떠한 값"

- Classification의 경우, Dog와 Cat을 classification하는 Model이라고 했을 때, 결과값은 {"Dog", "Cat"}
- Regression의 경우, 데이터에 따라서 함수식으로 계산한 값

분류는 데이터세트에 포함된 레이블 중 하나가 나옴

회귀는 input이 들어가면 결과값이 함수식으로 계산한 값이 나옴



---

### Unsupervised Learning

: **Label이 없음**, ML Algorithm이 알아서 학습

기계가 특징을 찾아내어 **알아서** 분류!

- Explore intrinsic characteristics
- Estimate underlying distribution



#### 종류

- Clustering

  - K-means

- Visualization and Dimension Reduction

  - PCA
  - kernel PCA

- Association Rule Learning

  : (기저귀옆에 맥주?)

  - Apiroi
  - Eciat

근데 **Domain knowledge 없으면 분류해놓고 "이게뭔데?"** 할 수도 있음.



---

### Semi-supervised Learning

위에 있는거 두개 짬뽕

종류

- Classification, Regression ...

- Autoencoder
  - 입력값도 자기, 출력값도 자기가 나오게 만드는데 그 과정에서 **Feature를 뽑아내는 알고리즘 사용**
- Deep Belief Network



---

### Reinforcement Learning

: **사건이** **전개되면서 입력되는 "Feedback"을 통해 학습함**

- Sequential event에 대한 **의사결정**을 내릴 때 주로 사용됨
- 게임(바둑, 체스 ..), 로보틱스(이족보행)





---

## 점진적 학습 가능 여부에 따라서

Online Learning vs Batch Learning

Input data stream으로부터 **점진적 학습(incremental learning)** 가능 여부.



---

### Batch Learning(=offine learning)

가용한 **데이터를** **모두 사용**하여 훈련.

**정해진 주기마다 훈련시키고 교체하는 형태.**



---

### Online Learning(=incremental learning)

다양한 데이터를 **mini-batch라는 작은 묶음으로 나누어 시스템 훈련.**

실시간 or 지속적으로 데이터를 공급받음

변화가 심한 경우에 유용함

악의적으로 **나쁜 데이터**를 집어넣으면 모델의 성능이 저하됨



---

## ML이 어떻게 일반화 되는지에 따라서

Instance based learning vs Model based learning

**일반화 할 때, 어떤 알고리즘을 사용하는지**

(Training dataset이 적을 경우에 instance based를 많이 쓴다는것같음)



---

### Instance based learning

새로운 샘플이 들어왔을때, Sample간의 **similarity**(유사도)를 이용하여 estimation(일반화)

- similarity로 sample간의 거리나, 내적을 사용



---

### Model based learning

규칙을 만들어내서, 새로운 샘플이 들어왔을떄 **sample에 대한 Model에 의해서 판단을 내림.**

(2차원에 나타냈다고했을때, 구분선을 model이라고 생각하면 될것같음)

Model is simply a specification of a mathematical relationship that exists between different variables.



순서

1. 데이터 분석
2. Model selection
3. Training Dataset으로 모델 훈련시키기 (Cost Function 최소화)
4. Inference(추론, 새로운 데이터를 주고 Test -> Estimation 수행)



---

# ML에서 중요한 것

: **Task에 맞는 알고리즘을 Select하는게 중요함.**

ML에서 Main task는

- Select a learning algorithm(or a model).
- Train it on some data



### 좋은 Dataset

- column 이 많은거 (Feature가 많은거)

- 그 자체로 일반화된 데이터가 많은 Dataset

  일반화되지 않은 데이터가 많다면?(데이터가 몰려있다던가)

  -> 모델의 일반화하는 능력이 떨어지겠지



#### 나쁜 Data 사례

- **Insufficient Quantity of Training Data**
  - 충분한지 안충분한지는 **상황에 따라 다르다.**
  - 충분하지 않을 때 **이미 만들어진 Model 재사용 or 알고리즘** 적용함
  - **엄청 간단한 모델이어도, 데이터의 양이 충분하면 문제해결을 잘하게 됨**
- **Non-representative Training Data**
  - 일반화가 안된 데이터가 많을 때, 편차가 심할 때
- **Poor Quality Data**
  - 터무니없는 값을 가진 데이터, ex) 나이가 2천살
- **Irrelevant Features**
  - 관계없는 데이터, ex) 학업성취도를 보려고했는데 Feature가 신발사이즈, 연애경험
  - 정확도가 많이 떨어질거임



사실 정확도에 있어서, Model보다 Data가 더 영향력이 큼

그럼에도 알고리즘같은거를 공부하는 이유는,

좋은 데이터를 모으라는 이야기는 마치 좋은 대학가려면 공부열심히해라랑 비슷한 맥락이기 때문에..

결론 : **복잡한 문제로 가면 갈수록 데이터가 많은게 더 유리하다.** 그리고 알고리즘은 알아두면 좋다!



---

### 좋은 Model (복잡한 Model)

- 복잡한 모델들은 **parameter가 많음**
- 복잡한 모델은 **Capacity가 높고 강력하다.**



---





