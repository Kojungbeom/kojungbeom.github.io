# Google File System

==**구글 파일 시스템**==

저자 : Sanjay Ghemawat, Howard Gobioff, and Shun-Tak Leung   

## Abstract

 Google에서 만든 GFS는 Scalable distributed file system이다.

기존에 있던 DFS를 Google의 workload와 technological environment에 맞게 만들었다.

   

## 1. Introduction

 Google File System에는 중요한 Concept 몇가지가 있다.

1. 기계고장은 당연히 일어난다.
   
   - Fault tolerence가 있어야 한다.
2. 파일은 엄청 크고, Client도 많다.
3. 파일들은 대부분 Appending 방식으로 이루어진다.
4. Application과 File system API를 같이 디자인하면, 전체적인 시스템의 유연성 향상에 도움이 된다.

   

## 2. Desgin Overview

 몇가지 가정을 해놓고 GFS를 Design했다.

-> Google의 needs에 충족하도록 하기위해서!

- 기계고장은 당연하게 일어나니까, 자기 스스로 회복할 수 있어야 한다.
- 데이터가 매우 크기 때문에, 큰 데이터를 효율적으로 처리할 수 있어야 한다..
- 주로 Large streaming reads와 small random reads를 한다.(write도)
- 여러 Client가 동시에 작업해도 잘 작동해야 한다.
- 높고 지속적인 Bandwidth가 Low latency보다 중요하다.

   

### 2.2 Interface

- GFS는 POSIX같은 Standard API를 안쓰고도 친숙한 Interface를 제공한다.

- File들은 계층적으로 조직화되어있고, Path_name에 의해 식별된다.

- 기본적으로 create, delete, open, close, read, and write operation이 제공된다.(Snapshot 하고 Record Append 도 있다)

   

### 2.3 Architecture

- Single Master와 Multiple Chunkserver가 Multiple client에게 access된다.

- File들은 **Chunk**라고 하는 고정된 크기를 가지고 있는 단위로 나눠진다.
  - Chunk들은 64bit 짜리 **Chunk handle**로 식별된다.(**Chunk handle은 unique하고, 바꿀수도 없다.**)

  - Chunk의 Replica들은 Chunk server들에 저장된다.(Replication level에 따라서 사본의 개수가 달라진다)

- Master는 모든 **metadata**를 가지고있다.(namespace, mapping from files to chunk)

- Master는 Chunkserver의 상태를 **HeartBeat message**를 통해서 파악한다.

- **Client는 오직 metadata에 대해서만 Master와 소통하고, 나머지는 Chunkserver와 이야기하도록 설계했다.**



### 2.4 Single Master

 Single Master여서 디자인이 간단해지고, Chunk의 배치도 정교하게 할 수 있었다고 한다. 그러나, Single Master여서 [Bottle neck]() 현상이 일어나지 않도록 **Master의 일을 최소화해야한다.** 그래서! Client가 Metadata에 대해서 말고는 전부 Chunkserver와 처리하도록 한 것이다.

[그림]

①에서 index는 Application을 통해서 얻음.

②에서 Client는 Master에게서 받은 정보를 File name과 Chunk index를 key로 하여 cache.

③에서 Client는 가장 가까운 Chunkserver에 요청을 보낸다..



### 2.5 Metadata

크게 3가지가 있다.

1. Chunk namespaces
2. The mapping from files to chunks
3. The locations of each chunk's replicas

1,2는 Master의 Local disk나 Remote machine들에 저장해놓고 항상 유지된다.

3은 Master가 Start하거나, Chunkserver가 Cluster에 Join할 때 받아와서 사용한다..



### 2.6.1 In-Memory Data Structures

 **Metadata가 Memory에 저장되있어서 빠르다.**

또한 쉽고, 효율적으로 Background에서 Chunkserver들의 State을 Scan 가능하다.

주기적인 Scan으로 

- Chunk garbage collection
- Re-replication
- Disk space를 Balance 있게 유지하기 위해서 Chunk migration

위와 같은 임무를 수행한다. 이러한 구조에서 한가지 걱정되는것은, 데이터는 계속해서 커지는데, 그에 따라서 Metadata도 엄청나게 커질 수 있다는 것. 하지만 일단 이것은 그다지 큰 문제가 되지 않기 때문에, 미래의 숙제로 남겨두겠다.



### 2.6.2 Chunk Locations

 아까 2.5에서 써놨듯이 Chunk Location이라는 Metadata를 Persistent하게 가지고 있지는 않는다. **Chunkserver가 Cluster에 Join할 때 Chunkserver에서 Poll해온다.** 그리고 Master가 HeartBeat message로 주기적으로 이 정보를 최신으로 유지한다. 

