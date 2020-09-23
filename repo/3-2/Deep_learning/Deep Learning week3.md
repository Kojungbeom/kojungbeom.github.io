# Deep Learning week3



#### Keras

라이브러리가 잘 만들어져있는 딥러닝을 위한 Framework다. Backend engine으로 Theano, Tensorflow, CNTK 세개를 전부 사용할 수있어서 확장성이 뛰어나다.



#### 신경망의 구조

- 입력데이터와 그에 상응하는 타깃
- 네트워크를 구성하는 Layer
- Feedback 신호를 정의하는 Loss function
- 학습 진행방식을 결정하는 Optimizer



#### 입력데이터와 그에 상응하는 타겟

```python
from keras.datasets import mnist
(train_images, train_labels), (test_images, test_labels) = mnist.load_data()
```

mnist같은 유명한 데이터셋은 위처럼 쉽게 불러오는게 가능하지만 보통은 좋은 결과를 위해 Preprocessing 해줘야하는 경우가 많다.

일자로 쭉 펴져 들어온 데이터를 reshape하고 type을 설정한다.

```python
train_images = train_images.reshape((60000,28*28))
train_images = train_images.astype('float32') / 255
test_images = test_images.reshape((10000,28*28))
test_images = test_images.astype('float32') / 255
```

to_categorical 함수로 one-hot encoding 시킨다.

```python
from keras.utils import to_categorical
train_labels = to_categorical(train_labels)
test_labels = to_categorical(test_labels)
```

중간중간마다 데이터가 잘 가공되었는지 확인하는 습관을 길러야한다. 여기까지가 입력데이터와 타겟까지를 만들어내는 과정이다.



#### Layer: 딥러닝의 구성단위

Layer는 tensor를 입력으로 받아 tensor를 출력하는 데이터처리 모듈이다. 가충치를 가지고, Layer마다 처리방식이 다르다.

- Vector data: fully connected layer and dense layer

- Time data: Recurrent layer or LSTM

  - 시간에 따른 영향을 줄때 많이 쓰인다.
  - 서로 연관이 되있다고 하면 쓰인다. 

  -> 대표적으로 영상데이터가 있다. 앞뒤위아래 픽셀이 보통 Correlation을 가진다.

- Image data: 2D Convolution Layer

  - 블럭단위로 연산을 한다.영상에서만 사용할 수 있다는데 위에거랑 마찬가지로 서로 연관관계를 가지고 있을때 사용된다고 한다.

레고블럭처럼 사용한다고 생각하면 되고, Keras가 알아서 Layer의 호환성(compatibility)를 조절해주기 떄문에, Keras에서는 Element에 대한 크기(출력)에 대해서만 정의하면 된다.

<br>

#### Model: Layer의 Network

- 입력과 출력의 변환 공간 = 네트워크 구조 = Hypothesis space
- 네트워크 구조를 선택해서 특정 텐서연산으로 제한한다.

앞으로 연습을 하면서 어떤 데이터에는 어떤 모델을 사용하면 좋을지 생각하는 법을 익혀야한다. 사실 정답은 없다. 이론에 맞지않는걸 써도 결과가 더 잘 나올수는 있지만, 세계적으로 많은 사람들이 시도해보고, 거기서 나온 경험들이 모인 것이기 때문에 꽤나 신뢰할만 하다.

``` python
from keras import models
from keras import layers
network = models.Sequential() #순서대로 쌓겠다.
network.add(layers.Dense(512, activation='relu', input_shape=(28*28,)))
network.add(layers.Dense(10, activation='softmax'))
network.summary()
--------------------------------
Model: "sequential"
_________________________________________________________________
Layer (type)                 Output Shape              Param #   
=================================================================
dense_2 (Dense)              (None, 512)               401920    
_________________________________________________________________
dense_3 (Dense)              (None, 10)                5130      
=================================================================
Total params: 407,050
Trainable params: 407,050
Non-trainable params: 0
_________________________________________________________________
```

`network.summary()`로 모델구조와 Parameter가 굉장히 많은것을 볼 수 있다. 진짜 겁나 많다.

<br>

#### Loss function

타겟과 출력을 비교해서 둘의 차이를 최소화하는 단계이다. 매우 중요한 단계여서 Loss function이 주어진 문제에 대한 성공지표가 된다. Loss function에 의해서 그래프의 형태가 바뀌게 되는데, Local minimum에 빠지지않도록 만드는게 정말정말 중요하다. 그래서 여러개의 Loss function을 합쳐서 사용하는 경우도 있다고 한다. 

- Classification (2개 class) -> Binary cross entropy
- Classification (3개이상 class) -> categorical cross entropy
- Regression -> MSE
- Sequence Training -> CTC (Connection Temporal Classification)

<br>

#### Optimizer

Loss function을 기반으로 네트워크가 어떻게 업데이트 될지 결정한다. 특정 종류의 SGD를 구현하고 스칼라 손실값을 기준으로 한다. 일단은 `rmsprop`을 쓰자. 이거쓰면 평타는 친다고한다.

