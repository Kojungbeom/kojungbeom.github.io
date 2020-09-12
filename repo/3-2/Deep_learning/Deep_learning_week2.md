# Deep_learning_week2



Linear regression, Logistic regression에 대해 알아야함

- 가장 말단에서 이루어지는 기본적인 두가지 계산원리



Linear regression은 단순하게 이야기해서 데이터를 잘 반영하고있는연속함수를 얻어내는 것 이다.

Logistic regression은 보통 Binary Classification, 출력단에서 자주 사용된다.



#### Linear regression

독립변수 x를 이용해 종속변수 y의 움직임을 예측하고 설명하는 작업

- 독립변수 x가 하나?
  - 단순 선형회귀
- 여러개
  - 다중 선형회귀

단순 선형회귀의 경우 y = ax + b라고 할 수 있는데, 여기서 데이터를 가장 잘 반영하는 최적의 기울기와 b를 찾아내는 것이 목표가 되겠다. (정답은 없다. 하지만 보통은 loss가 가장 작게 나오게 되는 선을 정답으로 하는 경우가 많다.)

- error = (예측값) - (측정값)

이걸 그냥안쓰고 보통 최소제곱법을 사용한다. (부호를 맞춰주기 위해서)



#### Least Mean Squares Method

![image-20200910091957459](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910091957459.png)

보면 2차방정식 형태가 만들어지는데, 이건 아래로 볼록한 포물선 형태로 그래프가 그려질 것이고, 이때 한 점에서의 기울기가 0이라면 그때가 바로 error가 가장 작은 경우가 된다. 기울기를 구할때는 a에 대해서 편미분, 그리고 b에 대해서 편미분한 뒤, a와 b로 정리해서 각각의 값을 구할 수 있다.

- 편미분 = Partial derivative
- 포물선 = Parabola

- 기울기 = Gradient
- E = Expectation (평균)
- 2차방정식 = Quadratic equation

우측 하단에 a의 마지막식은 위아래 n을 나눠줘서 식을 저렇게 변형시켜줄 수 있다.



최소제곱법 python 숙제

```python
import numpy as np

x = [2,4,6,8]
y = [81,93,91,97]

mx = np.mean(x)
my = np.mean(y)

a_divisor = sum([(i-mx)**2 for i in x])

def divided(x, mx, y, my):
    result = 0
    for i in range(len(x)):
        d += (x - mx) * (y - my)
    return d

a_divided = divided(x,mx,y,my)

a = divided / divisor
b = - (mx * a) + my
```





나중에 실제로는 여러개의 입력변수를 다루게되는데, 이때 최소제곱 오차를 적용할 수가 없다. 가장 많이 사용하는 방법은 "일단 그리고 에러를 보면서 조금씩 수정해나가기" 를 많이 사용한다.

- Hypothesis를 세우고, 주어진 요건 충족을 기준으로 조금씩 변화를 준다.

- 각 선의 오차 계산을 할 수 있어야 하고, **오차가 작은쪽으로 바꾸는 알고리즘**(경사하강법, Gradient Descent)을 사용하여 최소가 될 때 까지 이 과정 반복
  - 오차에 대한 정의가 필요하다는 것
  - 오차를 정의를 할 때는 양수와 음수가 섞여있으면 정확한 오차를 구할 수 없다.
  - 보통 제곱을 하는 이유?
    - 에러가 작아질 수록 에러는 작아지고, 1이상이면 기하급수적으로 커져서 에러를 찾아갈 때 유리하게 됨

양수 - Positive

음수 - negative

<br>

#### Mean Squared Error (MSE)

각 error의 제곱의 합의 평균을 구함

![image-20200910094303190](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910094303190.png)

그전에 선형회귀 정의 한번더!

> 임의의 직선을 그어 이에 대한 평균제곱오차를 구하고, 이값을 가장 작게 만들어주는 a와 b를 찾아가는 방법이다.



y에 모자씌우면 예측값을 의미
$$
MSE = {1\over n}\sum(x_ia + b - y_i)^2 \\
y_{pred} - y_{data}
$$


#### Gradient Descent