처음에는 Mater에 이 Metadata까지 때려박으려고 했으나, 이 방법이 훨씬 간단해서 이렇게 했다고 한다.



### 2.6.3 Operation Log

 **Op Log**는 Critical metadata changes의 Record를 포함하고 있다. 그리고 동시다발적인 명령을 정의하는 Logical Time Line의 역할도 한다. **Op Log는 굉장히 중요한 Data이고, 그래서 Client가 보지도 못하게 한다.** 왜냐면 Op log 날라가면 Chunkserver나 Chunk가 살아있어도 어쩔 수 없기 때문이다. 그래서  Remote machine에도 저장하고, 잘 저장될 때까지 Client Op들도 다 미룬다. Chunkserver가 고장나면 Op log보고 고치기 때문에 File들을 손상없이 유지하기 위해서는 꼭 지켜야한다. 이 Op Log는 항상 작게 유지되고, Checkpoint를 정해서 고장에 대비한다. 여기서Checkpoint는 [B-tree]()형태로 되어있는데, 이 구조를 사용해서 Extra Parsing없이 namespace 조회에 사용될 수가 있다.(Data Structure에서 Binary Search Tree할때 보면 Tree구조라는게 Search할때 효율을 봤었죠) **별도의 Thread에서 이 Checkpoint를 만들기 때문에, Mutation Delay없이 만들 수 있으며, 이렇게 만들어진 Checkpoint에는 전환 이전의 Mutation이 전부 포함된 상태이다.** (이 부분은 OS강의 Thread부분이 생각나네요. 하나의 Process에서 Thread를 사용해서 여러가지 일을 동시에 할 수가 있었습니다.)



### 2.7.1 Guarantees by GFS

 **File namespace mutaion은 [Atomic]()하다.**  (어떤 작업이 실행될 때 완전하게 진행되어 종료되거나, 그럴 수 없는 경우에는 실행조차 안하는 특성) **즉! 작업이 중간에 멈추는 경우가 없는 특성을 바로 Atomicity라고 한다. **이러한 특성을 가지기 위해서 Locking이라는 기법을 사용한다.(4.1에서 다룬다.)

Mutation후, File region state는 

- 어떤 Type의 mutation인가
- 성공 or 실패
- 동시에 발생 or 순차적으로 발생

에 따라서 달라진다. (여기서 Region은 DB에서 Table이 나눠진 단위인건지 햇갈리네요)

- Consistent -> 모든 Client가 항상 Same Data를 봄(어떤 Replica를 보던지)
  - Inconsistent -> Same Data를 보지 않음

- Defined -> Client는 Mutated Data를 본다.
  - Undefined -> Client는 Mutate가 안된 Data를 본다.

**Data Mutation**에는 두가지가 있다.

- Writes
- Record Appends

Write Mustion은 입력한 Data가 Application-specified file offset에 기록된다. 여기서 Offset이란 다음번 주소를 만들기 위해 기준이 되는 주소에 더해진 값을 의미한다.

- ex) 100 +7 에서 100이 원래주소, 7이 Offset

 Record Append Mutation은 Concurrent하더라도, **한번이라도 Atomic하게 Data가 append된다.** GFS가 Choose한 offset은 다시 client에게 return되고, defined region의 시작점을 Mark한다. Sucessful mutation 후에 File region은 Defined state고, **마지막 Mutation까지 write되어 있다는 것을 보장한다.** Mutation을 모든 Replica chunk들에 적용하여 이를 실현시키는데, Chunkserver가 다운되거나 하는일로 Mutation이 적용안된 Replica는 나중에 Garbage collect된다.(뒤에서 자세하게 다룹니다.) Client가 Chunk location같은 데이터를 cache하고 있으니까, Stale Replica를 읽어올수도 있는데, 이런 상황을 Cache entry's timeout으로 방지한다.

 그리고 Google의 Workload는 Append-only가 대부분이여서, 청크의 끝을 반환하기 때문에,  Stale Chunk일 경우, 마스터한테 이야기하면 Current chunk location을 받을 수 있다.

성공적으로 Mutation이 끝나고 한참후에 기계가 고장난다면?

-> GFS는 정기적 신호로 고장을 감지하고, **Data corruption을 Checksumming으로도 알아낸다.**

([Checksum]()은 Data의 Intergrity(무결성)를 보호하는 방법)



### 2.7.2 Implications for Applications

 GFS는 이미 다른 목적을 위해 가지고 있던 Simple한 기술로 Consistency한 Model을 만들었다. 구글 대부분의 Applications mutate files은 Write보다 Append이다.

