# SVM

매우 강력한 다목적 머신러닝 모델

반드시 알고있어야하는 모델

Vladmir Vapnik가 1992년 공개, 딥러닝 열풍 전까지는 가장 널리 이용된  Binary Classifier

- Kernal Trick이라는 정말 말도안되는걸 사용함
  - Trick? technique에 비해서는 약간 마술같은? 단어
  - 어마어마하게 복잡한 연산을 사용하지 않고도 똑같은 결과를 내는 Trick

- 수학, 통계적으로 탄탄한 베이스를 가지신 분이 만든거라서 이론적으로 완벽하고, 잘 되어있다.

  - 반대로 딥러닝은 성능은 훌륭하지만 이론적으로 완벽하지가 않음

    -> 성능도 좋지만, 수학적으로도 명확하다!

- 수학적 베이스가 있으면 쉽게 배울거임 ㅎ

- 1936년 12월 6일 생 (총장님보다 어림)



SVM

- Supervised Learning Model의 하나임
- 분유 오차를 줄이면서 동시에 margin을 최대로 하는 Decision boundary를 찾는 binary classifier
  - 높은 수준의 generalization 획득
- Regression으로도 사용가능.





뉴럴네트워크의 장점은 현재 수학적으로 규명이 안되어있는데 규명하는데 있어서 어려울거임

딥러닝이 그래서 그냥 수학 잘 못하는 사람이 써도 그냥 인정해주는 분위기인데, 딥러닝도 수학적으로 정리가 되게되면 머리 터질것



linear svm에서 hard margin

- 여백을 최대로 만드는게 이 알고리즘의 목표



- hard margin
- soft margin
- Kernal trick svm

hard margin은 수학적으로 설명하기 쉬움

soft부터는 어려움



근본은 0아니면 1로 나누는 분류기인거 기억

- 마진을 줄이는 방향으로 사용하면 regression으로도 쓰임



## 특징

- Complex하다 -> Feature가 많다.

- m: 샘플 수, n: 속성 수

- high dimension이면서 수는 적으면 아주 잘 된다.

  - medium size까지는 진짜 잘 되는데, 빅데이터에서는 cost가 지나치게 커짐(옛날에는 데이터가 적었으니까 괜찮았는데..)

    -> 많으면 독이 되서 이런 특징때문에 딥러닝에 밀렸음

    하지만 의료데이터같은 경우 여전히 데이터가 적어서 아직 많이 쓰이나봄

- High dimensional data에 강점을 가지고 있다.

- Decision Tree계열(ensemble)알고리즘과 함께 자주 쓰임



## Generalization of SVM model

- Test dataset은 training dateset과 같은 내재적인 데이터 형성과정을 가진다고 가정하고 모든 기계학습은 진행됨

  -> 둘의 분포가 대강 비슷할 것이다. (하지만 항상 똑같을 순 없지)

- 항상 똑같지는 않을 것 이기 때문에, 테스트에서 잘못된 결과를 도출할 확률이 높음

- generalization 능력을 올리기 위해서는 hyperplane사이 거리(Margin)을 최고로 만드는 decision boundary를 만들면 됨

  - n차원을 나누는놈은 n-1차원

- **두 hyperplane과 평행하고 margin이 maximum이 되는 decision boundary를 찾자!**

이제는 어떻게 이 알고리즘을 만들어내느냐가 문제임

- 어떻게 Margin을 최대화시킬지
- 어떻게 hyperplane을? $ W^tx + b = 0 $을 이용해서 hyperplane을 수식적으로 표현할 수 있음.



두개의 독립시킬수있는 벡터가 있으면, 이것에 의해서 평면을 정의할 수 있음 여기서 cross product를 이용해서 법선벡터를 정의하고, 법선벡터를 이용해서 ~~을 할 수 있는것

이런것들을 이용해서 margin을 구해낼 수 있음



you can think of an SVM classifier as fitting the widest possible street (represented by the parallel dashed lines) between the classes

decision boundary가 중앙선이 되고, edge에 걸쳐있는 녀석들이 support vector라고 하고, 이것에 의해 define된게 support고,  등등등



outlier가 있어도 모델이 잘 만들어진다는 이유가, support vector의 마진을 최대화한다는 특징때문에 그럼 (다른 데이터에는 무관심하겠지)