```python
network.compile(optimizer='rmsprop',
                loss = 'categorical_crossentropy',
                metrics = ['accuracy'])
```

metrics란 분류 성능 평가에 사용되는 지표를 정한것이다.

<br>

#### Training

- epochs: 전체 데이터를 써서 업데이트가 한번 끝난 것을 1 epochs
- Batch size: 한번에 들어가는 데이터의 수, weight를 업데이트하는 기본단위

만약 데아터가 60000개 있고 batch size가 10000이라면 batch가 6번 돌아가야 1 epoch인 것이고, epoch가 10이면 update가 총 36번 되는 것이다.

```python
network.fit(train_images, train_labels, epochs=10, batch_size=128)
```





## Binary Classification 예제

- 데이터셋: 영화 리뷰 데이터베이스

단어에 대한 분석을 할 것이기 때문에 서로 연관이 없다고 가정하고 fcn을 사용할 것이다.

주의!

- test,train,validation 데이터로 미리 분리하기

```python
from keras.datasets import imdb
# num_words는 빈번하게 나오는 단어 10000개만 사용하겠다 라는 의미
(train_data, train_labels), (test_data, test_labels) = imdb.load_data(num_words=10000)
```

데이터형이 리스트로 나오니까 하나의 Vector 형태로 만들어주기

```python
import numpy as np
def vectorize_sequences(sequences, dimension=10000):
  results = np.zeros((len(sequences), dimension))
  for i, sequence in enumerate(sequences):
    results[i, sequence] = 1.
  return results

x_train = vectorize_sequences(train_data)
x_test = vectorize_sequences(test_data)

y_train = np.asarray(train_labels).astype('float32')
y_test = np.asarray(test_labels).astype('float32')

x_val = x_train[:10000]
partial_x_train = x_train[10000:]
y_val = y_train[:10000]
partial_y_train = y_train[10000:]
```

같은 길이되도록 padding 추가,  리스트를 one-hot encoding으로 0과 1로 변환

- 훈련 검증 테스트 데이터
  - 검증세트에서 성능을 평가하여 hyperparameter를 선택한다 (Layer수, 유닛 수)
  - Information leak의 개념이 된다.
  - 테스트 데이터는 더이상 수정을 하지 않는 상황에서 마지막으로 하는것이다. 

주의

- Train,test set가 주어진 데이터에 대한 대표성이 있어야한다. (어느 한쪽에 편향된 데이터가 아니라  잘섞여있어야 한다.)
- 시간의 방향: 과거로 미래를 예측하려고 한다면 무작위로 섞어서는 절대안됨
- 데이터 중복: 데이터 포인트가 두번 등장하면 훈련세트와 검증세트의 데이터 포인트가 중복될 수 있다.



Activation function은 데이터에서 불필요한 부분을 잘라버리는 function이다. 그냥 선형관계가 되어버린다면 Deep learning이라고 할 수가 없다. 차원을 계속 바꿔나가면서 원하는 출력값을 만들어낼 수 있는 관계를 만들어준다. 

Hidden unit의 개수가 너무 많아지면 원하지않은 이상한 패턴을 학습할 수도 있다.

```python
from keras import models
from keras import layers

network = models.Sequential()
network.add(layers.Dense(16, activation='relu', input_shape=(10000,))) # 첫레이어에는 input_shape정보가 필요하다.
network.add(layers.Dense(16, activation='relu'))
# 마지막 출력층의 범위는 왜 0<y<1사이로 고정해야하나요? 이거 보다 더 많은게 필요가 없으니까
network.add(layers.Dense(1, activation='sigmoid'))

# optimizer, loss function, metrics을 지정해준다.
network.compile(optimizer='rmsprop',
                loss='binary_crossentropy',
                metrics=['accuracy'])
'''Learning rate 바꾸고 싶으면 아래의 방법으로
network.compile(optimizer=optimizers.RMSprop(lr=0.001),
                loss=binary_crossentropy,
                metrics=[metrics.binary_accuracy])
'''
# 매 epoch마다 loss와 metric값을 history에 넣어준다.
# Train data에 대한 loss, metric, val data에 대한 loss, metric값이 들어간다.
history = network.fit(partial_x_train,
            partial_y_train,
           epochs=20,
           batch_size=512,
           validation_data=(x_val, y_val))
```



#### Validation

```python
import matplotlib.pyplot as plt
history_dict = history.history
loss = history_dict['loss']
val_loss = history_dict['val_loss']
epochs = range(1,len(loss)+1)
plt.plot(epochs, loss, 'bo', label='Training loss')
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Traing and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()
```

```python
plt.clf()
acc = history_dict['accuracy']
val_acc = history_dict['val_accuracy']
plt.plot(epochs, acc, 'bo', label='Training acc')
plt.plot(epochs, val_acc, 'b', label='Validation acc')
plt.title('Traing and validation accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend()
plt.show()
```