- Append
  - GFS에서 Concurrent mutations에 대해서도 At least atomically를 보장한다.
  - 그 과정에서 GFS가 그 사이에 Padding이나 Record duplicate를 집어넣을수도 있다.
- Checksum
  - 무결성을 보호하는 방법
  - Checkpoint에 포함된다.
  - Readers는 Defined state인 File region에 대해서 이 Checkpoint만 확인하면 된다.
  - 유효성을 확인할때도 Checksum으로 가능

Consistency and Concurrency issue에도, 이런 접근 방식이 도움이 되었다.

 ==별다른 기능을 추가하지 않고도 Consistency한 Model을 만들 수 있었다라는것을 말하고자 하는 문단같습니다. 사실 여기까지 봤을 때는 이해안되고, 모호한것도 많은데 뒤에서 다 설명을 해주니까 넘어가자.==



## 3. System Interactions

 Master의 관여가 최소화되도록 디자인했다. (Bottle neck을 막기위함입니다.)



### 3.1 Leases and Mutation Order

 Mutation은 Write, Record append같이 Chunk의 Contents, Metadata를 바꾸는 하나의 Operation이다. 그리고 **Mutation은 Chunk와 그 Chunk의 모든 Replica에서 이루어진다.** 이때 **Lease 방식을 이용해서 Replica들 사이 Consistent mutation order를 유지할 수 있다.**

**Lease 방식**

- Master가 Replica들 중 하나에 Lease를 부여
- Lease를 부여받은 Replica를 "Primary"라고 부른다.
- Primary가 Chunk에 대한 모든 Mutation의 순서를 결정한다.

**즉, Master가 아니라 Primary가 일을 대신 하도록 만든 것!**

-> Master의 관여 최소화! (나중에 Primary가 다운된다거나 하는 상황이 오면 다른 Replica를 새로운 Primary로 만듬)

![image-20200505145101269](/home/ines/.config/Typora/typora-user-images/image-20200505145101269.png)

**Figure 2: Write Control and Data Flow의 과정을 나열하면,**

1. Client가 Master에게 어떤 Chunkserver가 Primary인지, 위치는 어딘지, 나머지 Replica는 어디에 있는지 물어본다. (만약 Primary가 없으면, Master는 Primary를 하나 선출)

2. Master가 Client가 요청한 정보를 보내주고, Client는 그 정보를 Cache한다.. (이게 사라지지않는 이상 다시 Master랑 Contact 할 필요는 없어짐)

3. Client는 Data를 모든 Replica에 Push하고, 각 Chunkserver들은 ["LRU buffer cache"]()에 그 Data를 저장한다. (방금 이건 Data Flow)

4. Replica들이 Data를 다 받으면, Client가 Primary한테 Write request를 보낸다. Primary는 받은 모든 Mutation에 Serial number를 부여하고, 그 순서에 따라 Local에 적용함.

5. Primary는 Serial number를 부여받은 Mutation들을 Second Replica들에게 전달하고, 모든 Replica들도 마찬가지로 순서에 따라서 Mutation을 적용한다.

6. 작업이 끝나게 되면 Replica들은 Primary에 작업이 끝났음을 보고한다.

7. Primary는 작업이 끝났음을 Client에 보고한다.

   - 만약 Secondary Replica에서 Error가 나왔다면?

     -> Client에게 전달하고, Retry하기를 권유한다.

이 처리과정에서 중요하게 봐야할것은 **Data Flow와 Control Flow가 Decouple(분리) 되어있다는 것**

-> Performance가 향상된 결과! (3.2에서 자세히 다룸)

또한 Write operation이 Chunk boundary를 넘겨버린다면? (64MB 초과)

- GFS Client Code가 이 operation을 여러개로 조각낸다.

