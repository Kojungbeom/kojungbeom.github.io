# VAE를 활용한 NLG 성능을 향상시켜보자

우리는 이전에 VAE를 이용해서 NLG를 했다. 그떄는 Bidirectional lstm encoder와 lstm decoder를 가진 VAE based sentence generation model을 만들었는데, 생각보다 성능이 굉장히 안좋았다. 어떻게하면 성능을 향상시킬 수 있을까 생각해보다가 마냥 하이퍼파라미터 바꾸는건 많이 해봤으니까, 데이터셋이나 모델 자체를 바꿔보는건 어떨까 생각했다. 2017년에 Google brain에서 Transformer라는 새로운 모델구조를 소개했는데, 이걸로 원래 모델을 대체하면 성능이 어떨까 궁금해져서 Transformer를 활용하기 전에 먼저 Background 공부를 시작하기로 했다. 

[딥러닝을 이용한 자연어 처리 입문](https://wikidocs.net/24996)이라고 하는 좋은 웹북이 있어서 이걸로 전반적인 내용을 파악한 뒤 직접 Transformer를 구현해보는 것이 목표이다.

지금 하고있는 프로젝트가 있기 때문에 많은 시간을 쏟기는 어렵겠지만, 최대한 빨리해서 깃허브에 업로드해서 별을 받고 싶다.

<br>

## Feed Forward Neural Network Language Model

Neural Network Language Model (NNLM)의 시초다.

<br>

#### 기존 언어모델의 한계

기존의 n-gram 언어모델에 한계가 있었다고 한다.

- 바로 앞의 단어만 참고하고 더 앞에 있는 단어들은 무시한다는 것

- 모든 경우에 대해서 잘 모델링되지는 않았다는 것, 빈도수가 적다면 Sparsity problem이 발생!

Sparsity problem이 왜 일어나는지 예시를 들어 살펴보자.

n-gram language model은 어떤 단어가 어떤 단어 뒤에 나타나는 등장 확률을 가지고 있는 model이다. 등장확률은 다음과 같은 방식으로 계산된다. (극단적인 예를 들었다.)

- "양진우는"이라는 케이스가 1000번 나왔다.
- "양진우는 남자"라는 케이스가 10번 나왔다.
- "양진우는 여자"라는 케이스가 900번 나왔다.

이렇다면 이 Language model은 "양진우는"이라는 시퀀스가 들어왔다면 0.9의 확률로 "여자"라고 예측하게 된다. 근데 사실 알고보니 "양진우"가 사람이 아니라 강아지였다고 했을 떄, "양진우는 강아지"라는 경우는 없었기 떄문에 Language model이 "양진우는" 다음에 "강아지"가 나온다고 예측하지 못할 것이다. 이런식으로 Sparsity problem이 나타난다.

<br>

#### 단어의 유사성 (메인 아이디어)

Sparsity problem은 기계가 유사도를 고려하도록 한습한다면 해결할 수 있는 문제가 된다. 적어도 "강아지"라고 예측할 확률이 0%는 아닐 것이다. (이해를 제대로 한건지는 모르겠다.) 이런 아이디어를 가지고 탄생한게 바로 NNLM이라고 한다. 그리고 마찬가지로 Word embedding도 이 아이디어로 시작이 되었다고 한다.

<br>

#### NNLM이 학습하는 과정

7단어로 이루어진 Sentence data를 오직 7개의 단어에 대해서만 트레이닝한다고 했을 때, 각각의 단어를 one-hot encoding으로 나타낼 수 있다.

n-gram model과 유사하게 다음 단어를 예측할 때, 앞의 모든 단어가 아닌 정해진 n개의 단어만을 참고한다. (Window) 

Input으로 들어온 단어는 Projection layer에서 weight들과 곱해지게 되는데 이때 weight들을 matrix로 나타내면 7단어에 대한 각각의 weight가 있을 것이고, 또 그것을 유저가 원하는 n차원으로 나타내기 때문에, 이 Matrix는 7x m Matrix가 된다. One-hot encoding은 해당 단어의 index에서만 1이고 나머지 요소는 전부 0인 vector로 단어를 변환하는 것인데, 이것이 7xm Matrix와 행렬곱이 이루어진다면, 행렬의 특정부분을 그대로 가져오는 것과 같다. 다르게 이야기하면 integer 0과 1로 구성되어있던 것을 m차원의 벡터로 매핑한 것이다. 이때 만들어진 Matrix를 Look-up Table이라고 하고, 단어에 해당하는 m차원의 벡터를 Embedding vector라고 한다.

<br>

#### NNLM의 이점과 한계

**이점**

- One-hot encoding과 다르게 Float으로 단어의 유사도를 표현하게 되는데 이를 Dense vector라고 한다. 이렇게 Sparsity problem을 해결할 수 있다.

**한계**

- 여전히 이전단어를 전부 참고하는 것이 아니라 특정 Window에 속한 단어만을 참고한다.

  -> 문맥 정보는 참고 못하고 있다.



## Recurrent Neural Network (RNN)

등장한 배경은 다음과 같다.

> Feed forward 신경망은 입력의 길이가 고정되어있다는 한계가 있었다. 그래서 다양한 길이의 Sequence data를 처리할 수 있는 Neural Network이 등장했다. 그게 바로 RNN이다.

입력의 길이가 고정되어있다는게 빈칸은 반영할 수 없다는 건가? 뭐 그런거 같다.

RNN의 정의를 다시 정리하면,

> 입력과 출력을 Sequence 단위로 처리하는 Model

앞에서 봤던 NNLM은 전부 은닉층에서 활성화 함수를 지난 값은 오직 출력층 방향으로만 향했다. 하지만 RNN은 이와 다르게 활성화 함수를 통해 나온 결과값이 출력층 방향으로도 가지만, 다시 은닉층으로 보내져 다음계산의 입력으로 보내진다. (바로 이전 시점(timestep)에서의 은닉층에서 나온 값을 입력으로 사용하는 재귀적인 활동을 한다.) 

현재를 t라고 했을 때, 현재 상태 계산을 위한 입력값으로 (t-1)도 활용이 된다는 것이다.

RNN은 입력과 출력의 길이를 다르게 설계할 수 있어서 다양한 형태로 다양한 용도로 활용이 된다.

![img](https://wikidocs.net/images/page/22886/rnn_image3.5.PNG)

![img](https://wikidocs.net/images/page/22886/rnn_image3.7.PNG)

#### Bidirectional Recurrent Neural Network

t에서의 출력값을 예측할 때, 앞에서의 데이터뿐만 아니라 t보다 이후에 나온 데이터로도 t를 예측할 수 있다는 아이디어를 기반한다. 되게 재미있는 아이디어이면서 직관적으로도 이해가 잘되면서 성능도 그만큼 나오는 굿 아이디어다.



---

사실 여기서부터 Background 시작하려고 했는데, 읽다보니 모르는게 너무 많아서 위에 내용이 계속 추가되었다. 끝날 때 쯤에는 얼마나 더 추가되어 있을지..

## Seq2Seq Model

> 입력된 시퀀스로부터 다른 도메인의 시퀀스를 출력하는 모델

<br>

#### 사용분야

- Chatbot
- Machine Translation

- Text Summarization
- Speech to Text

<br>

#### 구조

![img](https://wikidocs.net/images/page/24996/%EC%9D%B8%EC%BD%94%EB%8D%94%EB%94%94%EC%BD%94%EB%8D%94%EB%AA%A8%EB%8D%B8.PNG)

크게 Encoder와 Decoder로 구성된다.

- Encoder는 Input sentence를 받아 정보를 압축하여 하나의 벡터로 구성
- Decoder는 구성된 벡터를 받아 순차적으로 문장을 생성

Encoder와 Decoder는 LSTM이나 GRU와 같은 RNN 셀로 구성된다.

Decoder는 기본적으로 RNNLM이다. 무슨말이냐면 t의 출력을 구할 때 t-1에서의 출력값이 t에서의 입력으로 같이 입력된다는 것을 의미한다. 이 부분을 확대하면 아래와 같다.

![img](https://wikidocs.net/images/page/24996/decodernextwordprediction.PNG)

여러가지 단어가 자기를 뽑아달라고 소리치고있을텐데 우리가 필요한건 가장 그럴듯한 단어이다. 소프트맥스 함수로 단어별 확률값을 반환하여, 가장 확률이 높은 단어를 선출하여 위치시킨다.

<br>

## Attention Mechanism

 AI 분야에서 대세 모듈로서 사용되고 있는 트랜스포머의 기반이 되는 어텐션 메커니즘! 

seq2seq가 가진 문제점을 보완할 수 있는 기법이다. 문제점은 다음과 같다.

- Vanishing gradient

- 고정된 크기의 Context vector에 모든 정보를 압축하려하니 당연히 손실이 발생한다.

  -> Input Sequence의 길이가 길어지면 더 정확도가 떨어질 것이다.

<br>

#### Attention Mechanism의 아이디어

Decoder에서 출력을 예측하는 time step마다, Encoder에서 전체 입력을 다시 한번 참고한다. 근데 여기서 포인트, 전체 문장을 전부 다 중요하다고 생각해서 참고하는게 아니라, 해당 time step에서 예측해야할 단어와 연관이 있는 입력 부분을 좀더 Attention해서 보는 것이다.

- 어떤 Task냐에 따라 조금씩 다르긴 하겠지만, 영어 문법을 처음에 배울 때 단어의 위치를 형식에 맞게 배치하고 이런 것들과 조금 유사한 느낌이 든다. 사람이 실제 언어를 배울 때 고려하는 것들을 기계에서도 고려할 수 있도록 한 것 같아서 되게 재밌다. 실제로 성능까지 향상되었다니 신기하다.

<br>

#### Attention Function

![img](https://wikidocs.net/images/page/22893/%EC%BF%BC%EB%A6%AC.PNG)

그림으로 한방에 이해하는게 편하다. 

- Query는 어떤 단어
- Key 1,2,3는 어떤 단어 
- Value 1,2,3은 각각 Query와 Key 사이의 유사도 

여기서 나온 유사도들을 모두 더한 값을 Attention Value라고 한다. (t번째 단어를 예측하기 위한 Attention value를 $ a_t $라고 표현)

<br>

#### Attention Score

쉽게 이야기하면, 위에서 Attention value는 모든 유사도를 더한값이라고 했다면, Attention score는 각각의 유사도를 나타낸다. (내적)

이 값들을 가지고 Softmax 함수를 사용해서 Attention DIstribution을 구할 수 있다. Attention score들의 set에 softmax를 취하면 합이 1인 확률분포로 만들 수 있다. 이것을 Attention Distribution이라고 한다. 그리고 각각의 값들을 Attention Weight라고 부른다.

예시를 들어보자. 만약 Encoder에서 입력으로 "I am a good software engineer"가 들어왔다고 했을 때, Decoder는 어떻게 동작하는걸까?

- 입력: "I am a good software engineer"

Decoder에는 t의 출력값을 구할 때, 입력값이 한개가 아닌 두개를 사용했던걸 기억할 것이다.

- t-1의 hidden state
- t-1의 출력값

Attention Mechanism은 