오차와 a의 관계그래프를 보면 포물선인데, 최소값 기준 오른쪽은 +, 왼쪽은 -가 된다. 이때 내가 최소값을 찾기위해 이동해야하는 방향은 그점에서의 기울기의 반대방향이 된다.

- 이동해야하는 방향은 그점에서의 기울기의 반대방향
- 최소값에 다가갈수록 기울기가 점점 작아진다.

근데 최소값에 다가가는 step의 크기도 중요하다. Local minimum을 지나칠 수도 있어서 그렇다. 
$$
a_{i+1} = a_i + \Delta \\
\Delta = {-dE \over da_i}
$$
이런 식으로 기울기를 계속 조정한다고 했을 때, Local minimum을 그냥 지나칠수도 있다는 말이다. (수렴해야하는데 발산하는 중) 그래서 Learning rate이 사용된다.
$$
a_{i+1} = a_i + \gamma \Delta \\
\gamma = Learning\ rate
$$
learning rate은 hyperparameter로, 얼마가 최적의 값인지는 모르는거니까 값을 변경해가면서 직접 돌려봐야한다. Hyperparameter는 학습의 환경을 만들어주기위한 옵션이라고 생각하면 된다. 저어 위에 식을 내가 구하고싶은 parameter에 대해서 편미분을 해서 각각을 구한다. 근데 왜 보면 a_diff, b_diff에서는 -가 붙었느냐? 원래 수식상으로는 (y_pred - y_data)를 사용했는데 코드에서는 (y_data - y_pred)로 사용한다. 이렇기 때문에 결국 포물선이 바뀌어버린거나 마찬가지가 되니까 부호도 반대로 돌아가야한다.



```python
y_pred = a * x_data + b
error = y_data - y_pred

# 편미분
a_diff = (-2/len(x_data))
b_diff = 
```

앞에서 했던 LMS와 다른점은 독립변수가 늘어나더라도 상관없다는 것
$$
y = a_1x_1 + a_2x_2 + b
$$




## Logistic regression

간단한 Classifier

- 전달받은 정보를 놓고 참과 거짓 중에 하나를 판단해서 다음단꼐로 넘기는 장치들이 딥러닝 내부에서 쉬지않고 작동한다.
- 하나의 미니판단장치
- 입력값의 특징을 추출한다.

예를들어 자격증시험같은 경우, 점수가 중요한게 아니다. 합격인지 불합격인지가 중요하기 때문에 데이터를 받아서 특성을 잘 담아내기 위해서는 1or0이니까 S자 형태가 더 옳다.

로지스틱회귀

> 선형회귀와 마찬가지로 참과 거짓사이를 구분하는 S자 형태의 적절한 선을 그려가는 과정

![image-20200910101817535](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910101817535.png)

- a가 0에 가까워지면 직선에 가까워진다.

- a가 커지게되면 거의 수직에 가까워진다.

- b는 수평이동

> Logistic Regression 이란 Binary classification 문제의 아웃풋을 표현하기 위한 알고리즘으로서, Sigmoid 함수를 Activation Function으로 사용하며 그 결과값은 0~1사이의 확률 값으로 표현이 된다.

```python
def sigmoid(x):
    return 1/ (1 + np.e**(-x))

# sigmoid를 미분하면 자기자신인데, 안에 a가 있으니까 앞에 x_data 나옴
# 편미분들
	a_diff = x_data * (sigmoid(a*x_data+b) - y_data)
	b_diff = sigmoid(a*x_data +b) - y_data
```

구분해야하는 class가 많아지면 Softmax라는 함수를 사용한다.



## 로지스틱 회귀에서 퍼셉트론으로

y = 1 / (1 + e**-(a1x1 + a2x2 + b))

입력값이 x1, x2가 있고, Activation function에 들어가고, 거기에 b가 더해지고, 결과가 출력으로 나온다. 이 구조를 퍼셉트론이라고 한다.

- b는 weighted sum이라고 부른다.

![image-20200910103118131](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910103118131.png)

나중에 regression이냐 classification이냐는 activation function에 의해 결정됨

> 입력값을 놓고 활성화함수에 으,해 일정한 수준을 넘으면 참, 아니면 거짓을 보내는게 뉴런이 하는것과 비슷하다는거

