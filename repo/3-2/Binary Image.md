# Binary Image

 이미지 전체에 대해서 0 과 1로 구성된 이미지



 otsu

- 가장 적합한 threshold값을 주는거?



#### 감마보정

2.2를 NTSC에서 표준 gamma로 채택.



#### 특성곡선 (Characteristic curve)

화소값과 화소 intensity와의 관계를 변환함으로써 영상을 보정

내가 보고자 하는 영역만 극대화하도록 볁환함으로써 좋은 결과를 얻을 수 있다.

- Linear
- Inverse
- Log
- Square



목욜날 두시부터 네시까지 시험, 10분 쉬고 수업한다. 오늘나가는 진도까지가 시험범위

g



## Histogram

BINS:

- 히스토그램에서의 위치

Channels:

- histogram을 만들기 위해 사용하는 값





노이즈의 특징

- 노이즌느 일반적으로 이미지내에서 아주 적다.
  - 영역은 작게 차지하지만 값이 극단적이다. 

히스토그램에서 지나치게 높고 얇으면 노이즈일 확률이 높은데, 얘네를 그냥 버릴 수 없으니 균등하게 나눠주면 완화된다. (Equalization)



#### CLAHE?

Adaptive method는 강력하지만 parameter의 값에 따라 결과가 많이 달라지기 때문에 많이 안쓰인다.





## 10.2 Point, Line, and Edge Detection

convolution이라는 연산이 영상처리에서는 필터링이라고 하는데, 필터링에는 두가지 종류가 있다.

- Spacial domain filter
  - 공간적인 도메인 (픽셀로 다뤄지는 공간에서 filtering)
- Frequency domain filter
  - 주파수 도메인으로 바꿔서 filtering하는거 (high or low frequency)
  - 

두개에 장단점이 있다.

- Frequency domain filter
  - convolution 연산을 할 필요없이 곱하기로 처리된다. -> 편리하게 처리된다.
    - 의료영상에서 많이 쓰임
  - 생각보다 빠르지않다. (퓨리에 transform도 컴퓨터로 짰을때 느리다.)

- Spacial domain filter
  - 안말해주심 ;;



#### Convolution과 Filter

Filter란 내가 원치않는걸 제거하는 것 이다.

Filter로 하는 거

- 노이즈를 제거
- ~~

제거하는걸 반대로 이야기하면 이상치를 추출하는 것 이다. 딥러닝은 Feature를 알아서 뽑고 이게 Hierarchical하게 잘 뽑힌다. 입력에 가까운쪽은 edge정보같은 low level의 feature를 뽑아서 뒤로갈수록 조합이 된다.



line? roof edge? lamp edge? uni step edge?

이 경계의 미분값을 이용해서 





#### Bluring

Average filter로 구현가능. 장점은 noise가 average로 퍼져나가서 사라지는데, edge도 같이 사라진다.  

Averaging의 성격은 subnation이라던가 같은걸 딱 취하면 low frequency가 나온다는것이다. (뭔소리_

- high pass filter -> 미분
  - edge같은 high frequency를 살릴려면 미분에 관한 연산을 취하면 된다. 

- low pass filter -> 적분

1차 도함수는 두께를 볼 수도 있네

2차도함수로 어두운데서 밝은곳으로 갔는지, 아니면 반대인지 알 수 있다.



그래서 만약 아주 얇은 선을 얻어야한다고 했을 때 2차 도함수가 0일때를 선택할 수 있다.



1차 도함수로 된 필터를 사용하면 edge가 두껍다.

2차 도함수로 된 필터를 사용하면 edge가 얇다.

-  라플라시안하고 2차도함수는 noise도 같이 증가시키기 때문에 주의

- 그래서 가우시안이랑 같이 쓰이는데 이건 smoothing용이여서 integration이고, 먼저 가우시안으로 뭉개고 나서 2차도함수를 쓰는경우가 많다.

테일러 시리즈가 뭐야 (테일러 급수)



테일러 시리즈에 의하면 F(x + \delta x)는 f(x)에서 시작해서 무한대로 미분되는 수열과 같다.  근데 무한대를 다 계산하는건 싫으니까 1차미분까지만 해서 approximation이나 구하자.

derivation - 미분

partial djWjrn - 편미분





























