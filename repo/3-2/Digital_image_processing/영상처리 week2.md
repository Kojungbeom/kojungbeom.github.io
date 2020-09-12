# 영상처리 week2

## Image Formation

Acquisition and Representation



#### 기본지식 먼저

2, 10, 16진법이 있고 (8진법도 있다.) 2진법과 16진법은 비슷한 부분이 많아서 같이 많이 쓰인다. 10진수를 2진수로 변환하는거 기억안나면 chapter2 슬라이드로 가보세요.

2진수 - Binary

8진수 - Octal

10진수 - Decimal

16진수 - Hexadecimal

MSB, LSB - Most significant Bit, Least Significant Bit



#### Bit

- Binary digit의 약어
- 정보의 최소단위 (1- 있고, 0- 없고)

비트수가 크다? -> 표현가능한 범위가 넓다. KB 2^10 = 10^3

- 비트수가 크면 Contrast resolution도 높다.

- word란 단어는 많이 쓰이진 않는데 16bit를 의미한다.





## Prefix

Digital Image

- M * N * channel (bit or byte)
- 의료영상은 대부분 칼라는 아니다. (CT or MRI)



## What is Image

좁은의미

- 가시광선을 sensing하여 자연세계의 광학현상을 2차원 이상의 데이터로 표현한 것

**General definition**

- 가시광선 영역 외의 범위를 센싱한 영상
- 컴퓨터 그래픽을 이용하여 생성한 영상



인식: 인간이 인지하는 시각

step1 감각단계 (low level image processing과 유사)

- 전기적 신호로 변환 후 신경계를 통해 뇌로 보내지는 단계

step2 선택단계

- 보고싶은걸 분리

step3 지각단계



Low, middle,high level image processing

- 간단한 처리들이 Low에 포함
- 특정 목적에 따라 영상가공하는게 Middle (segmentation, mapping...)
- image analysis, image recognition같은게 High



## Acquistion and Representation

#### acquistion

- 영상을 실제로 취득하는 단계
- Digitization (Sampling + quantization (+ending))
  - sampling - x와 y를 discrete (연속적인걸 discrete하게 만드는 것)
  - quantization - x와 y를 f(x,y)로 discrete

#### Representation

- Two dimensional function f
  - f(x,y) or f(x,y,z)
  - 벡터로 표현할 수도 있음 $$f(\vector r) $$



#### 취득단계

- 반사, 투영된 빛을 취득장치가 취득 (Reflection, Projection)
  - 전기적 신호 생성

- 카메라 모델
  - 원근 투영으로 모델화 된 핀홀 카메라 모델
    - 3차원을 2차원에 매핑?



### Perspective Projection Model

- World coordinate
  - 실제 세계의 공간좌표 (camera coordinate와 맞추는게 일반적)
- P(X_w, Y_w, Z_w)
  - 공간속 임의의 object (3D)
- p'(x,y)
  - 영상 평면에 투영된 object (2D)

world coordinate, image coordinate이 있고 3D가 투영되서 이미지상에 표현된다.



#### Acquisition : 주요 요소

- 조리개 (Aperture)
  - pupil과 유사한 기능
  - f value는 빛의 양을 조절하는 녀석
    - 크면 구멍이 작아짐 -> 빛의 양 줄어듬

- 셔터
  - 빛이 통과되는 시간 제어 (셔터 스피드)
    - 찰나의 순간을 담을것인지, 아닌지?
  - 조명이 빵빵한 곳은 셔터 스피드가 빨라도 빛이 잘 들어오겠다.



#### Digitization

: 영상의 디지털화

**Sampling**: 연속적이던 공간이 discrete 되는 것이다.

- Impulse Function (얘는 뭐?)
- Comb Function (공간 discrete)

**Quantization**: intensity가 discrete한 value가 되는것이다.

- Intensity혹은 진폭값을 디지털화
- 샘플링 된 값을 일정 길이의 비트로 표현





### Note: Brightness and Contrast

brightness: 영상의 전체적인 밝기 정도

​	- 얘랑 intensity랑 어떻게 비슷한 의미로 사용된다고?

Contrast: 영상에서 가장 밝은 정도와 가장 어두운 정도의 비. intensity가 다른 pixel이 잘 구분될 수록 contrast. 얼마나 잘 구분해내느냐



### Note: Signal to Noise Ratio (SNR)

"원하는" signal과 noise의 비

1. Image에서 ROI를 선택 (regine of interest)
2. 해당 ROI의 모든 pixel의 mean과 std를 구한다.
3. mean에서 std를 나누어서 SNR을 구함
   - 값을 (0,0) 기준으로 보냈던거 였지? std?