퍼셉트론이란 신경망을 이루는 가장 중요한 기본 단위

퍼셉트론은 입력값과 활성화 함수를 사용해 출력값을 다음으로 넘기는 가장작은 신경망 단위

자극이 어떤 종류냐에 따라서 더 민감하게 받아들이는게 있을텐데, 이부분은 weight를 이용해서 구현, threshold는 sigmoid의 b값에 의해 구현



#### XOR문제

원래 이거 못풀었었는데, 여러 Layer를 쌓음으로써 풀어냄

두개가 같으면 0, 다르면 1이되는 논리연산

이부분은 직선만 가지고 나누는게 불가능하다.

이걸 종이를 접듯이 접어서 나누게되면 문제가 해결된다는 생각을 하게된다.

- 좌표평면의 차원을 바꿔버리는것

-> 은닉층이라고하는걸 둬서 구현 (hidden layer)

저번에 affine transform한다고했잖아, 이게 약간 그런거야

- 차원을 왜곡시킨다.

가중합 -> 활성화함수 -> 활성화함수 -> 출력

보면 파라미터가 겁나많아짐 그러다보니 복잡해질수밖에..

그래서 옛날에는 컴퓨테이션 파워도 부족하고 알고리즘도 안만들어졌다보니까 암흑기가 왔었지



라쿤데이터 이용해서 디텍션으로 만들어서 업로드하면 된다는데?

폴더로 묶어서  올라간 데이터가 문제없이 볼 수 있게끔

학습한걸 캡쳐하고 ppt로 문서화해서 제출, 기한은 수요일 자정까지



## 12-1



## Back Propagation 오차역전파

Software engineer로서 딥러닝을 한다는건, 개선된 알고리즘을 개발할 수 있어야 한다. 요즘에는 Data scientist와 경계가 모호해지고 있는데, 수식을 짜고 그것을 프로그램으로 구현하는 것이 바로 엔지니어가 할 일이다. (나도 그렇게 생각한다.)

그러려면 오차역전파에 대해 우선 알아야한다.

> Output Layer로부터 하나씩 앞으로 되돌아가면서 각 Layer의 weight를 수정하는 방법

여러 Layer가 겹치고 복잡해지기 때문에, 결과값의 오차를 가지고 이것을 토대로 전체 weight를 업데이트를 시켜주는 방식이다.

#### 구동방식

1. 환경변수 지정
2. 신경망 실행
3. 오차측정
4. 역전파실행
   1. 출력층 가중치 수정
   2. 은닉층 가중치 수정
5. 신경망 실행

weight를 update하는 방법은 앞에서 봤던 Gradient descent를 사용하면 되는데, 어느것부터 update되는건지에 대해 주목하자.

문제는 출력층에서 오차를 얻고, 미분을 해서 이전 층으로 넘기기 시작하는데, 오차가 앞으로 전파가 될 때, 출력층에서 멀어지기 시작하면, 오차가 전파되는 값이 줄어들기 시작한다. (Vanishing gradient) 이런 현상 때문에 앞쪽은 학습이 되지않는 현상이 발생할 수 있다. 이건 시그모이드 함수의 특성 때문이다. 시그모이드를 미분해서 update시키는데 사용하는건데, 미분하면 최대값이 0.3가 된다. 그래서 시그모이드를 거치면서 계속 값이 작아지게 되는 것이다. 이 문제를 해결하기 위해 Activation function이 여러가지가 등장하기 시작한다. (ReLU, 하이퍼블릭 탄젠트, Softplus 등등.. ) 하이퍼블릭 탄젠트를 예로 들면, 범위가 1~-1이 되어서 미분되더라도 범위가 확장된다. 렐루같은 경우는 max(x,0)인데, 입력값이 0보다 크면 1이 되고 0보다 작으면 0이되서 계속 앞으로 가더라도 사라지지않다.



#### 경사하강법 단점 GD

- 간단하고 잘 쓸 수 있지만 전체 데이터를 미분해야해서 계산량이 엄청많다.
- local minimum에 빠질 수 있다.

#### 확률적 경사하강법 Stochastic Gradient Descent