이 과정중에 Clients가 Concurrent하게 Mutation이 실행되었다면, 명령들은 [Interleave]()되어서 Data에 쓰여진다. 하지만 Shared file region에서는 fragments를 포함한 상태로 끝날수도 있는데, 이런 경우에는 [2.7](#2.7.1-gurantees-by-gfs)에서 이야기했던것 처럼 Consistent하지만 Undefined상태로 둔다.



### 3.2 Data Flow

 Network efficient를 위해 Data flow와 Control flow를 Decouple 해놨다. Control flow가 Client에서 Primary와 모든 Replica로 가는동안, Data는 Pipeline 방식으로, 선택된 Chunkserver Chain을 따라서 Linear하게 Push된다.

**[PipeLine 방식이란?]()**

- Processor(CPU)에서 Performance를 높이기위한 명령어 처리과정
- 명령어처리를 여러단계로 나누어 동시에 처리 -> 병렬화 -> 고속화

결국 Data flow와 Control flow를 분리한 Google의 목적은 

1. **Machine들의 Network bandwidth를 Fully utilize**
   - Data를 분산시키는게 아니라 하나의 덩어리(e.g., Tree)로 Linear하게 Data를 Push해야함
2. **Bottleneck 피하기**
   - 가장 가까운 Machine들로 Data를 전달해야함
     - IP address로 거리를 estimated 할 수 있게 해놔서 괜찮음
3. **Minimize Latency**
   - TCP연결을 통해 Data transfer를 pipelining하면 됨
   - 모든 Rack들은 Full-Duplex로 다 연결해놨음 -> Machine들은 데이터를 송신과 동시에 수신도 할 수 있어서 Pipelining이 매우 Helpful
   - 보통 100 Mbps 였고, Latency는 1ms 정도 였음



### 3.3 Atomic Record Appends

 **GFS는 Record append라고 불리는 Atomic한 특성을 가진 Append Operation을 제공한다.** (앞에서 자주 등장했었죠) Write같이 Offset을 구체화하는 Operation같은 경우, Same region에 Concurrent write하는건 Serializable 하지 않는다. (직렬화 할 수가 없음)

 하지만, **Record append**는 Client가 Offset이 아니라 **Data만 구체화 하면 된다.** Data를 Append할 Offset은 GFS가 알아서 Choose하고, 그 Offset에 Atomic하게 Append하고, 그 Offset을 Client에게 Return해준다. GFS같이 Same file에 여러 Client가 Concurrent하게 Append하는 Distributed application에서 엄청나게 많이 쓰인다.

많은 Client가 맨날맨날 같은 File들에 접근하니까, **강력한 Synchronization(동기화)가 필요하다.** 

Record append는 일종의 Mutation이고, Contorl flow를 따라간다.

**만약 Client가 Push하는 Data 때문의 Chunk가 64MB라는 한도를 넘게 된다면?**

- Primary가 체크해봤을 때, 이런 일이 일어날 것 같다! 라고 하면, Primary는 Chunk를 Maximum size의 Chunk처럼 Pad(모양으로 만들다)한다.
- 다른 Replica한테도 똑같이 Pad하라고 시키고, Client에게 "다른 Chunk에서 하세요."라고 한다.

이런 경우 아니면 그냥 Chunk에 추가한다. 그리고 Worst-case fragmentation을 허용가능한 수준으로 유지하기 위해 Append operation의 크기는 청크의 크기의 1/4로 제한한다.

 만약 Record Append가 어떤 Replica에서 실패한다면, 앞에서 나왔던것처럼 Client는 Retry할거고, 결국 Replica들 끼리 다른 Data를 가지고 있을 수도 있다. GFS가 모든 Replica들이 Byte단위까지 모두 동일하다는 걸 보장하지는 않지만, Record append에서 Atomicity한 특성은 보장하기 때문에, 모든 Replica chunk에서 같은 Offset에 Data가 작성되어야 한다는 간단한 관찰을 통해, 다른 Replica가 Primary가 될 때, 더 높은 Offset을 가진 Replica를 Primary로 만듬으로써 Consistent가 유지가 되고  inconsistent한 Mutation에 실패한 것들의 경우에는 Checksum같은 기법을 이용해서 다루면 된다. 

**-> 이래서 중간중간 inconsistent하게 되는 현상을 걱정안해도 된다고 이야기하는것 같다.**



### 3.4 Snapshot

 **Snapshot은 File 또는 Directory tree를 복사하는 Operation이다.**

Instantaneous하게 진행되는(연속적으로 일어나는) Mutation들에게 최대한 방해가 안가도록 만들어야 한다.

- Snpashot으로 카피본을 순식간에 만든다.
- 그 Data들로 실험을 한다.
- 실험 이전 상태를 Checkpoint로 해서 Data를 다시 빠르게 되돌린다.

**[Copy-on Write]()으로 Snapshot을 구현했다.**

- fork()처럼 부모 Process의 모든 자원을 자식 Process에게 한번에 다 넘겨주는 방식이 아니라, 자원을 공유하다가 데이터를 써넣을일이 생기면 그제서야 자식에게 넘겨주는 기법 (Write할 때만 Copy가 일어나도록 최적화)


Snapshot operation 완료 후, 첫 Write operation 정리

<img src="/images/About Snapshot/1.png" width="1000px" height="500px" align="center"> 

복제가 Locally하게 이루어져 Network를 거칠 필요가 없다.

이후 다른 Chunk와 다른 점 없이 정상적으로 사용 가능



## 4. Master Operation

 **Master가 하는 일**

- All namespace operation
- Chunk replica 관리
  - Placement decision
  - Create new chunk and replica
  - Coordinate various system-wide activities to keep cjunks fully replicated
    - Chunkserver에 골고루 Replica를 퍼트려서 Balance를 맞추기 위함



### 4.1 Namespace Management and Locking

 Tree구조로 되어있다.

**GFS는 Multiple operation이 가능하도록 만들었다.**

- Master가 하는 Operation은 대부분 시간이 상대적으로 오래걸리는데, 그거 한다고 다른것들 미뤄두기 싫어서

  Lock 기법으로 Proper serialization을 보장

  

다른 File System과는 다르게, GFS는 Per-directory data structure가 없고, Same file이나 Same directroy를 대비한 Alias도 없다.

- **Per-directory data structure** : Directory안에 있는 File들의 리스트를 보여주는 구조
- **Alias** : 이미 정의된 데이터에 대해서 보다 의미있게 붙인 이름을 의미

**-> inode같은 Data structure가 없다는 뜻이다.**

- inode란 해당파일에 관한 정보를 담고있는 자료구조로 파일들은 각자 1개의 아이노드를 가지고 있음
- File에 새로운 File이 Creation된다거나 했을 때, 새로 만들어지는 File의 상위 폴더들의 inode들도 전부 수정이 되어야함(**여기는 저의 추측..**) -> Write lock이 필요함 

이런 자료구조가 아니기 때문에, 상위폴더들에 Read lock을 거는것만으로도 지워지는걸 막기에 충분하다.

그리고 또 좋은점은 같은 것에 Concurrent Mutation을 할 수 있다는 것이다.

- Read lock으로 Delete, Rename, Snapshot되는걸 막고 할거 하면된다.

Namespace tree 안에는 엄청 많은 노드가 있어서  Lock은 게으르게 할당되고 지워진다. (Keep in touch하기 힘드니까 그런거 같습니다.) 그리고 이 Tree는 Deadlock(교착상태)를 방지하기 위해서 항상 순서를 잘 유지해야된다.



### 4.2 Replica Placement

 GFS Cluster에는 머신들이 진짜 많다. 그리고 Client도 진짜 많아서 한 Chunkserver에 여러명의 client가 Access하는 경우도 많다. 다른 Rack에 있는 머신들끼리의 소통은 Switch를 통해서 이루어진다. Rack 내부에 있는 머신들끼리하는 소통보다는 당연히 느리다. Multi-level distribution을 할때는 고려해야하는 몇가지 문제들이 있다.

- Scalability (확장성)
- Reliability (안정성)
- Availability (가용성)

 Replica placement policy는 여기서 안정성과 가용성을 극대화시키고, Network bandwidth utilization또한 극대화시킨다. 위의 두가지 측면에서 같은 Rack안에 있는 머신들에만 Replica를 뿌리는건 충분하지 않다. 즉, Rack과 Rack사이를 오가며 Replica를 뿌려야한다. 여기저기 퍼뜨림으로써 **Read**를 하는것에는 렉 하나가 통째로 고장나는 일에도 끄떡없고, Bandwidth 사용도 Maximize할 수 있으니 좋다. Write에 경우에는 좀 이야기가 달라지긴하는데 Latency와 정확도(?)간의 Tradeoff가 필요하다.(포기할건 포기해야돼)



### 4.3 Creation, Re-replication, Rebalancing

 Chunk replica가 생성되는 이유에는 3가지가 있다.

1. Chunk creation
2. Re-replication
3. Rebalancing

**Chunk creation**을 할 때, Master는 이 Chunk의 초기 Replica(텅빈 녀석)을 어디다가 둘지 결정한다.  위치결정에 고려하는 사항은 다음과 같다.

1. 평균보다 낮은 Disk 사용률을 가진 Chunkserver
2. 최근에 새 Chunk가 생성이 안된 Chunkserver

1,2 둘다 결국에 Chunkserver사이의 Balance를 맞추기 위함이다.

**Re-replication**은 Replica의 개수가 사용자가 정한 개수보다 적어지면 일어난다. Replica의 수가 적어지는데에는 여러가지 이유가 있다.

- Chunkserver가 죽어버렸다.
- Error때문에 Disk가 다운됐다.

 비슷한 맥락인데, 이런 이유들로 Replica에 개수가 줄어들게 되고, 다시 만들어줄때는 **우선순위에 따라서 순서대로 Re-replication한다.** Replica의 개수가 기준보다 차이가 제일 많이나는것이나, 개수도 딸리고 Lived file같은 애들은 Client의 진행을 방해할 수도 있어서 우선순위가 높다.

 이렇게 우선순위가 정해지면 Master가 몇몇 Chunkserver들에게 시켜서  **우선순위가 가장 높은 녀석을 다이렉트로 Copy해서 "Clone"한다.** 그리고 이렇게 Clone하라는 명령을 받은 Chunkserver들은  "Cluster내의 디스크 균등화", "여러 Rack사이에 여기저기 퍼뜨리기" 같은 기준에 의해서 정해진다. 그리고 많은 Client의 요청들 사이에서 Clone의 Traffic을 유지하려면 각각의 Chunkserver의 Clone operation에 Limit를 거는 수 밖에 없다. (Tradeoff)



### 4.4 Garbage Collection

 GFS에서는 File이 Delete되었다고 해서 곧바로 Storage에서 없애버리지는 않는다. 정기적인 Garbage collection이 올때까지 기다리는데, 이렇게하는 편이 훨씬 간단하고 안정적이다. (매일 이른아침에 오는 쓰레기차랑 비슷하네요)



#### 4.4.1 Mechanism

 Application에 의해서 File을 Delete시킬때 Op log에 바로 써넣기는 하는데, 위에서 말했던것 처럼 **바로 지우는게 아니라, 쓰레기차(Garbage collection)를 기다린다.** 그전까지 **이 File이 Client의 요청에 Return되지 않도록 해야하는데**, 그 방법으로 파일이름을 Deletion Timestamp가 포함된 Hidden name으로 바꿔버린다. 그리고 쓰레기차가 오면 사용자가 지정한 시간보다 오래 존재하던 Hidden file은 쓰레기차가 가져간다. 시간이 초과되기 전까지는 사용자가 원하면 새로운 이름으로 바뀌어서 Read될 때도 있고,  그냥 다시 살려낼수도 있다. (폐기예정일 정해놓고 가져갈사람 가져가라는것 같네요.) **결국 시간이 초과되서 Hidden file까지 쓰레기차가 가져가버리면, Metadata까지 지워지면서 끝난다.**

비슷하게 Master가 Chunk namespace를 정기검열할때 고아가 된 Chunk들의 Metadata를 지우고 HeartBeat 메세지를 통해서 이제 그 Chunk의 Metadata 나한테 없다고 알려주면, Chunkserver가 자유롭게 그 Chunk를 제거할 수 있다.(Namespace는 Tree구조였습니다. Tree구조에서 Delete를 하게되면 Delete된 Node를 가리키는 Reference가 하나도 없는 상태가 됩니다. 이러한 상태의 Node를 고아가 되었다고 하는거 같습니다.)



#### 4.4.2 Discussion

 Distributed garbage collection은 원래 쉬운 문제가 아닌데, GFS에서는 간단하게 해결된다. C**hunk 에 대한 reference를 쉽게 identify할 수 있기 때문인데, 마스터가 모든 Metadata를 가지고 관리하니까 그렇다.** 알다시피 Chunk Replica들은 각 Chunkserver에 있는 Linux file인데, GFS의 Lazy한 Garbage collection방법은 Eager deletion보다 더 좋다. (Eager deletion은 garbage가 생기면 즉각즉각 지워버리는걸 의미하는것 같습니다.)

1. 간단하고 안정적이다.
2. Regular Scan과 Handshake같은 Master의 정기적인 background activity에 묶어보내서 일괄적으로 수행할 수 있다. 
   - Cost가 줄어든다.
3. Reclaming storage의 Lazy한 특성이 우발적인 상황에서 안전망 역할을 한다.
   - 실수로 지워지더라도 문제없다구

 단점으로는 가끔 이런 Lazy한 특성때문에 storage가 빡빡할 때 사용자가 미세조정하려는 노력이 헛될수도 있다는 것이다. 예를 들면 임시파일을 많이 만들었다가 지우고를 반복하는 Application일 경우에 문제가 생길 수 있겠다. 왜냐면 지워진줄 알았는데 실제로는 나중에 일괄적으로 지우니까 그렇다.



### 4.5 Stale Replica Detection

 Chunk는 Mutation을 못따라가면 Stale한 상태가 될 수도 있다. Master는 이런 Stale한 Chunk를 Client가 사용하는것을 막기위해서 Chunk version number를 사용해서 Chunk의 상태를 구별한다. Master가 새로운 Lease를 grant할 때마다 Version number는 증가하게 되고, Master랑 replica들은 이 Number를 저장한다. 이 과정들은 Client의 요청을 처리하기전에 이뤄지기 때문에 Client가 Stale한 Chunk를 사용하게 되는것을 막을 수 있다. (참좋네)

 좀더 자세한 상황을 예로 들어보면, Chunkserver가 Unavailable할 경우에 그 Chunkserver의 Chunk들은 Version number를 따라가지 못하게 된다. -> Stale chunk가 된다. 이때 만약 기존의 Primary가 어떤 이유로 Unavailable한 상태가 된다면 Master는 새로운 Primary를 선출하여 Lease를 grant해야한다. 이때 Master는 Version number들과 앞에서 이야기했던 여러가지 요소들을 기준으로 새로운 Primary를 선출하여 Chunk과 그 Chunk replica들이 Stale한 상태가 되지 않도록 막게된다. 이제 Stale한 상태가 된 Chunk들은 정규적인 Garbage collection으로 지워지게 된다.

 위와 같은 특수한 상황이 아니면, Client의 요청으로 Master가 Chunk에 대한 Metadata를 넘겨줄 때 이 Chunk version number도 같이 넘겨준다. 이제 Client가 Primary(Lease를 받은 Chunkserver)와 만나서 Secondary Replica와 Matching 시켜줄 때 Version Number를 확인하여 Operation을 수행하기 떄문에 Client는 항상 신선한 Data에 Access할 수 있게 된다.

 

## 5. Fault Tolerance and Diagnosis

 GFS만드는데에 있어서 가장 큰 도전중 하나가 Component Failure에 대처하는 것이었다. Cluster내에 Component가 엄청 많다보니까, Machine이 고장나는것은 특수한 상황이 아니라 당연하게 처리되어야했다. 이 녀석들은 언제 고장날지 모른다. Machine과 Disk는 믿을 수 없는 존재들이다. 잘못하다가는 못쓰는 시스템이 되고 Data의 손실이 일어날 수도 있기 때문에 이런 문제를 해결하기 위해서 만든 Tool에 대해서 이야기한다.



### 5.1 High Availability

 Cluster의 구성원들은 언제든지 고장날 수 있다. 우리는 전체적인 System을 두개의 간단하지만 효율적인 전략 두가지를 통해서 High Availability하게 만들었다.



#### 5.1.1 Fast Recovery

 Master와 Chunkserver는 그들의 State를 re-store하고, 금방 다시 시작될 수 있도록 디자인되었다. Server는 Process가 죽으면서 자주 Shutdown된다. 이런 Server에 Request를 보낸 Client와 다른 server에서는 Request에 대한 시간초과가 발생하고, Restart되고있는 Server에  다시 접근을 시도할 경우 약간의 문제가 발생한다. (6.2.2에서 확인)



#### 5.1.2 Chunk Replication

 아펭서 말했던 것처럼, 각각의 Chunk들은 여러 Chunkserver에 걸쳐서 복제가 된다. User가 설정한 Replication level에 맞춰서 Replica를 관리하고 Checksum으로 Data corruption을 감지한다.



#### 5.1.3 Master Replication

 Master의 state도 Relicability를 위해서 복제된다. Checkpoint와 Op log가 여러 Machine들에 복제된다. State mutaion은 Log record가 Disk에 locally하게 퍼진 경우에만 가능하다. Simplicity를 위해 하나의 Master process는 Garbage collection같은 시스템을 내부적으로 바꾸는 Background Activity뿐만 아니라 모든 Mutation을 담당한다. 이 Process는 Fail되더라도 거의 즉각적으로 다시 시작할 수있다. 만약 Disk나 Machine이 Fail된 경우에는 GFS는 새로운 Master process를 Operation log가 복제된 곳에서 다시 시작한다. 이렇게되면 Master의 위치(주소)가 바뀌게 되는데, 어짜피 Client들은 Master의 DNS alias만으로도 접근하기 때문에 Relocate된 Master에도 문제없이 접근할 수 있다.

 그리고 "Shadow Master"라고 하는 녀석은 Primary Master가 Down되었더라도 Read-only access를 제공한다. Mirror가 아니라 Shadow라서 Primary와 비교했을때, Lag(부족하다?)하고 완전한 상태는 아니다. 그래도 Shadow master가 좀 소외된 Chunk들이나 Application의 Availability를 높인다.

 정보유지를 위해서 Shadow Master는 Primary에서 Record되고있는 Log를 보면서 순서대로 똑같이 Data를 변화시킨다. Primary처럼 Chunkserver가 Startup할 때 Poll도 하고, Handshake message도 보내면서 모니터링도 한다. 근데! Replica creation, deletion, relocation에 대해서는 Primary Master에게 의존한다.



### 5.2 Data Integrity

 Corruption 감지를 위해서 Checksum을 사용한다. 위에서 이야기했던것처럼 Chunk replication 정책을 통해 Corruption과 Fail에 대응하고 있는데, 이런 정책으로 인해서 여기저기 퍼져있는 Replica들을 하나하나 찾아서, 비교하면서 Corruption을 찾아낸다는건 비현실적이다. 그래서 GFS에서는 Chunkserver가 독립적으로 Checksum을 유지관리하면서 확인한다.  

 64KB의 Chunk block에는 32bit짜리 Checksum이 붙어있다. 마치 Metadata처럼 취급되서 Persistently하게 Logging을 통해 저장된다. 

 Data를 Read할 때, Chunkserver는 요청받은 Chunk들의 Checksum을 확인한다. 이 Data들을 고객님들에게 Return해주기 전에 확인한다. 만약 Checksum이 Match되지 않으면, Chunkserver는 이 Chunk가 Corruption되었다고 판단하고 Error를 return하고 Master에게 이 사실을 알린다. 결국 고객님이 Read를 재시도하시면, Master가 손상없는 Chunk를 적당한 Chunkserver에 Clone하는 동안에 다른 Corruption되지 않은 Chunk를 Read하게 된다. 그런다음 Master는 Corruption된 데이터를 가지고있던 Chunkserver에 그 Chunk 지워버리라고 말하면 그 Chunk의 삶은 끝이난다.

 Checksum은 몇가지 이유로 성능에 영향을 미치지 않는다.

-  Read는 대부분 여러개의 Chunk에 걸쳐서 하게되는데, GFS client code가 Chunk block에서 Checksum부분 경계에서 정렬을 시킴으로써 Overhead를 줄인다.
- Checksum 조회와 비교는 I/O없이 수행된다.

 Chunk의 끝에 하는 Write, 즉 Append는 Checksum에 최적화되어있다. 그냥 단순하게 Chunk의 마지막부분에 써넣으면 되는거라서, 다 쓰고나면 다시 Checksum구해서 새로운 Checksum을 써넣어주면 된다. 근데 만약 Append한 Chunk가 알고보니 Corruption된 Chunk였다고 하더라도 상관이 없는게, 어짜피 그렇게 만들어진 녀석의 Checksum은 다른 Replica들과 다를거고, 다음번에 또 불려지거나 정기적인 Scan에 의해서 발견된다.

 반대로 아예 데이터를 새로쓰는 Write, 즉 Overwrite같은 경우는 먼저 Overwrite되는 범위에 해당하는 Chunk중에서 처음것과 마지막것의 Checksum을 먼저 확인한다. 이렇게하지 않으면 Corruption이 감춰진채로 진행되서 Overwrite가 제대로 이뤄지지 않을수도 있기 때문이다.

 Idle periods(쉬는시간? 널널한 시간?) 중에는 Chunkserver가 Inactive한 Chunk들을 Scan한다. 이렇게 함으로써 잘 안쓰이는 소외된 Chunk들의 Corruption도 감지할 수 있다.



### 5.3 Diagnostic Tools

 Extensive하고 Detail한 Diagnostic log를 이용하면 작은 Cost로도 문제를 식별하거나, Performance analysis을 할때 굉장히 도움이 많이 된다. 이 Log에는 중요한 Event나 [RPC]() request와 그에따른 response들 전부가 저장된다. 이 Log는 쉽게 지우는게 가능하지만, 가능한 최대한 많이 남겨놓으려고한다.  (RPC log에는 Read와 Write를 뺀 나머지 Request와 그에 따른 response가 Record된다.)

이렇게 Logging하는것도 Performance에 크게 영향을 안 미치는데, 왜그러냐면 별도의 과정없이 그냥 들어오는 순서대로 척척 저장하기 때문이다. (Synchronization같은거 필요없다.)



## 6. Measurements



### 6.1 Micro-benchmarks

구성품

- 1 Master
- 2 Master replicas
- 16 Chunkservers
- 16 Clients

그리고 모든 Machine들에 듀얼코어 1.6GHz Processors, 2GB Memory, 80GB 5400 rpm disks 2개가 있고, Master와 Chunkserver의 19개의 Machine, 그리고 Clients의 16개의 Machine은 각각 100Mbps full-duplex ethernet connection to an HP2524 switch로 연결되어 있다.



#### 6.1.1 Reads

실험: N clients가 동시에 Read한다. 320GB의 Data에서 4MB를 랜덤하게 선택해서 읽는 작업을 256회 반복하여 Client가 각각 1GB씩 읽는다.

![image-20200505163705221](/home/ines/.config/Typora/typora-user-images/image-20200505163705221.png)

Client가 한명일때, 




