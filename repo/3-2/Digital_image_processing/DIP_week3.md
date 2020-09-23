# DIP week3

## Numpy

python의 데이터구조의 표준이라고 할만한 Library다. Value, list나 tuple을 ndarray 타입으로 만들 수 있으며, Data type에는 여러가지가 있다.

* dtype
  * float64
  * uint8: 영상에서 많이 쓰인다. (gray scale)
  * int8
  * float32

```python
import tensorflow as tf
import numpy as np
print(np.__version__)
print(tf.__version__)
```

Type의 변화를 살펴보자

```python
a = (1,2,3,4)
print(type(a))
a = np.array(a)
print(type(a))
--------#result#--------
<class 'tuple'>
<class 'numpy.ndarray'>
------------------------
print(a.ndim)     #numberof dimension = Rank = axis
print(a.shape)    #데이터의 구조
print(a.itemsize) #bytes
print(a.size)
print(a.dtype)
```



## indexing & slicing

`ndarray`의 element에 접근하는 것은 indexing을 통해 하나하나에 접근하고, slicing을 통해 특정 영역의 element에 접근 가능함.

- list등의 python의 fundamental type들과의 차이는 slicing의 경우에 numpy는 원본을 가리키고 있어서 slicing으로 실제로 원본이 수정되게 됨. (주의 필요.)

```python
v = np.arange(4)
a = v.reshape(2,2)
a
--------#result#--------
array([[0, 1],
       [2, 3]])
------------------------
a[0] = 77
print(v)
print(a)
--------#result#--------
[77 77  2  3]
[[77 77]
 [ 2  3]]
```

원본조심합시다.

```python
a = np.arange(0,10,2)
b = a.reshape((1,5))
print(a.shape)
print(b.shape)
b
--------#result#--------
(5,)
(1, 5)
```

엄밀히 두개는 다르다.

<br>



# Broadcasting

ndarray와 scalar와 연산시킬때, 해당 ndarray와 같은 shape이면서 해당 scalar의 값을 가진 ndarray와 연산시키는 것처럼 자동으로 elementwise연산이 수행되는 기능.

- numpy의 가장 강력한 기능 중 하나.

```python
a = np.ones((5,3))
print(a)
c = a+np.array([3,4,5])
print(c)
--------#result#--------
[[1. 1. 1.]
 [1. 1. 1.]
 [1. 1. 1.]
 [1. 1. 1.]
 [1. 1. 1.]]
[[4. 5. 6.]
 [4. 5. 6.]
 [4. 5. 6.]
 [4. 5. 6.]
 [4. 5. 6.]]
------------------------


b= np.array([3,4,5,6,7])
print(b[:,np.newaxis])
c = a+(b[:,np.newaxis])
print(b[:,np.newaxis].shape)
print(c)
--------#result#--------
[[3]
 [4]
 [5]
 [6]
 [7]]
(5, 1)
[[4. 4. 4.]
 [5. 5. 5.]
 [6. 6. 6.]
 [7. 7. 7.]
 [8. 8. 8.]]
------------------------


c = a+np.array([3,4,5,6,7])
print(c)
--------#result#--------
ValueError: operands could not be broadcast together with shapes (5,3) (5,) 
```

<br>

# 조건에 의한 indexing

True, False로 구성된 ndarray(or mask)를 통한 **특정 ndarray**에 indexing.

```
np.where (조건식, [,True일때 값, False일때 값])
```

- 조건식에 해당(조건식이 True인) 인덱스의 tuple or 조건식의 결과에 따라 변경된 값으로 채워진 `ndarray`를 반환.

```python
mask = np.where(cat_gray>100,1,0)

# gray값이 50보다 낮으면 rgb값을 0으로 만들어버려라
r[cat_gray<50] = (0,0,0)
# 100을 넘은것만 남는 것 같다.
mask3 = np.where(cat_gray>100)

```

<br>

## Member Function

- `np.array(list or tuple)`
- `np.reshape(shape)`
  - shape을 재지정한다.
- `np.zeros(shape)`
  - shape 크기를 가지고 0으로 채워진 `ndarray`를 형성한다.
- `np.ones(shape`)
  - shape 크기를 가지고 1으로 채워진 `ndarray`를 형성한다.

- `np.full(shape, value)`
  - 0,1이 아닌 다른 value로 초기화할 때 사용한다.

- `np.zeros_like(t)`
  - t의 shape과 같은 0으로 채워진 Tensor를 형성한다.

- `np.ones_like(t)`
  - t의 shape과 같은 1으로 채워진 Tensor를 형성한다.

- `np.arange(start, stop, step)`
  - start부터 (stop-1)까지의 값으로 된 1차원 `ndarray`를 생성한다.
- `np.random.rand(shape)`
  - shape의 크기를 가지고 0~1사이 난수로 채워진 `ndarray`를 형성한다.
- `np.random.randn(shape)`
  - shape의 크기를 가지고 평균0, 분산1의 분포를 가지는 난수로 채워진 `ndarray`를 형성한다. (최대한)

- `ndarray.astype('data type')`
  - element의 data type을 변경한다. ('data type' = 'float32' or np.float32 or ...)

- `np.'data type'(ndarray)`
  - element의 data type을 변경한다

- `ndarray.ravel()`
  - 해당 `ndarray`를 모든 element를 1차원으로 쭉 나열하는 `ndarray`로 만든다.

- `ndarray.T`
  - 해당 `ndarray`를 Transpose 시킨다.

- `np.hstack(tup)`
  - horizontal stack - `ndarray`를 옆으로 붙인다.

