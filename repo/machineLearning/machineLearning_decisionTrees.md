# Decision Trees

Classification이 본질이지만, Regression도 가능

- Overfitting이 정말 잘되는 알고리즘
  - Generalization능력이 떨어진다
- 그래서 웬만하면 혼자 안쓰임
  - 단! 잘 학습하는 능력을 이용해서 (variance가 높고, bias가 낮다)이 점을 이용해서 data augmentation을 해서 각각에 decision Tree를 만들어서 여러개를 쓰는 형식으로 해서 평균을 내는 방식으로? 사용한다고 함
- Tree혼자로써는 문제지만 달달 외우는 놈인데, ensemble기법하고 같이 썼더니 잘하더라!





---

Optimaization 배우면 재밌을듯

---

## CART 알고리즘 잘 알기

- Classification And Regression Tree

---

파라미터는 모델 내부에서 결정되는 변수입니다. 또한 그 값은 데이터로부터 결정됩니다.파라미터는 모델 내부에서 결정되는 변수입니다. 또한 그 값은 데이터로부터 결정됩니다.Extrapolaration??

책에 있는 내용은 진짜 잘 아는데, 응용문제는 못푸는애가 Decision Tree

- 그래도 모이면 장난아니게 강해짐

어느정도 알고, 문제도 어느정도 잘 풀고하는 애가 SVM

---

카트 알고리즘은 일반적으로 Binary Tree기반



어떤 조건에 대해서 true or false로 나누는거지

그래서 결국 보면 얘가 왜 이런 판정을 내렸는지 설명이 가능해

-> 이해가 쉽다.

- Feature scaling도 필요가 없네 ;;
- 데이터 전처리가 거의 뭐 필요가 없다!



어떤거에 대한 질문을 먼저하느냐가 중요하게 되겠네

- 어떤 질문으로 얘들을 좀더 잘 나눌 수 있을 것인가
- gini는 얼마나 순수하게 나눠지지않았는가에 대한 값
  - a node’s gini attribute measures its impurity
- decision tree에 아무런 세팅도 안하면 무조건 Overfitting됨;
  - 왜냐면 계속해서 얘네를 나누는 질문을 만들어내니까 결국 다 pure하게 나눠지고나서야 끝이남
- 





## Random Forests

그냥 Decision Tree와는 다르게 판단의 근거를 파악하기 힘들다는거









---

Linear SVC에서는 제공안했는데 SVC에서는 function에??



tree를 만들어낸다는건 뭐 어쩌구저쩌구

---



카플라마이어, 생존율 통계분석



## The CART Training Algorithm

- 카트알고리즘은 하나의 Feature만 체크한다.
- 더이상 나눠질 수 없는 형태로 나눠질 때까지 나눠버림 ㅋ
- sklearn에서는 프리프루닝만
- 8개의 데이터가 있을때 나눌수 있는 최대 단계는 3단계 (0~3) = (log2_m)단계
- CART algorithm은 Greedy algorithm
  - 현재 상황에 대해서만 생각한다는 의미? 미래에 대한 생각을 안한다는거 같음

- optimal한 모델이라고 보장 못함!!
  - 가급적 근처까지는 간다는건 보장한다구





## Computational Complexity

예측할때는 시간복잡도는 많아봤자 O(log2(m))

- 샘플의 수가 상관이 없다? 몬솔? prediction을 할떄는 feature의 수와 무관하다고!
  - high dimension으로가도 decision tree를 잘 만들어놓으면 상관없다?
  - -> independable of the number of feature

==학습할때는 영향받음 ㅋㅋ==

- O(n*m log2(m))

==데이터 개수에 따라서 어느정도 깊이가 나올 수 있는지 생각하시고~==

small data에서 잘 작동하지는 못함 (차라리 SVM 쓰는게 훨 낫지)

training data에 overfit되기 쉽다는 단점을 항상 기억하자구!





## Gini impurity or Entropy

binary 로 나눔으로인해서 incurity가 감소하는 방향으로 만들건데

incurity를 뭘로 측정하느냐 -> `GINI or entropy`

entropy는 열역학에서 먼저 나왔다

- 원자들이 얼마나 불규칙하게 있느냐

==어떤 이벤트가 발생했고 알아챘을때, 그때 정보량이 얼마냐를 계산하는데 Entropy를 썼음==

0101이라는 메세지를 보냈는데 실제 정보량은 얼마? 뭐 이런거 ㅎ;;

> a set's entropy is zero when it contains instances of only one class.

만약 서쪽에서 해가 뜬다는 메세지를 받았을때, 내가 얻게될 정보량은 어마무시하지

