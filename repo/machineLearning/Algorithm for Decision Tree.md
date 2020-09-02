# Algorithm for Decision Tree

- 연속적인거를 이산적으로 만들어낼수 있는가

- 속성들을 어떻게 선택해야하는가





하위트리가 다 만들어졌음에도 불구하고 최종적인 결과가 만들어지지않는다면 어떻게 할 것인가?

- 그 속성중에서 가장많이 가지고(?)있는 값을 선택한다.





Decision Tree는

- Top-down shape
- Divide and Conquer
  - 하나씩 쪼개서 판단하는 방식을 사용
  - Recursive
- 속성의 데이터값이 Categorical 하지않다면(Continuous하다면) discrete하는것이 선행되어야함
- 경험에 의존하던지, statistical measure을 사용하던지(information gain)
- 어느경우에 종료하고 어느경우네느 종료하지 않느냐
  1. 속한 모든 sample이 같은 class에 속하는 경우
     - 그렇지 않으면 다른 attribute를 사용해서 또다시 나눈다.
  2. 더이상 분할되지 않을 경우
     - 다수결 원칙으로 정함
  3. 더이상 테스트할 sample이 없는 경우



그래서 classification에서 어떤 속성을 선택하는게 좋은거라고?

## background: Entropy

정보이론에서의 Entropy

- random variable과 연결된 불확실성에 대한 measure를 위한 단위?

  - 쉽게말해서 A라는 학생이 남자인지 여자인지

     만약 남자이고 우리도 남자라고 알고있으면 정확한 정보

    이제 더 이상 얻을 정보는 없음

    

    B라는 학생이 있는데 남자인지 여자인지 모르고있다면?

    얻을 정보는 더 많다는것



또다른 예시

주사위를 던져서 1~6까지 어느 숫자가 나올지의 확률은 1/6이다.

2번쨰 주사위를 던졌을때의 확률은? 1/6 (두개의 조건이 독립이라면 그렇지)

이번엔 동전을 던진다고할때는? 1/2

이렇게 객체의 attribute 수에 따라서 확률이 달라지는데 이걸 log로 나타내는 방식을 entropy라고 부른다.

![image-20200529093243406](/home/ines/.config/Typora/typora-user-images/image-20200529093243406.png)

엔트로피값이 높다?

-> 불확실성이 높다

엔트로값이 낮다?

-> 불확실성이 낮다.

엔트로피는 불확실성을 기준으로 둔다는것을 기억하자

A measure of uncertainty associated with a random variable.

"불"확실성을 측정하기 위한!







## Attribute Selection Measure: Information Gain

ID3 알고리즘에서부터 발전하기 시작했다.

속성들을 어떻게 선택하느냐에 따라서 많은 알고리즘이 파생되었음



기대치를 사용한다. E(x)가 아닌가봐

잘 분류된다 -> 엔트로피가 작다.

그러니까 엔트로피가 낮은걸 사용하는게 좋겠지

![image-20200529093620744](/home/ines/.config/Typora/typora-user-images/image-20200529093620744.png)

첫번째 수식은 전체 데이터에 대한 불확실성의 판단

두번째 수식은 선택하고자하는 속성에 대한 불확실성에 대한 판단

세번째 수식은 전체와 선택하고자하는 속성의 불확실성에 대한 차이를 이용



엔트로피값이 높다 -> class가 비슷한 비율로 존재한다

엔트로피값이 낮다 -> 분류가 잘 되었다.

![image-20200529094303874](/home/ines/.config/Typora/typora-user-images/image-20200529094303874.png)

gain이 제일 큰놈인 age를 이용하는게 젤 좋음 ㅎ

그다음에는 또 큰놈 그다음 큰놈







## Computing Information-Gain for Continuous-Valued Attributes

데이터를 분할하는거는 어떻게해야 효과적이냐? 기준점을 무엇으로 할까?

- 오름차순으로 분류
- 일단 데이터를 두개로 분류한다. 중앙값을 기준으로
- 이 중앙값의 entropy값을 계산해서 쏠림을 확인한다.
- 그걸 기준으로 split point를 잡고 binary하게 구분하고 또 구분하고 등등





## Gain Ratio for Attribute Selection (C.45)

ID3가 개선된 C.45

Gain Ratio라는 값을 이용한다.

- ID의 단점을 없애기위해 몇가지 수정을 함

  - ex) 데이터가 균등할 때, 만약 일련번호를 속성으로 사용한다고했을때, 이 값은 독립적이어서 분류를 위해 사용하기에는 부적합할듯

  - C4.5에서는 Gain을 다시 split info A로 나누는 방식을 사용

    -> ID3는 그냥 Gain만 사용했음

- information gain값을 split info로 나눠주는 거

  - split info는 발생빈도를 뭐로 나눠줌

이 알고리즘을 기준으로 많은 알고리즘에 파생됨



## Gini Index (CART, IBM IntelligentMiner)

어떤 데이터 집합 D가 있을때 n class로 부터 추출되었다면

Gini계수로 표현하는 방법이 있음

- **2진분할을 전재로 계산을 한다.**
- 상대적인 빈도수를 이용한다?





# Comparing Attribute Selection Measures

- information gain
  - biased towards multivalued attributes
- Gain ratio
  - 큰 데이터보다는 작은데이터에 효과적
- Gini index
  - biased to multivalued attributes
  - has difficulty when # of classes is large





