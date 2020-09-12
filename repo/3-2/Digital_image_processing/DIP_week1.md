# 영상처리 week1

엄밀하게는 digital 영상처리



## Definition

- 디지털 이미지가 I/O인 모든 형태의 디지털 처리과정과 시스템 기술을 총칭한다.

  - 2D 시그널이 입출력인 모든 신호처리 관련 기술, 학문을 총칭

  - 이미지에서 원하는 정보를 얻고자 이미지를 가공 및 변형시키는 기술
    - 색깔을 입힌다거나, 이미지의 resolution을 높여준다거나 하는 일
  - 시각적 처리과정 및 해당 기능을 이해하고 구현하는 기술
    - 카메라를 통해 영상을 얻고 처리해서 어떤 정보를 추출하여 어떤게 자동으로 동작하게 만드는 기술 및 이론 이라고도 한다.
    - 전처리 과정이라고 봐도 무방할 듯?

DIP ----> IMAGE ANALYSIS -------> COMPUTER VISION

#### Computer vision

- 주로 Image의 quality를 높이는 기법을 연구
  - 여기에 다른 학문들에 비해 좀더 관심
  - 사람이 보기에 더 좋아보이는 것도 포함하지만, 뒷단의 컴퓨터 비전기술에서 좀 더 좋은 퍼포먼스를 낼 수 있도록 가공하는 일도 포함한다.



#### Computer Vision 및 영상관련 다른 분야와 비교

겹쳐있어서 딱잘라 구분하기 어렵다.

Computer vision

- 유용한 정보를 추출하는 기법연구 (Feature extraction)
- 주로 입력이 image, 출력이 symbol(vector)

근데 input이 image고 output도 image면?

-> image processing이라고 한다.

이렇게 되어있더라도~ 딱잘라 구분하기는 어렵다~

아무튼 이런것들 잘하려면 확률,통계, 선형대수부분쪽 개념도 잘 잡는게 중요하다.

코딩실력과 균형을 이루도록





## Introduction

어떤 이미지로 어떤 Task를 할 것이냐에 따라서 Storage, transmission, extraction과 같은 것들이 이미지 프로세싱에 들어간다.

강의 목적

1. DIP가 무엇인가에 대해 말할 수 있어야 한다.
2. DIP의 역사적 측면은 과감히 **생략**
3. DIP가 어디 영역에서 사용되고, 얼마만큼 잘 돌아가고 있는지
4. 원리적 단계 
5. 세부 카테고리로 나눠서 자세히 Component들에 대해 설명
   - DIP가 뭘 하는지 잘 나타내니까 어떤걸 하는 놈인지 잘 알아보자



DIP는 전처리부분을 자주 다룰거임

-> 많은 기술들이 딥러닝으로 대체된게 많음



이미지를 일반적으로 어떻게 처리하냐면 two-dimensional function으로 처리하는데(동영상이면 3d), 이 값이 z라는 값으로 하나로 나오는 경우도 있지만, vector로도 나올 수 있다.

이미지 = 2 dimensional matrix or 3 dimensional tensor

xy값에 해당하는 그 value는 하나만 있을때는 intencity, brightness라고 많이 쓰임

When x,y, and the intensity values of F are all finite, discrete quantities, we can the image adigital image



picture elements -> pixel

디지털 이미지를 표현하는 하나의 element

voxel은 volumn꺼다 해서 육면체 형태



시각이 워낙 지배적이다 보니까 그런 사람들이 만든 이런 방법들도 그렇다

그리고 시각데이터도 많다.

하지만 DIP는 EM에만 제한되는게 아니라, gamma, radio wave같은 것들도 다 다룬다.



#### 컴퓨터 비전 정의

기존의 데이터로 부터 사람이 하는것처럼 판별해내는것을 목표로함

- 입력 이미지에 따라 Learning을 하고 Make inference하고 액션을 취하는걸 포함



 로우레벨은 전처리 

- 노이즈 제거
- 콘트라스 증가
- 영상을 샤프하게
- 인풋아웃풋 모두 이미지데이터 (DIP에 확실하게 속하는 부분)

미드레벨은 로우레벨에서의 결과를 바탕으로

- 앞단 뒤단을 나눈다던지
- 사람 얼굴만 뽑아내고 나머지는 버린다던지
  - 벡터를 뽑아내서 정보들을 뽑아내고 묘사하는 

하이레벨은 Computer Vision에 가깝쥐

- 결론 도출
- 이미지 이해



## Digital Image

Pros

- 높은 재현성
- 정보 추출/추가 등이 쉬움
- 취득, 처리, 재현, 저장 용이

Cons

- 데이터 손실





아날로그는 continuous지만, 디지털은 discrete 이러다보니 원래 정보에서 손실은 어쩔 수 없는 부분이다.

아무튼 어떻게 처리해서 디지털 형태로 저장하고 관리한다. (PACS 시스템을 이용함)

- 의료기기에서 얻어진 영상을 디지털 형태로 저장

여기에는 3단계가 있다

- 표본화 (Sampling)
- 양자화 (Quantization)
- 부호화 (Encoding)

양자화까지만 하면 디지털형태로 변환한거고, 부호화까지는 뭐..



#### Sampling

원래의 아날로그 정보에서 표현해야할 것은 충분히 표현하면서 제한된 용량으로 저장 가능하도록 신호의 일부를 선별하는 것

- 샘플링 주파수가 너무 낮다면 원본신호를 제대로 표현 못함
- Nyquist Sampling theorem에 맞게 샘플링주파수를 정하게되면 원본신호를 반영할 수 있다.
  - 최소한 이 주파수정돈 만족해야 한다는 말씀
