# C++ Standard Template Library

C++ STL는 불리는 이것은 코딩을 하는데 있어서 필요한 Data structure와 Algorithm을 Template 형태로 되어있는 Library다.

-  Python에서 경험했던 외장함수랑 비슷하다고 생각한다. 

  (별다른 Setup없이도 Import하고 사용할 수 있었으니까..)

대표적으로 `iostream`, `chrono`, `regex`같이 여러가지가 있는데, 보통 C++ STL은 아래 3개의 라이브러리를 의마한다고 한다. [여기 참고](https://modoocode.com/223)

- Container
- Iterator
- Algorithm

여기 각각의 라이브러리의 역할을 잘 나타낸 예시가 있다. [여기 참고 (위에랑 똑같음)](https://modoocode.com/223)

> 각 라이브러리의 역할을 쉽게 생각하면 다음과 같이 볼 수 있습니다. 여러분이 우편 배달부가 되어서 편지들을 여러개의 편지함에 넣는다고 생각해봅시다. 편지를 보관하는 각각의 편지함들은 '컨테이너' 라고 생각하시면 됩니다. 그리고, 편지를 보고 원하는 편지함을 찾는 일은 '반복자' 들이 수행하지요. 마지막으로, 만일 편지들을 편지함에 날짜 순서로 정렬하여 넣는 일은 '알고리즘' 이 수행할 것입니다.



이걸 보고 내 나름대로 얘네가 어떻게 돌아가는지 생각해본다면..

> Container안에는 Data가 저장되고, Iterator는 Data를 저장하거나, 찾거나, 변경할 수 있고, Algorithm은 이런 Iterator들을 이용해서 원하는 Task를 수행한다.





## C++ STL의 Components

#### Container

- Object, 즉 Attribute와 Function으로 구성된 Object를 만들어낼 수 있는 틀(Template)이다.
- Class형태로 구현되어있으며, 일종의 자료구조라고 보면 될 것 같다.

Container는 Element를 Control하는 방법, 그리고 메모리에 어떻게 저장되는지에 따라서 나뉘는데,

먼저 Element를 Control하는 방법에 따라서는 다음과 같이 나뉜다.

- Standard Sequence Container
  - 자신만의 `Insert`위치, 순서를 가지는 Container
  - `Insert`되는 순서에 따라 Element의 위치가 결정된다.
- Standard Associative Container
  - 특정한 정렬기준에 의해 자동 정렬되는 Container
  - 삽입순서와 상관없이 위치가 결정된다.

`Standard Sequence Container`의 경우로는 `vector`, `list`와 같은 선형구조를 가진 것들이 있을 거 같고, `Standard Associative Container`의 경우로는 `set`, `map`같은 비선형구조의 것들이 있겠다.

이번에는 메모리에 어떻게 저장되는지에 따라 나뉘는 경우이다.

- Array-based Container
  - Data 여러개가 하나의 메모리 단위에 저장된다.
- Node-based Container
  - Data 하나를 하나의 메모리 단위에 저장한다.

`Array-based Container`의 경우에는 `vector`, `deque`처럼 동적할당이 가능한 것들이 있을 거 같고, (확실X) `Node-based Container`의 경우로는 `list`, `set`같이 선언과 동시에 크기가 고정되는 것들이 있는거 같다.



#### Iterator

- Container에 저장된 Element를 순회하고 접근하는 일반화된 방법을 제공하는게 Iterator다.
- 여러 Operator(*, ++, --, !=, ==, ..)를 통해서 Element에 접근할 수 있다.

STL에서 Container에 저장된 Element의 집합을 Sequence라고 하고, 시작과 끝을 가지고 있다. 여기서 반복자는 순차열의 한 원소를 가리키고 있는 것이다. [여기 참고](https://program-rest-area.tistory.com/98)

STL중 하나인 Vector를 이용한 iterator 예제가 있어서 가져왔다.

```c++
#include<vector>
#include<iostream>
using namespace std;

int main(){
    // 예제용 vector 선언&초기화
    vector<int> v;
    v.push_back(10);
    v.push_back(20);
    v.push_back(30);
    v.push_back(40);
    v.push_back(50);
    // 실제로 보면 v = {10,20,30,40,50};
    
    // iterator 선언&초기화하는 방법
    // begin은 Sequence의 시작을 가리킨다.
    // end는 실제적으로 마지막원소를 가리키는게 아니라 마지막의 다음번원소를 가리킨다. 
    vector<int>::iterator iter=v.begin();
    // Vector는 [] operation이 가능한 Random Access Iterator
    // 실제 출력결과 40
    cout << iter[3] << endl;
    
    // += operation
    iter += 2;
    cout << *iter << endl;
    
    return 0;
}
```

이제 대충 무슨말인지 이해가 간다. `*iter`와 같이 Pointer와 비슷한 개념으로 사용할 수 있고, 여러 Operation을 이용해서 Iterator를 이동시킬 수가 있다. 이때 간단하게 말해서 얼마나 Iterator가 자유롭게 움직일 수 있느냐에 따라서 5가지로 나뉜다.

- Input iterator

  : 현 위치의 원소를 한번만 읽을 수 있는 iterator, 읽기만 가능하고 순방향 이동

- Output iterator

  : 현 위치의 원소를 한번만 쓸 수 있는 iterator, 쓰기만 가능하고 순방향 이동

- Forward iterator

  : 읽기와 쓰기가 모두 가능하고 순방향 이동이 가능한 재할당될 수 있는 iterator

- Bidirectional iterator

  : 읽기와 쓰기가 모두 가능하고, 순방향과 역방향 -> 양방향 이동이 가능한 iterator

- Random access iterator

  : 읽기와 쓰기와 모두 가능하고, 임의접근 가능하고, 양방향 이동 가능하고, Operator와 같이 쓰일 수 있다.

[꾸준희님 블로그](https://eehoeskrap.tistory.com/263)보면 표로 정리가 정말 깔끔하게 되어있어서 옮겨보았다.

|     Iterator 종류      | 읽기 |  접근  | 쓰기 |      증감       |        비교         |
| :--------------------: | :--: | :----: | :--: | :-------------: | :-----------------: |
|     Input iterator     | =*p  |   ->   |  X   |       ++        |        == !=        |
|    Output iterator     |  X   |   X    | *p=  |       ++        |          X          |
|    Forward iterator    | =*p  |   ->   | *p=  |       ++        |        ==,!=        |
| Bidirectional iterator | =*p  |   ->   | *p=  |      ++,--      |        ==,!=        |
| Random access iterator | =*p  | ->, [] | *p=  | ++,--,+,-,+=,-= | ==,!=, <, >, <=, >= |



#### Algorithm

어딜가나 나오는 Algorithm이라는 단어.. 정의를 영어로 써보면

> An algorithm is is a finite sequence of [well-defined](https://en.wikipedia.org/wiki/Well-defined), computer-implementable instructions, typically to solve a class of problems or to perform a computation. -위키백과-

> An algorithm is a step-by-step procedure, which defines a set of instructions to be executed in a certain order to get the desired output. - 

여러 기본 베이스에서 변형된 정의들이 많이 있는데, 결국 Algorithm이라는 건 원하는 결과를 얻기위해 해야하는 일의 순서를 정의한 집합체라고 보면 될것 같다.

C++ STL에서는 어떤 문제를 쉽게 해결할 수 있도록 만들어논 `Algorithm`이라는 Library를 제공하는 것이다.  위에서는 Container에서 Iterator를 가지고 원하는 Task를 수행한다고 했었는데, 여기에 여러 Task를 쉽게 해결하기 위한 Function들이 정의되어 있다. 어떤 Task를 수행할 수 있는지 코드와 함께 살펴보자.

Algorithm 라이브러리에 정의된 Function들은 크게 2가지 형태를 띄고있다.

```c++
// https://modoocode.com/225
// 첫번째 형태
template <typename Iter>
void doSomething(Iter begin, Iter end);

// 두번째 형태
template <typename Iter, typename Pred>
void doSomething(Iter begin, Iter end, Pred pred);
```

차이를 보면, 첫번째 형태의 Function은 Parameter를 begin과 end, 즉 시작점과 끝점을 받고, 두번째 형태의 Function은 시작점과 끝점, 그리고 `pred`라는걸 하나 더 받고있는데, 무슨 역할을 하는지는 모르겠지만 저걸로 뭔가 좀더 특수한 Task를 수행하는것 같다. 정렬, 삭제, 검색, 연산 등을 해결하는 Function을 제공하는 Template이라고 생각하고 넘어가자.

   

#### Function Object

 