이런 History를 보고 Hyperparameter를 바꾸거나 데이터를 전처리하는 방식으로 Validation에도 좋은 결과를 가지도록 최적화시켜야한다. 그리고 최대한으로 하고나서 Training하고 Validation loss의 차이가 오히려 더 나빠지기전에 Training을 Early stop을 시키는 방식이 많이 쓰인다. 그래프를 보니까 Epoch 4쯤에서 멈춰야할 것같다.

```python
from keras import models
from keras import layers

network = models.Sequential()
network.add(layers.Dense(16, activation='relu', input_shape=(10000,))) 
network.add(layers.Dense(16, activation='relu'))
network.add(layers.Dense(1, activation='sigmoid'))

network.compile(optimizer='rmsprop',
                loss='binary_crossentropy',
                metrics=['accuracy'])

network.fit(partial_x_train,
            partial_y_train,
           epochs=4,
           batch_size=512,
           validation_data=(x_val, y_val))
results = network.evaluate(x_test, y_test)
results
```



#### 훈련된 모델로 실제 Prediction 결과 보기

```python
network.predict(x_test)
```



#### 정리

- Dense + relu
- 출력층의 Dense는 sigmoid함수
- 블라블라



## Multiple Classification

reuters dataset으로 진행한다. 46개의 class가 있고 불균일한 분포를 가지고 있다. 

```python
from keras.datasets import reuters # class가 46개인 dataset
(train_data, train_labels), (test_data, test_labels) = reuters.load_data(num_words=10000)

import numpy as np
def vectorize_sequences(sequences, dimension=10000):
  results = np.zeros((len(sequences), dimension))
  for i, sequence in enumerate(sequences):
    results[i, sequence] = 1.
  return results

x_train = vectorize_sequences(train_data)
x_test = vectorize_sequences(test_data)

from keras.utils import to_categorical
y_train = to_categorical(train_labels)
y_test = to_categorical(test_labels)


x_val = x_train[:1000]
partial_x_train = x_train[1000:]
y_val = y_train[:1000]
partial_y_train = y_train[1000:]

from keras import models
from keras import layers

network = models.Sequential()
network.add(layers.Dense(64, activation='relu', input_shape=(10000,))) 
network.add(layers.Dense(64, activation='relu'))
network.add(layers.Dense(46, activation='softmax'))

network.compile(optimizer='rmsprop',
                loss='categorical_crossentropy',
                metrics=['accuracy'])

history = network.fit(partial_x_train,
                      partial_y_train,
                      epochs=20,
                      batch_size=512,
                      validation_data=(x_val, y_val))

import matplotlib.pyplot as plt
history_dict = history.history
loss = history_dict['loss']
val_loss = history_dict['val_loss']
epochs = range(1,len(loss)+1)
plt.plot(epochs, loss, 'bo', label='Training loss')
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Traing and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()
plt.clf()
acc = history_dict['accuracy']
val_acc = history_dict['val_accuracy']
plt.plot(epochs, acc, 'bo', label='Training acc')
plt.axvline(7.5,color='r', linestyle='--')
plt.plot(epochs, val_acc, 'b', label='Validation acc')
plt.title('Traing and validation accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend()
plt.show()
```

<br>

## Regression Example

Classification과 다르게 연속적인 값을 예측한다. 보스턴 주택가격 데이터셋을 가지고 주태가격의 median값을 예측하는 실습을 해볼 것이다. Feature별로 Scale이 달라서 Normalization이 필요하다. 13개의 Feature가 있어서 input이 13개 되는 것이다. 범위가 다를때 발생되는 문제점이 많으니까 한번 알아보기를 추천한다.

```python
from keras.datasets import boston_housing
(train_data, train_labels), (test_data, test_labels) = boston_housing.load_data()
mean= train_data.mean(axis=0)
train_data -= mean
std = train_data.std(axis=0)
train_data /=std
test_data -= mean
test_data /=std
```

- test_data에도 적용하는걸 잊지말라구! 전처리과정은 test data에도 똑같이 적용되어야한다는 규칙!

```python
from keras import models
from keras import layers

def build_model(): # cross validation할거라서
	network = models.Sequential()
	network.add(layers.Dense(64, activation='relu',
                             input_shape=(train_data.shape[1],))) 
	network.add(layers.Dense(64, activation='relu'))
	network.add(layers.Dense(1, activation='softmax'))

	network.compile(optimizer='rmsprop',
                	loss='mse',
                	metrics=['mae'])
```

단순홀드아웃검증할거임

![image-20200917132813042](C:\Users\jungse\AppData\Roaming\Typora\typora-user-images\image-20200917132813042.png)

이렇게 여러개를 해서 얘네를 평균을 내서 최종결과값으로 낸다.

검증의 정확도를 높이는거지 weight의정확도를 높이는게 아니다.