# Overfitting and Tree Pruning

Tree의 가지가 굉장히 많은 경우에는 잡음이나 이상치데이터들이 영향을 미칠것이다.

-> 새로운 데이터가 들어왔을때 정확성이 떨어진다.

피하는 방법

- 가지치기 (Pruning, 사용하지 않아도 될것같은 속성들을 제거하는 방식)
  - pre-pruning: class를 구성하는 과정에서 만들면서 바로바로 제거하는 방식
    - 기준은 Threshold를 만들어서 사용함
  - Post-pruning: Tree를 전부다 만들어놓고 그 상태에서 하나씩 테스트하는 방식
- 





## Classification in Large Databases

앞에서 봤던 알고리즘으로는 대용량데이터를 처리하는데는 단점이 많았다.

ex) 속성들이 많은 경우 (column이 엄청 컸지 예전에 했던것도..)

그럼에도 불구하고 Decision Tree는 인기가 많음

classificaiton된 규칙을 사람이 이해하기 쉽고, 정확도도 높고, SQL queries에 접근하기 쉽고..

워낙 좋다보니까 이걸 개선해서 쓰려는 노력이 많았음

-> RainForest



## Scalability Framework for RainForest

Attribute, value, class_label을 별도로 구성해서 계산하는거? (AVC)

쪼개서하다보니까 메모리 사용량도 적을것이어서 대용량에 좋을거임

- 집합의 개념을 사용하는거지



## BOAT(Bootstrapped Optimistic Algorithm for Tree Construction)

- 작은 Subset으로 쪼개서 걔네를 가지고 Tree 여러개를 만들어서 복합적으로 처리하는 알고리즘
- 전체데이터 Scan은 두번밖에 안필요함







# Bayesian Classification

확률을 기준으로 판단하는 방식 (통계학적이네)

이름에서 보이다시피 Bayesian theory를 기반으로 만들어짐

- Naive Bayesian이 많이 쓰임



하나의 가설을 만들어놓고, 그 가정의 계수를 수정해나가는 방식인거같음?

H(w,x)

하나의 속성값을 기준으로 속성값이 독립이라는 조건하에 데이터를 만든다?



조건부확률이라는 이론을 사용한다.



## Bayes’ Theorem: Basics

data x가 H에 부합할 확률을 계산한다?

x는 class label을 모르는 상태의 데이터 -> evidence라고 불림

class가 H일 확률이 얼마인지 

주어진 H에 대해서 x가 관찰될 확률은 likelihood라고 부름





## Prediction Based on Bayes’ Theorem

뭘 최대로 만들기위해서 해야하는지 





# Naïve Bayes Classifier 

얘에 대해서는 좀 자세하게 정리해서 포스팅하자





## Avoiding the Zero-Probability Problem

전체확률이 zero가 되는걸 막기위한 보완책?





# Naïve Bayes Classifier: Comments

장점과 단점

장점

- 구현하기가 굉장히 단순하고 쉬움
- 결과도 만족스럽게 나옴

단점

- Bayesian이론의 가장 큰 전재는 각각의 속성들이 독립적이어야한다는거
  - 하지만 실제세계에서는 그러기는 쉽지않다. 그러다보니 잘못된 판단도 나올 수 있다는것이다. 독립성이라는 대전재를 수정한 알고리즘도 있음



# Rule-based Classification

decision tree랑 비슷하다고 느낄것같음



## Using IF-THEN Rules for Classification

if와 then으로 된 rule을 사용한다.

if then 규칙에 경우 corverage와 accuracy라는 중요한 특성이 존재

- coverage는 r의 tuple로 cover된 경우라면 실제존재데이터수/전체데이터 수
- accuracy는 ~~~



Size ordering: 두개의 규칙이 충돌했다면 실제 발생한 횟수를 카운트해서 더 큰놈으로 정하는거

class-based ordering: 두 규칙들에 의해서 잘못 classification이 된 녀석을 제거하는거

Rule-based ordering: decision list을 만들어서 중요도를 부여하고, 중요도를 기준으로 남기고 제거하는거 -> 판단은 전문가가 하거나 아니면 경험적으로 규칙을 주거나!



## Rule Induction: Sequential Covering Method

데이터에 따라서 계속해서 룰을 만들면서 바로 학습함

-> decision tree와의 다른점

1. 규칙을 만든다
2. 규칙에 만족하는 애들은 제거한다
3. 규칙을 만든다.
4. 규칙에 만족하는 애들은 제거한다.
5. 규칙을 만든다.
6. 규칙에 만족하는 애들은 제거한다.
7. ..
8. ...





## How to Learn-One-Rule?

1. 처음에는 condition statement가 없이 만들어진다. (모든데이터가 만족)

2. 이제 기준을 만들고 해당하는 애들은 다 제거
3. 기준을 또 추가해서 만들고 해당하는 애들은 다 제거
4. 이걸 계속 쭉쭉 확장해나간다.



- 기본적으로 depth first (하나를 팠으면 걔를 쭉 탐색하는 방식을 사용) 방식을 사용



잘 만들어졌나확인하는 방법은?

- Rule Qulity measures
  - coverage와 accuracy를 사용하나? -> Foil gain



정밀도(Precision) : 정확함의 정도

Recall(검출율) : 실제 ~~~



precision이 높다?

-> tp가 커진다 -> recall이 작아진다. 



두개가 반반섞인게 F measure