일반적으로 완벽하게 선형으로 나눠질 수 없는 경우에도 svm를 쓸 수있음

- hard margin일때는 Linear하게 separable할 경우에만 가능함 (깐깐한 녀석)
- soft margin를 써야겠지
  - 몇개는 봐주는 모델 (몇개정도는 용인하고 신경안쓰는 모델 flex어쩌구로 조절가능)
- 나중에는 비선형적인거도 표현되서 (Kernal Trick) 인기많아짐



이텔릭체는 scala값, 볼드체는 되어있는거는 벡터값

- **x** : sample의 feature vector
- **w** : weighting coefficient vector (which defines the hyperplane with bias. b)
- *b* : bias defining the hyperplane with **w**
- d(x) = w^Tx + b = 0 : decision hyperplane의 combination
  - decision hyperplane?
    - 전체 space가 n차원이면 n-1차원의 어떤 성격을 가지게되는 어떤거
  - Linear combination
    - hyperplane을 풀어서 쓰면 linear combination??

2차원 공간에서는 hyperplane이 1차원이고, 100차원 공간에서는 hyperplane이 99차원이래

주의할것은 hyperplane하고 w가 어떤 관계냐면, d(x)는 다양한 vector들이 있는데, 이 모든 vector들과 othgonal한 관계를 가지고있고 그래서 normal vector라고 부른다. (직교하는 관계) 



$w^tx_1 +b =0$하고 $w^tx_2 + b =0$하고 빼면

w^t(x_1 -x_2) = 0이라고하면 ||w|| (x_1 - x_2) * cos\theta = 0인데

위 식하고 비교해보면 w랑 (x_1 - x_2)가 0이 아니니까 결국 \theta가 90도라는거고, othgonal 하다는거지

여기서  뭐 w^tx +b = 0을 이용해서 접선을 이용해서 길이를 구해서 알아내야한다는거?

||w||_2 = \root { \sum {i=0}_n |w_i|^2 }



d(x)의 식에 모두 c를 곱해줬다고했을때 hyperplane은 바뀔까?

안바뀐다. w와 b의 값이 고정되있기떄문에 길이는 달라지지만 plane의 위치는 바뀌지 않는다?

뭘 곱해줘도 x= 어떤값은 그전하고 항상 같을것!



x_p하고 x_n의 관계 기억!

h는 decision boundary와 support vector간의 "거리"

x가 hyper plane에 얼마나 떨어져있냐가 바로 h가 되겠네

임의의 x가 들어가게되면 또 그때의 길이가 나오는거고





separation band (분할띠)

도로변 edge라고하는데 support vector로 된 선



margin

- h의 2배
- separation band의 width

이때 그냥 h에서 |wx_p +b| = 1 or -1 이라고 해놓으면 쉽게 전개가 됨

(wx +b = 0 이 decision boundary인거 까먹지말고!????)



margin을 크게하는 hyperplane!

margin을 최대로 하기위해 조절해야할 argument는?

-> w와 b







## SVM 관련 기호 및 용어 정의

Objective function

Subjective function?

Largrange multiplier -> kkt 조건을 사용해서 w,b를 구할필요없이 알파만의 문제로 바꿀 수 있다. 

stationary point

## KKT 조건 

Primal feasibility

Dual feasibility

Complementary Slackness







w,b에 대한 식이 Lagrangian으로 object function - 알파 컨벡어쩌구로 해주면 이 식이 알파에 대한 즉,  lagrangian multiplier에 대한 식으로 바뀌게 되서 더 처리하기 쉬워지면 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

알파는 QP로 구해낼거임

헷으로 되어있는건 최적화된 값

t하고 x는 입력값이니까

주의해야할것은 알파가 항상 값을 같는건 아니라는거

알파가 0인놈은 support vector가 아닌놈들







==svm은 scaling이 꼭 필요함==



--------------------

# SVM : 용어

Linearly Separable

- Training data가 선형분리가 가능해야 Hard margin SVM이 가능하다.

Separating Hyperplane

- Decision boundary 와 같다.
- SVM은 근본적으로 Binary classification을 수행한다.

Support Vector

- 각 클래스에서 Separating hyperplane에 가장 가까운 Training date 의 샘플을 가리킨다.

- W^Tx +b = 1or-1 이면 Support vector





# Hard Margin Classification