일반적으로 노이즈는 많을수록 안좋은 것이다.

![SNR = \frac{S}{N}=\frac{\mu}{\sigma} ](https://lh5.googleusercontent.com/Ou9dzKaWsKd_xhwAfPVORQqIaCPmhVTT4qH2w_Ir-sAKVKsqDMsxn1keD7lDDiKixzPNHRvXIsRWYNvajUJqNh7CcWVHIOTARpr1jkKHklWfROx-6VHFcaMnHf27VG8ZZKQ_2qFPDqU)



### Note: Linearity

Spaial Linearity

- 대상의 기하학적 구조가 획득한 영상에서 얼마나 정확한지, 왜곡이 없는지

Intensity Linearity

- contrast resolution하고 비슷한 느낌?
- 대상의 물리적 특성과 image의 intensity 사이의 선형성
- 컴퓨터가 처리하게 할때는 선형성을 가지는 녀석을 좋은 데이터셋이라고 한다.



## Data Format

encoding에 해당하는 부분

#### BMP

- 비트맵 방식 `.bmp`

- pixel을 이차원으로 정렬하여 표현
- 색을 나타내는데 8비트
- 256가지 색깔중 하나를 표현 (다음과 같은 contrast 지원. 1,4,8,16,24,32bit 지원)

- Run-Length compression방식
  - 압축방식이 단순해서 압축효율이 별로 안좋다.



#### Bitmap Data Structure

- File header
  - 비트맵인지 아닌지 (14bytes)
  - 이런게 일정길이 할당되어있는데, 귀찮은 경우는 header없이 txt로 떨어져있는 경우도 있다.
- Image header
  - 이미지 폭, 높이, 비트수 등등
- Color table
  - rgb값을 어떻게 얻어내는지 나타낸 것
- Pixel data
  - 실제 pixel data, 주로 bottom up 방식으로 저장



#### GIF (Graphics Interchange Format)

웹에서 많이 쓰인다. 웹에서 가장 적은 용량으로 가장 잘 표현한다?

장점

- 한파일에 여러 비트맵을 저장, 다음 프레임 애니메이션 구현
- 투명 이미지 지원
- 특별한 플러그인 없이 적용 가능

단점

- 8비트 256컬러로 제한
- 지나치게 압축이 되어서, 인쇄용 or 의료영상에서 쓰기에는 퀄리티가 낮다.



#### PNG (Portable Network Graphics)

gif 대체하기위해 개발됨

장점

- 비가역적, 비손실 압축방식 (원본 손상 x)
- 이미지의 모든 컬러정보와 alpha채녈을 보존

단점

- 애니메이션 없고 용량이 크다.



#### JPEG (Joint Picture Experts Groups)

장점

- DCT(손실압축방식)을 통해 이미지의 질과 파일의 크기를 조정
- web상에서 널리 사용되는 방식

단점

- 붉은색 표현이 좋지 못하다.
- 고주파 성분 표현도 상대적으로 나쁘다.
- 투명이미지 지원 x



#### Jp2, jpx, j2c

- DCT기반 말고 Wavelet transform에 기반을 뒀다.



#### TIFF

- 색하나에 8 or 16bit으로 저장하는 유연한 포맷

- 손실과 무손실 압축 제공 (주로 무손실)

- 유연하게 확장할 수 있지만, 그러다보니 회사마다 다르기도 하다.
- 논문 등의 출판물 제출 시 많이 요구된다.



#### Raw Data format

- 별도의 헤더정보 없이, 영상 데이터로만 구성
- 영상의 크기정보를 알아야 제대로 표현할 수 있다는거

![image-20200910161010183](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910161010183.png)

곤잘레스 책 

2.1~2.2 생략한데

digital image representation이 가장 중요 

- matrix로 표현되고 그 아래있는 matrix는 scalar(2D) or vector(3~4D)
- 비트수를 조절했을때 어떻게 되는지
- Spatial and intensity, contrast resolution에 대해서 꼭 기억하기
- Image interpolation에서의 수학적인 부분 생각
- 2.5 중요, 2.6은 pdf로 된 부분 올려주실거임



## 2.3

Illumination (조도, 조명) source and the reflection or absorption of energy from that source by the elements of the scene being imaged.

- Illumination는 의료영상에선 빛이 아니라 다른걸로 바뀔 수 있다.
- 반사되는건 reflection이지만 projection은 투과?

![image-20200910173235420](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200910173235420.png)