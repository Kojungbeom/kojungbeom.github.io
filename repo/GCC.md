이 글은 내가 편하게 보겠다고 만든 요약본입니다. [본문 링크](http://doc.kldp.org/KoreanDoc/html/gcc_and_make/gcc_and_make-1.html)

# 1. *gcc*

세상에서 가장 뛰어난 C compiler 중 하나이다. C언어는 컴퓨터 세상의 만국공통어이고, `gcc`는 리눅스와 일심동체라고 봐도 무방하다고 한다. ([여기](http://doc.kldp.org/KoreanDoc/html/gcc_and_make/gcc_and_make-1.html)서 그랬음..) 저 링크에서 보면 도스/윈도우 환경에서 배운 C가 엉터리라고 하는데, 요즘 `Ubuntu`환경에서 C++ 프로그래밍을 하다보면 진짜 맞는거 같다. 도스/윈도우 환경에서 했던거는 하기 쉽게 잘 만들어놔서 코드말고는 신경쓸게 없었다면, 리눅스 환경에서 하려면 `Compile`과정에 대한 이해도 필요하기 때문이다. 지금까지 C는 할 줄 안다고 생각했던게 좀 부끄러워진다. 하지만 이제부터 잘하면 될 일, C의 " 정통사용법"에 대해서 익혀보자.

> gcc = 1종 보통 수동 스틱방식, 정통 소림권법, 3대째 내려오는 비법 떡갈비집

   
<br>

# 2. *gcc* 에 대한 기본 이해

```
$ gcc -version
```

- gcc version 출력하기

*gcc* 나도 처음에는 그냥 패키지로 깔 필요도 없이 먼저 깔려있었던 거 같은데, 소스코드로 부터 설치해보면 구조를 파악할 수 있다니 한번 따라가보자.

```
/usr/lib/gcc-lib/xxxx/xxxx/cc1
/usr/lib/gcc-lib/xxxx/xxxx/cpp
/usr/lib/gcc-lib/xxxx/xxxx/include/*.h
/usr/lib/gcc-lib/xxxx/xxxx/libgcc.a
/usr/lib/gcc-lib/xxxx/xxxx/specs
```

폴더안을 살펴보면 이러한 구조로 되어있는데, `cc1`이 C compiler의 본체라고 한다.

-  C++ compiler는 `cc1plus`, Objective C compiler는 `cc1obj`

아무것도 안해보고 구조를 보면 봐도 뭔지 모를텐데, (사실 지금도 모른다.) *gcc*는 C랑 C++ 코드를 구분하고 `Link` 작업도 하고, 소스를 만들고 하는 선행되어야하는 것들을 해주는 녀석이다.

   
<br>
## *gcc* 사용하기

역시 시작은 `Hello, World.`인가보다.

```c++
// hello.c
#include <stdio.h>

int
main ( void )
{
  printf("Hello, World.");
  return 0;
}
```

```
$ gcc hello.c 
```

이렇게 입력하고, 아무 메세지도 안나오면 성공이다. 대신, 해당 폴더에 `hello`라는 파일 하나가 만들어져 있을 것이다. 아래와 같이 입력하면 터미널에 Hello, World가 출력될 것이다.

```
$ ./hello
```

<br>

### -o 옵션

*gcc*에는 여러가지 옵션들이 많이 있다. `-o`옵션은 Output 파일명을 정하는 옵션이다.

```
$ gcc -o <원하는 파일명> <코드 파일명>
$ gcc <코드 파일명> -o <원하는 파일명>
```

위에 처럼 해주면 내가 지정한 파일명으로 실행파일이 만들어 질 것이다. (위 두개 방법중 선택하면 된다.)




<br>
### -c  옵션

오로지 Compile 작업만 하고 싶은 경우에 사용한다.

```
$ gcc -c hello.c
```

이때 만들어지는 파일은 `.o`확장자가 붙어서 `Object file`, 즉 목적파일 이라고 부른다. (`hello.o`) 나중에 코드가 많아지고 복잡해지면, 여러개로 나누어서 모듈화를 잘해서 프로그램을 만들게 되는데, 이때 이 많은 코드들 중에서 하나에서만 main 함수를 가져야한다.

```
$ gcc -o baz foo.c bar.c
$ gcc -c foo.c & gcc -c bar.c
$ gcc -c foo.c bar.c
$ gcc -o baz foo.o bar.o
```

위와 같이 여러가지 방식으로 만들 수 있다. 여기서 잠깐 `.o`파일이 무엇인지 집고 넘어가자. C언어가 실행파일을 만들어내는 과정을 생각해보면, `.c`파일을 `.o`파일로 만들고, `.o`파일을 실행파일로 만든다.  이때, `.c`파일이 `.o`파일로 만드는 과정이 Compile 과정이고, `.o`파일을 실행파일로 만드는 과정을 Link라고 한다. 이때 Compile 과정은 *gcc*에서 `cc1`이 담당하는 일이고, Link 과정은 ld라는 `Linker`가 담당한다. 즉! *gcc*란 Compiler와 Linker를 관리하는 외부업체라고 보면 될 것 같다.

   
<br>
### -l 옵션

\#include 문장에서 지정한 Header file이 들어있는 곳을 정하는 옵션이다. (보기만 해도 중요하고 자주 사용하게 될 것 같다.)  `<>`를 쓴 경우는 시스템표준 헤더가 있는 곳을 기준으로 파일을 찾는다. `""`를 쓰는 경우는 현재 디렉토리를 기준으로 Header file을 찾는다. 예를 들어 살펴보자.

```
$ gcc -c myprog1.c -I..
$ gcc -c myprog1.c -Iinclude
```

- 위에꺼는 헤더파일이 (..), 즉 하위폴더에 있다는 의미
- 아래꺼는 include라는 폴더에 있다는 의미

여러번 쓸 수 있고, 순서대로 Header file을 찾는다고 한다. 주의해야 할 것은 폴더명은 `-l`다음에 띄어쓰기를 하지 않고 바로 써줘야 한다.

   
<br>
### -l 옵션과 -L 옵션

라이브러리가 뭔지 집고 넘어가자. 지금까지는 그냥 단순하게 함수 창고라고 생각하고 구성이 어떤지는 생각안해봤으니까 이번에 해봐야지. Library file의 확장자는 `.a`이다. `Archive`라는 의미일 것으로 추측된다. 이런 Library file은 `.o`확장자를 가진 Object file들을 모아서 관리하는 도서관이라고 할 수 있다. 단순히 모아논게 아니라 체계적으로 정리를 해놨기 때문이다. 프로그래밍에 있어서 뭔가 정리가 되어있고, 순서가 있다면 빠짐없이 나오는 `index`를 이용해서 정리되어있다. 어떤 Library file이 있다면, 그 안에 어떤 Object file들이 있는지 아래의 명령어로 알 수가 있다.

```
$ ar t libc.a
```

이제는 Library file을 만드는 방법을 마찬가지로 예시를 들어서 이해해보자. 그전에 다시한번 좋은 글을 써주신 [이 글](http://doc.kldp.org/KoreanDoc/html/gcc_and_make/gcc_and_make-2.html) 저자분께 감사합니다.

```c
// myfunc.h
extern void say_hello ( void );
```

```c
// myfunc.c
#include <stdio.h>
#include "myfunc.h"

void 
say_hello ( void )
{
  printf ( "Hello, Linux guys!\n" );
}
```

```c
// hello.c
#include "myfunc.h"

int
main ( void )
{
  say_hello ();
  return 0;
}
```

```
$ gcc -c myfunc.c
$ ar r libmylib.a myfunc.o // r옵션: 새로운 object file이면 추가, 있던거면 치환
$ ar s libmylib.a // Archive index를 생성
$ ar t libmylib.a // Archive에 있는 file list를 출력
myfunc.o
$ gcc -o say_linux hello.c -lmylib
```

일단 이렇게하면 실패한다. 아래서 어떻게해야 할지 방법을 찾아보자. *ar* 명령어 관련 내용은 [여기](https://devanix.tistory.com/195)

   
<br>
#### -l 옵션

이 녀석은 위에서는 Header file 경로를 나타내는 용도로 사용했었는데, Link할 Library를 명시해주는 용도로도 쓰인다. 마찬가지로 띄어쓰기 없이 바짝 붙여서 사용한다. 위에서 우리가 `libmylib.a`라는 파일을 만들어놨는데, `-l` 옵션하고 같이 사용할 때는 보면 `-lmylib`처럼 `lib`와 `.a`를 떼고 명시해준다.

   
<br>
#### -L 옵션

`-L`과 `-l`의 다른점을 보면, `-l`은 Link할 라이브러리를 명시하는 거라면, `-L`은 라이브러리의 위치를 정해주는 옵션이다. Linker에게 라이브러리 위치를 알려주는 역할을 한다. 

```
$ gcc -o say_linux hello.c -lmylib -L.<디렉토리 경로>
$ gcc -o say_linux hello.c -lmylib -L. // 현재 디렉토리에서 찾아라
```

이렇게 두 옵션을 사용하면 성공적으로 컴파일 될 것이다.

   
<br>
# 3. Make

위에서 *gcc*를 이용해서 소스코드를 컴파일하고, Link하고, 실행파일로 만드는 법을 알아봤다. 하지만 프로젝트가 커지게되면 소스코드를 엄청나게 많아지게 되는데, 이럴때마다 *gcc*로 노가다 뛰는 것은 별로 하고싶지 않을 것이다. 그래서 이런 과정을 효율적으로 관리하기 위해 `Makefile`이라는 형식을 사용한다. `Opencv` install 할 때도 그렇고, Darknet setup할 때도 그렇고, `make`명령을 사용했던 기억이 있는데, 이 명령이`Makefile`에서 내용을 읽어와서 Object file을 만들어내는 것 이다.

하여튼 결국에 이 `Makefile`은 효율적이고 일관성있게 코드들을 관리하기 위해서 사용하는 만큼 그 안에 여러가지 규칙들이 있는데, 이런 규칙들을 잘 따라서 작성하는게 중요하다.

역시 또 예시를 들어서 `Makefile`을 어떻게 만들어야 하는지 알아보자. (아래 명령어들은 Terminal에서의 make 명령어 종류들이다.)

```
$ make config           /* 설정 작업을 한다 */
$ make dep              /* 화일 의존성을 검사한다 */
$ make clean            /* 만든 화일들을 지우고 깨긋한 상태로 만든다 */
$ make zImage           /* zImage(압축커널)를 만든다 */
$ make zlilo            /* 커널을 만들고 LILO를 설정한다 */
$ make bzImage          /* bzImage(비대압축커널)를 만든다 */
$ make modules          /* 커널 모듈을 만든다 */
$ make modules_install  /* 커널 모듈을 인스톨한다 */
$ make
$ make all
$ make install
```

   
<br>
## Makefile 작성

```
$ gcc -o foo foo.c bar.c
```

이 명령어를 치면 무슨 일이 일어나는지 이제는 안다. `foo.c`랑 `bar.c`로 `foo`라는 Object file을 만드는 것 이다. 이걸 이제 `Makefile`로 옮겨 작성해보자.

```
목표:	   목표를 만드는데 필요한 것들
		목표를 달성하기 위한 명령 1
		목표를 달성하기 위한 명령 2
=================================
foo:	foo.o bar.o
		gcc -o foo foo.o bar.o
foo.o:	foo.c
		gcc -c foo.c
bar.o: 	bar.c
		gcc -c bar.c
```

이런 규칙에 따라서 작성을 해야하고, 실수가 있으면 안된다.

- 각 요소 구분은 콤마가 아니라 띄어쓰기로 한다.
- 다음 줄로 넘어가서는 <Tab>키를 눌러야한다. (스페이스나 다른 키는 사용하면 안된다.)
  - 명령에 해당하는 줄은 <Tab>키로 시작해야한다. 매우 중요!

근데 순서를 보면 신기하게도 역순으로 진행되는 꼴이라는 걸 알 수 있다.  `Makefile`에서는 사실 이미 있는걸 다시 만들 필요가 없는 구조로 작동하는 것이다. (변화가 있는 파일은 똑똑하게도 `Makefile`이 알아서 갱신한다.) 

```
// 첫번째 make 명령어
$ make
gcc -c foo.c
gcc -c bar.c
gcc -o foo foo.o bar.o

// foo.c를 고치고 다시 make 명령어
$ make
gcc -c foo.c
gcc -o foo foo.o bar.o
```

`foo`를 만들기 위해서는 `foo.o`, `bar.o`가 필요한데, 그럼 `foo.o`는 `foo.c`를 가지고 `gcc -c foo.c`를 해야하고, `bar.o`는 `bar.c`를 가지고 `gcc -c bar.c`를 해야하고 이런식으로 되는 것이다.

   
<br>
## `make clean`

만약 깔끔하게 코드빼고 다 지우고 싶다면 `make clean`명령을 사용하면 된다. 그리고 이게 정상적으로 작동하기 위해서는 `Makefile`에 명령을 더 추가해줘야한다.

```
clean:
		rm-f foo foo.o bar.o
```

추가해주고 Terminal에서 `make clean`명령을 해주면 다음과 같은 결과가 나온다.

```
$ make clean
rm -f foo foo.o bar.o
$ make
gcc -c foo.c
gcc -c bar.c
gcc -o foo foo.o bar.o
```

   
<br>
## `make all`

`make all` 명령만 입력하면 깔끔하게 모든 파일 전부 컴파일하도록 만든다. 가장 맨 윗줄에 다음을 추가한다.

```
all: foo
```

```
$ make all
gcc -c foo.c
gcc -c bar.c
gcc -o foo foo.o bar.o
```

일반적으로 사람들이 이렇게 많이 하고, 직관적이니까 편의를 위해 이렇게 만들어주는 것도 고려하자.

   


<br>
## 꼬리말 규칙, 패턴 규칙

`Makefile`에 보면 다음과 같은 표현을 자주 볼 것 이다. (아직 안 뜯어봐서 잘 모르겠지만..)

```
.c.o:
		gcc -c ${CFLAGS} $<
```

여기서 `.c.o`의 의미는 "`.c`를 입력 파일로 받고, `.o`파일로 만든다."라는 의미를 가지고 있다. `$<`는 redirection을 의미한다고 하는데, 뭔지는 잘 모르겠지만 `.c.o` 에서 `.c`부분을 의미하게 되는 것 이다.

   
<br>
## GNU make 확장 기능

위에 꼬리말, 패턴 규칙보다 더 논리적인 확장 문법이다.

```
%.o: %.c
        gcc -c -o $@ ${CFLAGS} $<
```

`:`의 오른쪽이 입력파일(`.c`), 왼쪽이 Object file(`.o`)이 된다. 파일명 대신 `%`기호를 사용하는데, 예를들어 `foo.c`라는 입력파일이 들어오면 `%`가 `foo`를 나타내는 식으로 작동하게 된다.

 기호를 정리하면 다음과 같다.  (감사합니다. [링크](http://doc.kldp.org/KoreanDoc/html/gcc_and_make/gcc_and_make-3.html))

```
 $<     입력 화일을 의미합니다. 콜론의 오른쪽에 오는 패턴을 치환합니다.
 $@     출력 화일을 의미합니다. 콜론의 왼쪽에 오는 패턴을 치환합니다.
 $*     입력 화일에서 꼬리말(.c, .s 등)을 떼넨 화일명을 나타냅니다.
```


<br>
## Macro

일단 Macro에 대해 간단하게 이야기하면, 변수화한다고 생각하면 될 것 같다. (상수화 일수도 있는데 조금 헷갈린다.) 예를 들면 다음과 같다.

```
ROOT = /usr/local
HEADERS = $(ROOT)/include
SOURCES = $(ROOT)/src
```

그럼 앞에서 나온 `${CFLAGS}`는 뭘 의미하고 있는걸까? 써있는 그대로 Flag와 비슷한거 같은데, 설정값이라고 보면 될 것 같다. Terminal에서 해당 설정값을 make할 때 넘겨주고 그것을 받아 처리하는 방식이라고 생각하고 넘어가자. (유닉스 쉘에서 `{}`은 변수값을 알아낼 때 쓰는 표현이라고 한다. 이것도 알고 넘어가자.)

   

   
<br>
# 마무리

일단 여기까지가  *gcc*와 Makefile에 대한 내용이었고, 다른 내용들도 훨씬 많다고 하니 필요할 경우 찾아보며 진행하면 될 것 같다. [본문](http://doc.kldp.org/KoreanDoc/html/gcc_and_make/gcc_and_make-3.html)에는 마지막 부분에 주의사항이 있으니 한번씩 읽어보고, 이정도면 일단은 될 것 같다.