Note) Linearly Separable인 경우에 사용한다!

- Margin을 최대화하면서 Margin violation을 허용하지 않는다.

  실제 데이터에서는 거의 사용을 못한다는 뜻!



2h를 최대화하는게 Hard Margin의 목표다.

- h는 support vector와 Decision boundary 사이 거리



sklearn의 SVM library에서 C라는 Parameter가 의미하는건?

- Complexity
- Cost

-> C의 값이 크면 클수록 Error가 Model에 미치는 영향이 커진다.

C는 Margin violation에 얼마나 예민하게 반응하느냐하는 Parameter.



Hard margin이 Regularization이 안되는 이유는? (Generalization?인가?)

C가 커질 경우

- Decrease the margin violation
- Tend to decrease the width of margin
- May decrease the generalization performance.

만약 Outlier들이 좀 있다라고하면, Hard margin은 굉장히 민감해서, 이걸 잘못 판정하는것을 허용을 안해서 거기에 집중하느라, Generalization Performance가 작아지게 되는 것! 그래서 결국 어떤 의미에서는 Overfit이 된다는 것!

그래서 C를 Complexity라고 부를 수도 있다는게, 복잡한 모델에서 더 Overfit이 잘 일어나니까 일맥상통하다.



Scale에 민감하다.

- 가능한 Margin에 최대화되도록 학습하는데, 그래서 Scale이 작은것은 무시되기 쉽다.

https://gentlej90.tistory.com/26 Scale을 맞춰주는 방법 두가지!

https://stickie.tistory.com/?page=15

정리하면..

Hard Margin은 Generalization 능력이 너무 떨어져서 사용하기 힘듬



# Soft Margin Classification

slack variable (= \xi)를 Objective function에 도입하여 Linear Separable이 성립하지 않는 경우의 Hard Margin이 동작 못하는 문제점을 극복함.

- C가 크면 오차에 더 집중
- C가 작으면 Margin을 Maximize 하는것에 더 집중

Note) 근본은 Binary classification

C가 작은경우가 Soft margin!

hyperparameter에 민감하다는거!





## C : Cost, Complexity

- 작을 수록 많이 허용하고, 클 수록 적게 허용.
- complexity가 높다 -> overfitting 될 확률이 높다 -> Cost를 최대한 줄이는 쪽으로 학습이 된다 -> violation을 용서하지 못한다 -> hard margin
- 이런 사이클!



근데 주의할점은 뭐 complexity어쩌구 하는데, 사실 그냥 linear하다는걸 까먹으면 안됨







sklearn에서 linearSVC하고 그냥 SVC의 차이는?

그냥 구현 방식이 다른데 같게 쓸 수 있음

linearSVC 확률을 보여주지 못한다는거 알고 있기를 바랍니다

hinge를 쓰는 이유? W^Tx +b >= 1 



# Non-linear SVM: Polynoial Kernel

Data가 Non-linearly separable한 경우의 svm

직선은 1차원, 점은 0차원, 평면은 2차원인데..





SVM에서는 Kernel trick을 이용해서 어떤 데이터든지 **Linear classifier로 분류함**

- 데이터 공간의 차원을 변화시키는 일은 상대적으로 쉽게 해결할 수 있음



polynomial에는 degree가 있다는거 기억!

- 낮은 degree는 복잡한 데이터셋에서 작동 잘 못함
- Degree가 높으면 많은 feature들이 추가되어 연산량이 늘어나고 동작속도 저하로 이어짐





# Similarity function with Landmark

Nonlinear feature를 처리하는 기법중 하나

- 특정 데이터를 Landmark로 설정하고 이것과 얼마나 비슷한지를 측정하여 해당값을 feature로 추가하는거

  -> 끼리끼리 모인다는 점을 이용

$$
K(x,y) = \phi(x)^T \phi (y) = cos\theta |\phi(x)| |\phi(y)|
$$

inner product는 두 벡터간의 사이각이라고 볼 수도 있다는거 

커널은 다음과 같으 ㄴ특징

- x,y가 동일할 때 가장 큼

- 두 벡터간의 차이가 클수록 작아진다.

즉! Kernel은 두 샘플 벡터간의 유사도에 해당한다! (Similarity)

데이터를 고차원으로 transform으로 할 필요가 없이 같은 효과를 낸것이다.



### Gaussian Radial Basis Function (RBF)

