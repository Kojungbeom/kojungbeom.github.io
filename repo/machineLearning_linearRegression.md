# 선형 모델 (Linear Model)

그래프로 출력했을때의 선으로써 표현되는게 Linear Model이 아니라,

 계수(Weight)들이 선형결합관계에 있을때 Linear Model이라고 한다.



즉 아래의 함수들도 모두 선형이라는 것이다.

- $ y = \beta_0 + \beta_1x + \beta_2x^2 + \beta_3x^3 $
- $ y = \beta_0x^{\beta_1} *
- $ y = {e^{\beta_1x_1+\beta_2x_2}\over 1+{e^{\beta_1x_1+\beta_2x_2}}} $

Linear model은 간단하고, 모델을 해석하기가 쉽다.

또한 적은 개수의 Data를 가지고 Nonlinear model을 만드는 것 보다 여러면에서 유리하다.

하지만 복잡한 패턴을 가지고있는 데이터에 대해서는 Performance가 떨어지는데,

정교한 예측이 필요한 경우는 Neural Network와 같은 비선형모델이 사용되고 있다.



---

## Linear Regression

Supervised Learning에 필요한 데이터를 가지고 있다고 할 때,

**선형회귀는 완전히 새로운 X값이 주어졌을때 y값을 예측할 수가 있다.**

처음에는 Weight와 Bias에 임의의 값을 넣어주고, 반복적인 Operation을 통해 

**W와 b를 Cost function가 최소화하는 방향으로 Update시킨다.**



---

### Hypothesis

가설(Hypothesis)을 세운다.

- $ Hypothesis : $ H(W,b) = Wx +b $

만약 x가 x면, y는 Wx +b일 것이다.

이때 이 가설을 주어진 Data에 최적화 시키기 위해서, **Cost function을 지표로 하여** Weight와 Bias를 Update시킨다.



---

### Cost Function

**Cost Function이란 이 가설의 예측값이 얼마나 틀렸는지를 나타내는값!**

- **Cost가 크다?**

  -> 많이 틀렸다.

- **Cost가 작다?**

  -> 조금 틀렸다.

- **Cost가 0이다?**

  -> W와 b가 최적화된 값이다.

보통 MSE를 사용한다.

$ Cost(W,b) = {1\over M}\sum_{i=1}^M(Wx_i +b -y_i)^2 $

Cost function에서 **제곱의 효과**

- Cost의 값은 항상 양수
- 작은 차이로도 Model에 큰 Panelty를 줄 수가 있다.



**Cost function을 이용해서 어떻게 Weight와 Bias를 수정하는걸까?**

Bias를 고정시킨 상태로 Weight만 수정한다고 했을때, 

cost function과 w의 관계를 좌표평면에 제곱에 양수이기 때문에, 아래로 볼록한 포물선이 나온다.

<img src="/home/ines/.config/Typora/typora-user-images/image-20200421193001321.png" alt="image-20200421193001321" width="600px" height="300px" align="center">



이때, 이 포물선의 최소값을 나타내는 Weight값이 **Global optimum**이다.

**마찬가지로 Weight를 수정하고 Bias를 수정한다고 했을 때 똑같이 포물선이 나오게 된다.**

이 포물선의 최소값을 나타내는 Bias값이 **Global optimum**이다.

**이 값을 찾아가기 위해서 Gradient Descent를 사용한다.**



---

### Gradient Descent

포물선위의 한 점에서 Cost function미분을 하면, 그 점에서의 기울기를 알 수 있다.

- 기울기가 음수일때 오른쪽으로 이동하고
- 기울기가 양수일때 왼쪽으로 이동

위의 과정을 반복하면서 Global optimum을 찾아간다.

결국 최적의 Weight와 Bias를 찾는다.



<img src="/home/ines/.config/Typora/typora-user-images/image-20200421183654515.png" alt="image-20200421193001321" width="600px" height="300px" align="center">



---

### Diagram

[![](https://mermaid.ink/img/eyJjb2RlIjoiZ3JhcGggTFJcblx0QVtEYXRhXSAtLT58aW5wdXR8IEIoSHlwb3RoZXNpcylcblx0QiAtLT4gQ1tDb3N0IEZ1bmN0aW9uXVxuICBDIC0tPiBEWzDsnbjqsIA_XVxuICBEIC0tPiB8Tm98IENcbiAgRCAtLT4gfFllc3wgRVtHbG9iYWwgT3B0aW11bV1cblxuXHRcdFx0XHRcdCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)](https://mermaid-js.github.io/mermaid-live-editor/#/edit/eyJjb2RlIjoiZ3JhcGggTFJcblx0QVtEYXRhXSAtLT58aW5wdXR8IEIoSHlwb3RoZXNpcylcblx0QiAtLT4gQ1tDb3N0IEZ1bmN0aW9uXVxuICBDIC0tPiBEWzDsnbjqsIA_XVxuICBEIC0tPiB8Tm98IENcbiAgRCAtLT4gfFllc3wgRVtHbG9iYWwgT3B0aW11bV1cblxuXHRcdFx0XHRcdCIsIm1lcm1haWQiOnsidGhlbWUiOiJkZWZhdWx0In0sInVwZGF0ZUVkaXRvciI6ZmFsc2V9)



---

## Regression의 종류

Depending on the number of dependent variables

- Univariate regression model
  - Linear regression model
  - Polynomial regression model
- Multivariate regression model