- 왜냐면 그럴 가능성은 적거든

남고 들어갔는데 거기 있는 사람이 다 남자라는거에서의 정보량은 빵이지



정보량을 그대로 옮기기위한 비트수?

이걸 class의 incurity를 측정하려고 사용했다는거
$$
p =- \log_?(p_2)
$$
밑수가 2면 비트, 자연로그면 어쩌구



imcurity가 심하다???

->  뭔뜻이야



90%



entropy 

- 무질서한 정보, impurity 정보, 상태를 나타내는데 필요한 평균 비트수

Cross entropy 

- 실제적으로 모델링하고자 하는 확률분포는 p를 가지는데 잘못계산해서 q라고하는 확률분포로 대신할때 필요한 정보량
- 내가 가진 training set을 가지고 최선으로 만든게 q인거지 전수조사를 할 수 없잖아
- 내가 예측한 레이블링의 분포가 q라고 생각했지만 실제는 p일때 차이가 존재하는게 CE라고 하면 될까요??
- Cross entropy는 항상 entropy보다 크다는거!
- loss에서 쓰는건 CE-E를 해서 사용함
- E는 Training

엔트로피 공식은 반드시 이해할것

K어쩌구도있으니 잊지말고..







## Regularization Hyperparameters

sample 수 m = 4라고 하자..

tree구조로 만들면 impurity가 0%겠네~

==impurity = 불순물이 있는정도==

overfit하고 싸우는법

- 모델 간단하게
- sample늘리고
- 유용한 feature 늘리고
- **regularization하고**

log2m 깊이까지가면 다맞추지

그래서 그전에 끊는거 설정이 `Max depth` -> 가장 핵심적인 hyperparameter

- 이게 일종의 regularization이 된다.



Note) Hyperparameter하고 parameter의 차이!!!!!!!!!!!!!!!!!





Decision tree는 non-paramteric model이라고 불리는데 사실 있긴함

- feature수 k와 쓰레스홀드의 impurity를 낮추는 방향으로
- predefined

non-paramteric model??

- 가정 자체가 없는 아이들
- 파라미터가 없다는게 아니라, 파라미터의 개수라던가 그런것들이 데이터셋에 따라 바뀔 수 있다는것!
- **트레이닝 데이터에 의존하는 특성때문에 Variance가 높다는거!**

-> overfit될 확률이 높은 이유!



parameteric model

- 파라미터를 변경할 수 있는 자유도가 정해져있어서 모델이 가정하고있는 가설 (선형인지 가우시안 분포를 따르는지..)안에서 데이터를 가지고 뜯어맞추는거라서 (가정에 의해서 뭔가 제한이 된다고) 제한이 많음



파라미터의 수가 결정되어있으면 paramteric model이라고!!



==복잡한 트리보다 여러개의 트리가 더 낫다.==



모델 입장에서 decision을 만드는데 어떤 feature가 기여하는게 전혀없다고 하면

나눠지든 안나눠지든 똑같겠지

그래서 결국 랜덤하게 나눌때랑 똑같은 결과가 나올때 그걸 null hypothesis라고 한다네?



pvalue는 뭐야

- 디지젼 판단에 도움이 안되는놈인데, 우연히 7대3으로 나눴을때, 원래 5대5인데 7대3으로 나눠질 확률??
- 랜덤하게 5050으로 나누는 녀석인데 7대3으로 나올 확률을 계산한게 pvalue
- ex) pvalue가 50%가 나왔다.

관례적으로 key value가 5%보다 크다라고하면 통계적으로 의미가 없다고 판정을 내림

요즘에는 1프로까지도 테스트하는 경우도 있음 ;;



통계적으로 의미가 있다?

-> 내가 정한 threshold보다 작니?

통계적으로 의미가 없을때의 가정이 null hypothesis인데 pvalue가 높다는것은? 통계적으로 의미가 없다라는말과 같다.





## Regression

value는 평균치, 그룹을 나눠서 mean으로부터 얼마만큼의 에러를 가지는지 구하고, mse가 줄어들도록 계속해서 분할해나가는거

끝날때까지 분할하고 결국 무슨값보다 작으면 같은 값을 가지게 되는거

하나하나 맞춘다기보다는 일정범위의 클래스를 만들어내서 값을 내주는 형식이네

==자기 training dataset 범위 이상의 것이 들어갔을때 결과값은 믿기 힘들다==

-> training set에 충실하기 때문!







## Instability

장점

- 간단하고, 해석하기 쉽고
- 사용법도 심플!
- versatile
- powerful

단점이자 문제점

- othogonal하게 나눠질수밖에없는 태생적 한계..
- 