$$
\phi_r(x,l) = \exp(-\gamma\lVert x-l\rVert^2_2)
$$

- Landmark l과 sample x와의 similarity를 계산한다. 같은 위치면 1(max), 다른 값이면 급격하게 줄어드는 exp형태!
- Landmark와 비슷하다는 범위를 gamma로 조정할 수가 있다. (gamma가 크면 폭이 매우 좁아짐)
- 감마가 크다? -> 모델이 차이를 구분하는데 있어 굉장히 민감하다.
  - 엄격하다! 복잡한 모델이 만들어진다?
- 감마가 작다? -> 그냥 설렁설렁
  - 덜 엄격하다! 덜 복잡하다!



# Classification에서 RBF의 사용방법

SVM 등에서 이를 이용하는데, 훈련 데이터셋에 있는 모든 샘플을 랜드마크로 설정하고 이들을 이용하여 RBF를 계산하고 feature로 추가함으로서 훈련 데이터셋을 linearly separable하게 만들어냄.

- n개의 feature를 가진 m개의 샘플에서 위의 방법 적용시
- n+m개의 feature를 가진 m개의 샘플이 만들어짐

단점은 역시 샘플수가 많은 훈련데이터셋에서 매우 많은 feature가 만들어진다는 말임

너무 많은 feature가 만들어진다는거;;

이것을 극복하는 방법은 Kernel trick이 있지만.. 필수적으로 늘어나는 것이 있기 때문에 불리한건 매한가지





# Kernel Trick : Kernel SVM

원래의 학습데이터가 not linearly separable인 경우, 비선형 매핑을 통해 



다항식 매핑함수를 통해 2차원에서 3차원으로 한 차원 높게 변환하였을 때 선형분리 초평면을 가지게 됨

- 단, 고차원으로 비선형 메핑을 직접 수행하게 되면 매우 큰 게산비용이 발생
- 이를 해결하기 위해 ..............??????????//

dual로 푸는 이유는 kernel trick을 사용할 수 있게 해주는 내적떄문임

sample의 수 m이 feature의 개수 n보다 작을 경우에는 primal보다 dnldml dual problem을 푸는게 계산량 면에서 유용하지만, 더 중요한 건 kernel trick이 가능하게 되기 때문



### 커널 트릭의 원리

두 vector들을 고차원으로 매핑하고 나서 inner product의 구하는 것과 일단 두 vector의 inner product를 구하고 나서 고차원으로 매핑하는 것이 같음.

-> Linearity 가 성립하기 떄문임. Linear Algebra에서 vector와 inner product를 괜히 다루는게 아님

계산 깔끔하게 정리되는게 예술;

(a^Tb)^2를 그냥 구하면 되버림

- 제곱먼저 하고 내적하는거랑, 내적하고 제곱하는거랑 같게 등식이 나와버림
- 계산이 훨씬 간단해짐

연산량에 있어서 훨씬 간단하고 효과적이다!

- Kernel함수는 일반적으로 입력벡터 a,b에 기반하여 다차원 매핑 변환 $\phi$를 한 후의 dot product를 계산할 수 있는 함수를 가르킴





#### 대표적인 Kernel Function

- Linear function
  - Linearly separable한 경우에는 그냥 이거 써주면 됨 (sklearn에~)
- Polynomial function
- Gaussian Radial Basis Function
- Sigmoid

이중에서 어떤걸 골라쓰라고? -> 해보고 좋은걸로 해라





## Kernel 함수의 특징

transform function $\phi(.)$의 inner product로 표현할 수 있으면 kernel 함수임.

1. kernel function을 양수배한 함수는 kernel function
2. Kernel function에 양수인 상수를 더한 함수는 Kernel function
3. 두 Kerenl function을 더한 함수는 Kernel function
4. 두 Kernel function을 곱한 함수는 Kernel function
5. Kernel function를 x>=0에서 단조증가하는 함수에 적용하면 커널함수이다.
6. x와 y의 각각 만을 입력으로 

Note) Kernel function은 유사도에 대한 내용







# SVM regression

- 데이터를 나누고싶은게 아니라, 예측값을 구하고 싶은거
  - W^Tx + b =0 을 만족하는?
  - margin내에 최대한의 sample데이터가 많이 들어가도록 Hyperplane을 만드는게 목표다.