10개정도의 의료데이터

comma seperate data로 구분하는 것이다.

테서렉트: 이미지에서 글자를 뽑아내는것

csv 파일에 이 글자들과 번호를 남긴다?



코마와 테서렉트를 이용해 찾은 텍스트를 대응시키는 방법

- 유클리디언 디스턴스

하여튼 규칙을 만들어내서 레이블링의 자동화 프로젝트

10개중에 8개로 트레이닝 한다음에 2개로 테스트?



두번째는 이 점들만 뽑아내는 방법

- 파란점들만 뽑아내는

- 



- 기계학습의 학습데이터로써 가장 알맞게가 기준
  - 비슷한 퀄리티가 나왔다고 한다면 속도를 본다.





기계학습에서 자동으로 찾아서 label 데이터로 만들도록

점의 위치를 이미지의 x,y비율을 label로

- label, x,y
  - CSV
- 글자들을 없애고 녹색점만 남기는 것 (녹색은 1, 나머지는 0으로 하는 레이블 데이터)
  - 마스크 이미지 하나

---

impulse noise = salt

noise는 변화량이 큰 것이다.

high frequency 성분이 많은 것이기 때문에 low pass filter 종류를 적용해줘야한다.

- 바이레터럴: 엣지도 살리고 노이즈는 죽이고
  - Contrast의 차이와 거리까지 고려하는 방법

---

6. Sharpness는 미세한 구조물이 얼마나 잘 보이나. Acutance는 인접한 픽셀에서 intensity가 얼마나 차이가 나는지, 차이가 많이나면 높은거, Resolution은 얼마만큼 가까이 놓을 수 있느냐?
   - 일반적으로 단위면적당 몇개의 라인이 들어가는 지가 Resolution
   - 인접한 픽셀에서 값이 얼마나 차이가 나는지가 Acutance
7. HSI로 바꾸고 I를 HE로 바꾸고 다시 합친다음에 RGB로 다시 변환
8. Average와 mean의 차이
   - mean 평균
   - Average는 대표값을 정하기 위한 값
9. PSNR은 원본이미지와 얼마나 유사한지를 보기위한 값

10. 위아래도 플립해야하는거 까먹지 말기
11. Sobel은 gradient의 디지털 버전

12. gradient는 2개, laplacian은 3개

15. dpi (dots per inch)
16. Rank는 축의 개수 축의 개수 축의 개수
    -  Scalar는 rank가 0
17. PNG

19. RGB는 뭘 바꾸면 모든것에 영향을 주니까 다른 쓸만한건 뭐있을까?
    - c,d 휴

21. full or ones

22. 

다음주까지 22,23 제외하고 나머지는 풀어서 제출한다.



---

# Image Transform

이미지 변환 (Domain을 바꾸는게 Image transformation이라는데?)

- 공간 주파수 변환
- Spatial domain에서의 변환



#### Fourier Transform

왜 변환을 시키는가?

- 앞에서 edge를 계산하던가 하는 그런것들을 해왔다. 근데 그냥 곱하기 연산하고 컨볼루션 두개를 봤을 때 Elementwise product가 더 쉽다. 
- 그리고 주파수 도메인에서는 컨볼루션이 곱하기로 바뀐다.
- 어느 언어에든 잘 만들어져있다.
- 변환이 쉽다.
- 대신 쓸때없는 overhead가 생긴다.

이게 가능한 이유는 Fourier transform이라는

어떤 복잡한 모에도

특정 신호를 cos, sin 혹은 complex exponent 등의 특정 frequency에 대응하고 orthogonal function을 basis로 하여 linear combination으로 표현한 것을 Fourier Transfomr이라고 할 수 있음.

거의 모든 신호(영상)은 다양한 주파수의 cos과 sin의 weighted sum으로 나타낼 수 있음. → 이때, 사용된 각각의 주파수의 weight들이 바로 Fourier transform의 결과를 구성함.

어떤 신호던지 cos과 sin으로 나타낼 수 있다.

얘네를 잘 조합하면 거의 모든 신호를 다 나타낼 수 있다.

#### Pulse wave from sin

sin의 w를 계속 올리고 sum을 무한대로 하면 pulse wave로도 표현할 수있다.

#### Ex1,2

Amplitude가 

각각의 cosine의 weight가 점이라고?

#### HF, LF

고주파: 변화가 많은, 진동수가 많은

저주파: 변화가 적은, 진동수가 적은

DC 성분은 항상 존재 (뭔소리야)

#### 여러 Transformation

DCT 드럽게 많이 쓴다.



#### Linearity

Additivity와 Homogeneity를 만족하는 것이다.

-> Principle of superposition

time invariant system

- 영상에서는 Shift invariant system 이라고 함. 왜냐면 시간주파수 성분이 아닌 공간주파수니까



#### PSF point spread function

마스크가 동일하다.

-> 가운데 점이 퍼지는 정도와, 가쪽에서의 점이 퍼지는 정도가 다르다. (왜곡이 일어나서)

퍼지는 PSF를 완벽하게 알고있으면 복원률 100%지면 spatial variant해서 거의 불가능하다.

그래서 우리는 일단 같다고 가정하고 한다?



#### Impulse Response

Impulse가 들어갔을 때 어떻게 되느냐.



- impulse signal이 입력될 경우의 출력을 의미한다.
- Signal과 response를 convolution -> System의 출력 (Linear하고 Shift invariant여야함)
- Impulse response는 시스템을 완벽하게 정의 -> 내가 이 시스템을 알 수 있는 것
  - FIR
  - IIR

#### Convolution을 쓸 수 있는 조건

- Shift invariance
- Linearity

#### Correlation vs Convolution

Correlation은 뒤집지않고 그냥 곱해준다. 

필터가 원점인 경우는 똑같음