- 샘플링 주파수가 더 촘촘할 경우에는 더 좋긴하지만 용량이 더 커질 것 이다.

원래는 더 조밀한 데이터였지만 ...

얼굴이 깔끔한 사진을 찍었으면 변화가 팡팡 안생기니까 그럼 저주파 성분이 많을거임

근데 얼굴에 기미잡티가 많으면 변화가 많아서 고주파 성분이 많다.

그래서 이부분을 제한해서 이미지를 수정할 수 있다.



#### Quantization

연속적인 analog 값을 discrete한 값으로 바꾸는 것

- int로 한다면 7.2가 와도 7, 7.3이 와도 7

비슷한 범위들을 거지게 해주는거?

이걸할때는 손실이 존재한다.

sampling rate에 따라 정도가 달라지겠네



#### Encoding

7.4가 Quantization되어서 7가 되었어. 그럼 그다음 7이 2진수형태로 바뀌겠지. 그걸 담당하는게 Encoding이다. 이 과정에서 2진수형태로 바꾸는것 뿐만이 아니라 Compression등도 같이 이뤄진다.



#### Resolution

- Gray level Resolution
  - 비트수 조절 
- Spatial Resolution
  - 화소수 조절 # of pixel

많은 정보량으로 남겼냐 안남겼냐에 따라서 많이 바뀐다.

 다시 Resolution

- Spatial Resolution (lp/mm)
  - 화소수 조절 # of pixel
  - 몇개의 라인까지 구별해낼 수 있느냐
  - Ability to distinguish between closely spaced elements of detail.
- Contrast Resolution
  - 대조도, 명암인가?
  - Gradation

- Temporal Resolution (Hz (or fps))
  - 시간에 의한 이미지의 연속? -> 동영상



## Digital Image Processing의 분류

### Image Enhancement

주관적으로 인간이 보기좋게 화질을 향상시키는 기술

- 의사가 진단에 용의하도록?
  - Constrast, spatial 개선
  - Noise 제거
  - Sharpness

- 이미지가 좋다는 정량적 지표가 없는 경우?



#### Brightness & Contrast

내가 잘 보고자하는 영역만 확대시켜 반영시킨다.

intensity와 brightness는 픽셀이 가지고있는 값이지만 Contrast는 이 값들의 영향을 받는다?



### Inverse

목적에 따라 영상반전처리를 할 수 있다.



### Spatial Filtering

일반적으로 경계정도나 그런것들은 high frequency인데 Noise도 High frequency임..

이런게 좀 문제임 edge를 살리려고했는데 noise도 같이 살아버릴수 있으니까



#### sharpness와 edge enhancement가 따로있는 이유

경계를 강조하는게 edge enhancement

흰옷과 반바지 사이경계같은건 강조가 잘 되는데, 흰옷에 잡힌 주름이라던가 그런건 잘 안잡힌다. 근데 Sharpness는 잘 잡힌단 말이야. 여기에는 두가지 개념이 있는데 resolution과 acutance가 그것이다.

- Acutance
  - 경계가 얼마나 급격하게 변하냐
- Resolution
  - 얼마나 많이 반영하냐

해서 둘다 높으면 Sharpness가 좋은것이다.

Resolution의 일반적인 정의가 선예도이지만, Acutance도 반영을 해야하다보니 따로 떨어진것이다. 

Sharpness또한 주관적이어서 어떤게 더 ""잘보이는지는"" 주관적인것

하지만 Resolution은 주관적인게 아니라는것

그래서 결국 Image enhancement는 사람을 위해서 잘보이게



## Image Restoration

이미지 복원! 이미지가 손상이 되었거나 노이즈에 의해 이상해졌거나 하면 그걸 회복시켜주는 것이다.

- 노이즈 왜곡(Artifact) 제거하고 원래의 영상에 가까운 형태로 복원(추정)하는 기술

Image enhancement와 다른점은?

-> 객관적이다!!!! 정량적이다!!!!

수학적 모델링과정에 의한 훼손 원인을 분석후 후역변환한다.

수학적 모델에 기반한다는 특징이 주관적인 Image Enhancement와의 차이점이다라는걸 기억하자.

구겨지고 그런거에 구김 없애주고... 흑백사진을 색칠해주고.. 숫자 잘 안보이는거 초점 보정해주고.. (근데 이 부분은 초점잡은 부분만 빼고 나머지는 오히려 더 안좋아짐..) 잡음을 제거해서 좀 더 선명한 영상을 만든다던가



## Zoom in / Zoom out



## Image Compression

영상을 효율적으로 저장/전송하기 위해 불필요하거나 중복된 부분을 제거하는 기술

-> 영상정보를 효율적으로 표현하는 기술

- 가끔은 진짜 필요한건만 남기고 극단적으로 그렇게하는 경우도 있음

Encoding / Decoding으로 구성

무손실 압축은, 가역적 변환이나 손실 압축은 비가역적 변환이다.

비가역적? -> 이전상태에서 현재상태가 되었을때 이전상태로 돌아갈 수 없다.

## Image Analyiss

영상의 특징을 수치화하여 표현

원본영상으로 돌아갈 생각도 없음



## Image Synthesis / Reconstruction

영상이 아닌 데이터로부터 영상을 형성 ㄷㄷ



## 활용분야

디지털 TV / 비디오 재생장치

지문얼굴홍채 인식 (Image recognition)







## 기억합시다

image enhancement

-> subjective

image restoration

-> objective

수학적으로 가장 어려운 부분은 Wavelets

변환이 필요하다는거