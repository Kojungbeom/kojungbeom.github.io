# C++ STL Vector

c++ 표준라이브러리

-> Standard Template Library (외장함수와 비슷한 느낌)

 Vector는 동적 배열구조 클래스이다. (or Container라고도 부르는것 같다.)

Vector를 생성하면 메모리 heap에 생성하는데,

>  메모리 heap?

메모리의 구조부터 다시 알아보자. [여기 참고](http://tcpschool.com/c/c_memory_structure)

OS는 Program의 실행을 위해 다양한 메모리 공간을 제공하는데, 그 중 대표적인 4가지

1. Code 영역
2. Data 영역
3. Stack 영역
4. Heap 영역

code - data - heap - stack 순서로 되어있는데, 

heap 영역은 Runtime에 크기가 결정되고, stack 영역은 compile time에 크기가 결정된다.

   

> 1. **Code region**

- 실행할 프로그램의 코드가 저장되는 Region으로, Text region으로도 불린다.

- CPU가 Code region에 저장된 Command를 하나씩 가져가서 처리한다.

> 2. **Data region**

- 프로그램의 Global variable하고 Static variable이 저장되는 Region
- 프로그램의 시작과 함께 할당되고, 종료와 함께 소멸한다.

> 3. **Stack region**

- Function의 호출과 관계되는 Local variable과 Parameter가 저장되는 Region
- Function의 호출과 함께 할당되며, 호출이 완료되면 소멸한다.
- Stack region에 저장되는 Function call 정보를 Stackframe이라고 한다. 
  - Data structure에서 봤던 stack을 생각해보면, Stack은 `push` and `pop` 함수로 데이터를 관리했었다.
  - Last-In-First-Out 방식으로 동작했었는데, 그래서 Stack region은 높은 주소에서 낮은 주소 방향으로 할당된다.

> 4. **Heap region**

- 사용자가 직접 관리할 수 있는, 관리 해야만 하는 Region
- Dynamic allocation이 이루어진다.
- 낮은 주소에서 높은 주소 방향으로 할당된다.

   

다시 돌아와서, Vector는 동적 배열구조 클래스이다. 그리고 배열은 정적이라고 볼 수 있겠다.

단어에서 느껴지는 차이를 생각해보면, 크기가 고정되어있지 않다? 즉, 크기를 내 맘대로 필요에 따라 조절할 수 있다!

크기를 조절할 수 있는 Array를 Class로 만들어놨다고 보면 될 것 같은데, 그럼 여기서 만들어지는 장단점은 무엇이 있을까

> **Vector advantage**

- Array가 가지는 대부분의 장점을 다 가지고 있다고 생각하면 된다. 그만큼 Array와 유사하다.
  - Index가 있어서 접근에 용의하다는 점?

> **Vector disadvantage**

- 다량의 데이터가 있을 때, Search가 느리다.
- 중간에 데이터를 Append하거나 Remove하는게 비효율적이다.
  - LinkedList같은 구조가 아닌이상 Array형태의 것들은 대부분 그럴것이다..

결국! 언제 Vector를 사용하기 좋은 상황을 정리해보면,

- 크기 변경이 가능한 Array가 필요할 때,
- 순차적으로 접근할 때
- 랜덤하게 접근할 때
  - 순차적이든 랜덤하게든 둘다 좋은 이유는 Index로 접근이 가능하기 때문이다!



## Vector Container Usage

```c++
#include<vector>
```

- Python 외장함수와 유사하게 include(Python에서는 import)를 해줘야 사용할 수 있다.

```c++
# Empty Vector 생성
# vector<Data_type> variable_name;
vector<int> v1;
vector<char> v2;
vector<float> v3;
vector<string> v4;
vector<double> v5;

# declaration과 initialize를 동시에
# vector<Data_type> variable_name(size);
vector<int> v6(10);
```

- Array 선언의 기본형인  `Data_type array_name[array_size];`과 다른거 보이지
- 아래와 같은 형식으로 선언하게 되면 default값으로 공간이 채워져있는 채로 생성된다.
  - Default값은 아마도 0..?

```c++
# Parameter를 하나 더 추가해서 원하는 value로 initialization하는 방법
# vector<Data_type> variable_name(size, value)
vector<int> v7(10,5);
```

- 이와 같이 Parameter를 주게되면 size size의 Vector가 선언과 동시에 value로 채워져 초기화된다.

```c++
# 중괄호를 이용한 declaration & initialization
vector<int> v8 = {1,2,3};
vector<int> v9{1,2,3};
```

- Brace(중괄호)를 이용하는 방법
  - 대중적인 방식이지

```c++
# Push_back function 사용하는 법
# 뒤에 추가하는 Append와 흡사한 방식
v9.push_back(value);

# 그럼 Remove는?
```

Copy의 경우는 Array와 비슷하게

- Iteration
- Assignment operator
- 복사 연산자

위 방법들을 통해 Copy 할 수 있고, Comparison operator로 비교하는 것도 가능하다.



오늘은 여기까지