- `np.vstack(tup)`
  - vertical stack - `ndarray`를 위아래로 붙인다.
- `np.stack()`

- `np.conctenate(tup, axis=?)` 비슷 `np.stack(tup, axis=?)`
  - 축을 지정하여 붙인다.

- `np.hsplit(array, indices_or_sections)`
  - 위아래 방향으로 분리한다. (정수로 안나눠떨어지면 오류나니까 조심하자)
- `np.vsplit(array, indices_or_sections)`
  - 좌우 방향으로 분리한다.

- `np.split()`

- `np.squeeze(array)`
  - gray scale로 만들때 유용할 것 같다.

- `np.where(condition, [x,y] )`
  - 조건식에 해당(조건식이 True인) 인덱스의 tuple or 조건식의 결과에 따라 변경된 값으로 채워진 `ndarray`를 반환한다.
- `np.mean(ndarray, axis)`
  - 축을 기준으로 평균을 구한다.
- `np.max`
- `np.min`

- `np.nonzero(ndarray)`
  - zero가 아닌 성분의 index의 array를 return한다.
- `np.all`
  - 다 참인지여부를 boolean형으로 나타낸다.
- `np.any`
  - 하나다로 참인지 여부를 boolean형으로 나타낸다.



## 빛

사람이 볼 수 있는 일정 범위의 파장을 가진 전자기파라고 한다. 좁은의미에선 볼 수 있는 가시광선을 의미하지만, 넓은 의미에선 모든 종류의 전자기파를 포함한다. 우리는 빛을 통해 색을 표현할 수 있다. 인간은 색을 조명, 물체의 특성, 눈의 특성에 따라 다르게 인지한다. Amplitude에 해당하는건 photon의 수이고, Frequency로 이야기되는건 Energy를 의미한다.



#### Color Space

**Tristimulus values, X,Y,Z와 각각의 color를 연관시키는 수학적 모델을 가르킨다.** 인간은 어쩌구 시스템 vison을 가지는데 RGB를 느끼는 세가지 cone cell이 있고, rod cell도 있는데 색은 구분못하지만 Amplitude를 감지한다. 

완벽한 color space는 존재하지 않아서 응용분야에 따라 적합한 color space가 존재한다.

- RGB
- HSI, HSV, HSL
- YCbCr, YUV
- CMY
- Gray-scale



#### Gray scale

흑과 백만 있는게 아니라 명암의 속성을 가진다. 단일채널에 의해 표현이 된다. intensity(brightness)는 pixel의 value를 의미한다. 루미넌스라고도 하나보다.



#### RGB

Gray scale과 다르게 pixel이 scalar값을 가지는게 아니라 vector값을 가진다. png등의 경우 alpha channel이라는게 존재하는데, 투명한 배경을 위해 존재한다. Background 영역의 pixel은 0인 값을 가진다. 



#### Intensity 추출 공식

- NTSC(National Television Standards Committee) 표준: 명암도(Brightness) = 0.2999R + 0.587G + 0.114B
  - 사람눈을 고려한 계산
- 일반적: 명암도 = 0.333R + 0.333G + 0.333B 





#### HSI, HSV, HSL

HSI는 color에서 색의 밝기(휘도, 명도, 밀도(Luminance, Lightness, Intensity))를 분리시켜 구성된 Color space다.

[(Hue, Saturation), (Intensity)]



- HSV는 밝기는 value로 표현하고, HSL은 Lightness(or Luminance)로 표기한다.

- 계산이 조금씩 차이가 있지만 거의 비슷하다.



#### HSI / HSV의 의미

- Hue (색상)
  - 빛의 파장의 길이에 의해 결정
  - 빨강0도, 초록120도, 파랑240도
  - uint8의 최대가 255여서 0~180도 줄여서 표현함

- Saturation (채도: 색상의 탁하고 맑음의 정도)
  - 채도가 낮을수록 흰색/회색/검정색이 된다.
  - 0~100%로 표현한다. (0~1)
    - opencv의 경우 255가 1에 해당한다.

- V or I: Value or Intensity (명도)
  - 빛의 진폭에 의해 결정
    - 클수록 밝기가 크다.
  - 0~100% (채도랑 마찬가지)'

#### YCbCr, YUV

사람이 색상보다 밝기에 더 민감하게 인식하는 특징을 이용한다.

- 밝기 정보를 하나의 채널로 사용해서 명암처리가 쉽다.

YCbCr: MPEG, JPEG등의 디지털 컬러 정보 인코딩에 이용된다. 

YUV: 아날로그 컬러 인코딩시스템 PAL에서 정의

Y: Luma(밝기)

- 많은 비트수를 할당한다.(4bit)

Cb (or U): Chroma Blue (밝기와 파랑색의 색상차

- 둔감한 부분이니까 2bit만

V: Chroma Red (밝기와 붉은색의 색상차)

- 마찬가지 둔감하니까 2bit만

밝기가 가장 중요하다 이말이야



#### CMY

컬러 프린터 등의 인쇄시스템에서 사용되는 Color space

- Cyan (청록)
- Magenta (자홍)
- Yellow (노랑)

삼원색과 보색관계여서 변환이 쉽다.

CMYK는 K(검은색)을 더한 Color space다. 흑색잉크가 따로 있는 경우를 반영한 Color space다. (검은색을 세개 섞어서 사용하는건 별로 효율적이지 못하기 때문에 일부러 흑색잉크를 추가한 것)

변환공식보면 그냥 RGB를 1.0에서 뺴주면 하나씩 나온다

ex) C = (1.0-R)...