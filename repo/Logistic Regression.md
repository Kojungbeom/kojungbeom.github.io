이 [블로그]([https://ratsgo.github.io/machine%20learning/2017/04/02/logistic/](https://ratsgo.github.io/machine learning/2017/04/02/logistic/))와 김행근교수님의 강의 참고

블로그를 아주 적극참고한 자료입니다.

# Logistic Regression

Logistic Regression은 왜 나왔을까?



## 문제의식

> Multiple Linear Regression은 수치형 독립변수 X와 연속된 숫자(실수)값으로 이루어진 종속변수 Y간의 관계를 선형으로 **가정**하고 이를 가장 잘 표현할 수 있는 Parameter를 데이터 X로 부터 추정하는 Model이다.

이때 X와 Y를 가장 잘 표현할 수 있는 Parameter라는건 MSE를 최소로 하는 값들을 의미한다. 선형적인 문제는 미분을 통해서 Normal equation같은 방법으로 explicit한 해를 구할 수가 있다. 하지만 만약 Y가 연속적인 실수값이 아닌 Interval을 가진 nominal attribute라면 Multiple Linear Regression model을 사용할 수 없을 것이다. (사용한다고 하더라도 안하느니만 못한 모델이 될 것이다.) 이때문에 Logistic Regression Model이 제안되었다.



## Logistic Function and Odds



### Logistic Function

> 실제로 많은 자연현상, 사회현상에서는 특정 변수에 대한 확률값이 선형이 아닌 S-Curve 형태를 따르는 경우가 많다고 한다. 이러한 S-Curve를 함수로 표현해낸 것이 바로 **Logistic Function**이다. (=Sigmoid Function)

![img](https://i.imgur.com/E0eI8OU.png)
$$
y = {1 \over 1+e^{-x}}
\\ 출처: imgur.com
$$

- 위 그래프처럼 x값으로 +,- 어떤값이든 받을 수 있고, 출력값은 0에서 1 사이가 된다.



### Odds (승산)

> Odds란 임의의 사건 A가 발생하지 않을 확률 대비 일어난 확률의 비율을 뜻하는 개념이다.

$$
Odds = {P \over 1-P}
$$

식에서 알 수 있듯이 P(확률)이 커지면 Odds가 커지고, Odds가 커질수록 P가 커지는 걸 알 수있다. 



## Logistic Regression

회귀식의 장점은 그대로 유지하되, 종속변수 Y를 Category가 아니라 P(확률)로 두고 식을 세우려면?

1. 우변은 그대로 두고 좌변을 P로 바꾼다
   - 좌변의 범위는 0~1사이, 하지만 우변의 범위는 -무한대 ~ +무한대의 범위라서 식이 성립하지 않는다.
2. 좌변은 Odds로 설정해보자
   - 좌변의 범위는 0~무한대, 하지만 우변은 그대로 -무한대 ~ +무한대 범위
3. 좌변에 Log를 취한다.
   - Log Odds 범위가 우변과 똑같이 -무한대 ~ +무한대로 변해서 일치하게 된다.

$$
log{(P(Y=1|X= \vec x) \over 1-P(Y=1|X=\vec x)} = \vec \beta^T\vec x
$$

위의 식은 P에 대한 식으로 정리해주면
$$
{P(x) \over {1-P(x)}} = e^{\vec \beta^T\vec x}, \\
P(x) = {1 \over 1+e^{\vec \beta^T\vec x}}
$$
이제 이 식에서 e의 계수가 0일떄를 Hyperplane으로 해서 값을 분류한다.
$$
y = {1 \over 1+exp^{\beta^T\vec x}} = \begin{cases} y \rightarrow 1 & \mbox {if} \ \beta^Tx  \rightarrow \infin & \\ y={1\over2} & \mbox {if} \ \beta^Tx=0 & \\ y \rightarrow 0 & \mbox {if} \ \beta^Tx \rightarrow -\infin    \end{cases}
$$
여기서 잊으면 안되는건 &\beta&는 category 1과 0을 대표하는 대표 vector라는 것! 두 class의 데이터가 같은 방향으로 존재할 경우 분류하기 어려운데, bias term이 평행이동시키는 역할을 해서 괜찮다!



## Multiple Logistic Regression

Category가 3개뿐이라고 가정하면 Logistic regression Model이 몇개가 필요할까?

-> 2개

왜냐면 우선 1번째와 2번째 category를 구하면, 3번째 category에 속할 확률은 1 - 첫번째 - 두번쨰로 구할수가 있기 때문이다.







----

bias는 정답과 떨어져있는 정도를 의미하는 경우

variance는 training dataset의 바뀜에 의해 모델의 parameter가 바뀌는 정도

모델에서 bias를 낮춰주는 작업을 하면 variance가 커진다

반대로 variance를 낮춰주는 작업을 하면 bias가 커진다.

-> 둘간의 적절한 조절이 필요하다. (Tradeoff 관계)

![image-20200522182614510](/home/ines/.config/Typora/typora-user-images/image-20200522182614510.png)

y와 predict값 간의 오차를 generalization error라고 한다.

기대값이란 평균이란 비슷한 의미이다.
$$
E[(y-\hat f(x))^2] = (Bias[\hat f(x)])^2 + Var[\hat f(x)] + \sigma^2
$$
Bias와 Var가 MSE(Generalization)의 구성원들이네!

Bias는 원래 구해내고자했던 모델과의 차이!

Variance는 훈련데이터간에 존재하는 작은 차이들에 대해 얼마나 민감하게 반응하는지에 대한 지표!

- 복잡한 모델일수록 커질 수 밖에 없음
- 혹은 오버피팅이 심하게 되면될수록 variance가 큰것이라고 볼수도있지
  - 사소한 패턴까지 외웠다는 뜻!

-> Bias가 클 수록 underfit, Variance가 클수록 Overfit되기 쉬운거지

뒤에 \$sigma^2$는 y자체에 있는 noise를 의미하는데, 이럴때는 nosie를 줄이는 방법밖에 없음;;

위식에서 봤을때 결국 MSE가 고정되어있다고 하면, 하나가 올라가면 하나가 떨어지고, 하나가 떨어지면 하나가 올라가겠지.

- 해적마크 칼처럼 크로스

Standard deviation공식처럼 전개하는거 외우면 될듯 ㅎ

그래서 입실론을 \sigma^2라고 한다면(=Var) y= f(x) - 입실론 이라고 할 수가 있다.그리고 입실론의 기댓값은 0

그래서 결국 E[y] = E(f(x) +입실론] = E[f(x)] + E[입실론] = f(x)
$$
Var[y] = E[(y - E[y])^2] = E[(y-f(x))] 어쪄구저쩌구
$$
predict값과 실제값(y) 간의 MSE를 풀어서 구하면 아까 앞에서 봤던식 나올거임



단순한 모델일수록 분산이 낮고, bias는 큼

feature를 추가하거나해서 뭐 polynomial같은거 사용하면 bias는 줄겠지만 variance는 커진다는거지

**그리고 데이터의 수가 증가하면 variance를 감소시키지.**

- 

bias가 클때는 모델을 단순하게 하거나 좀 더 복잡한 모델을 사용하거나!

Bias -Variacne Trade off 검색하고 자료 찾아보기!





# Odds (승률)

Odds와 log라는 개념을 이용해서 regression model을 가지로 classification을 가능하게함

Odds = p / 1 - p

NC의 우승 odds가 1/9라면 우승확률은 1/10

SK의 우승 odds는 1/250라면 우승확률은 1/251

log(Odds) = log(p/1-p)

그래프보면 semantic하네!

0.5보다 크면 positive

05보다 작으면 negative



logistic regression equation 찾아보기;;

sigmoid구하는것도 한번봅시다~



MLEM은 뭐야?

1이 나올확률이 0.8이라고하자

근데 앞에서 하던거처럼 기대값가지고하면 어떻게되냐면, 0이 나올확률 구하려다가 그냥 0곱해져서 0되버림. 이러면 안된다고

뭐라는건지 모르겠으니까 책을 보는게 좋겠다.

Linear regression과 다른점은 closed form solution이 존재하지 않는다.



[https://ratsgo.github.io/machine%20learning/2017/04/02/logistic/](https://ratsgo.github.io/machine learning/2017/04/02/logistic/)

activation function 찾아보기



expectation function

Lkelihood and log-likelihood

Geometric interpretation

log loss

Cross entropy (무조건 찾아보자)

>8가지를 표현할때 균일할때는 3bit면 최선인데, 균일하지 않으면(빈도수가) 빈도가 높은거는 짧게, 빈도가 낮은거는 길게 만드는게 bit를 아끼는 최선의 방법? 일어날 확률이 적은 녀석들은 큰비트로 인코딩하고 일어날 확률이 큰 녀석들은 작은비트로 인코딩하면 효율적으로 데이터를 보낼 수 있다. (균일할때보다) 그래서 cross entropy란 평균적으로 필요한 비트의 양이다. 근데 내가 구한 Cross entropy에 대한 가정이 완벽하지 않다면(분포를 완벽하게 모른다면) 모르니까 효율적으로 데이터보내기를 할 수가 없다. (1.6bit이면 보내는데 3bit이나 쓰게된거임)

> 이상적인 확률분포가 있다고했을때, 이거에 대한 예측값이 진짜 측정값하고 같을때 Cross entropy는 원래써야하는 정보량과 같게 나온다. 하지만 그렇지 않을경우에는 cross entropy가 크거나 같게 나온다.

- 정보량은 1.6bit 인데 3bit을 썼다? -> KL divergence = 1.4

**예측량과 실제값이 다르면 다를수록 Cross entropy가 커지니까 cost function으로 딱이다.**

그리고 Cross entropy cost function에 K에 2가 들어가면 Logistic regression이 된다는거

logic은 뭐냐, sigmoid는 뭐고 softmax는 뭐냐