- 랜덤하게 추출한 일부데이터만 사용한다.
- 더 자주 업데이트
- 진폭은 불안정해보일 수 있다.
- 최적해에 근사한 값을 찾아낸다는 장점덕분에 각광받는 중 이다.



#### momentum

- GD에 탄력을 주는 방법
- 이전 이동값을 고려해주는 방법
- 몇 스텝정도는 오던방향으로 가게 해주는 관성느낌으로다가



여러가지 고안된 방법이 많으니까 슬라이드에서 확인하자구!

RMSProp 많이 쓰이고 Adam도 많이 쓰이니까 한번 보기를 추천한다.





## Back Propagation 계산법

여러 방식이 있지만, 이번에는 유도해나가는 과정으로 해서 봐보자.

#### 출력층의 오차

입력층, hidden layer, 출력층이 있다고 하자. (입력 2, 출력 2) 먼저 hidden layer ~ 출력층 부분으로 가보면 hidden layer를 입력이라고 했을 때, 아까봤던 하나의 퍼셉트론이라고 할 수 있다. 이때 두개의 출력에 대해서, 실제로는 target(label, 정답)이 존재한다. 이때 이 둘의 차이를 오차Error, Loss)라고 한다. 이때 y^을 정리해보면
$$
오차 y_{out} = 오차 y_{01} + 오차 y_{02} \\
MSE라고 했을 때 \\
{1\over2}(y_{t1} - y_{01})^2 + {1\over2}(y_{t2} - y_{02})^2
$$
이제 이렇게 계산된 Loss를 가지고 weight라는 parameter를 업데이트 시켜줘야하는건데, w31을 update시킬때 Loss가 어떻게 변하는지 주목하자

![image-20200910124327318](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910124327318.png)

보면 w31을 update시키기위한걸 구하는데, 다르게 말하면 w31이 yout에 어떤 영향을 주는지를 보는건데, 일단 처음에 y01에 걸리는 영향을 먼저 구하고, 그다음 가중합 부분에서의 영향을 구하고, 그다음에서야 w31에서의 걸 구한다. 한번에 구하는게 아니라 나눠서 구하면 좀더 쉽게 구할 수 있다.

일단 첫번째꺼부터 구하면, yout에는 y01과 y02에서의 오차 두개를 다 포함하고 있는건데, y01에 대해서 편미분하니까 y02쪽은 지워지고 결국 y01-yt1이 나온다.

다음은 가중합 부분이 y01에 주는 영향을 구해야한다. 이 부분은 간단한게 n3가 Activation function인 시그모이드 함수를 거친것이기 때문에 Activation 함수의 미분값을 구하면 되는 것이다. sigmoid(n^3) = y01이었으니까 정리하면 어쩌구저쩌구 됨

마지막 w31이 n3에 어떻게 영향을 미치는지를 보자. 
$$
n_3 = w_{31} * y_{h1} + w_{41} * y_{h2} + 1(바이어스)
$$
편미분하면 y_{h1}만 남겠지.

이제 나머지와 다 합쳐서 계산하면 결과값이 나온다.

![image-20200910125615225](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910125615225.png)

짜잔

\delta y를 w31에 -해줘서 update 시키게 된다.



#### 은닉층의 오차

$$
w_{11}(t+1) = w_{11}(t) - {\partial(오차y_{out}) \over (\partial w_{11})}
$$

입력층과 은닉층사이로 볼 수 있어서 은닉층에서의 출력의 오차를 가지고 하지않을까 생각하겠지만 그렇지 않다는 것이다. 

![image-20200910130250720](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910130250720.png)

아까와 마찬가지로 비슷하게 진행하는 것 같다. 2,3번은 앞에서 한거랑 똑같아서 그냥 값을 저대로 넣어주고, 문제는 1을 구하는 것이다. yh1은 y01과 y02에 둘다 영향을 주니까 생략하면 안되고 둘다 계산해야한다.
$$
{\partial (오차 y_{out}) \over \partial y_{h1}} = {\partial (오차 y_{01}) \over \partial y_{h1}} * {\partial (오차 y_{02}) \over \partial y_{h1}}
$$
과제 logistic