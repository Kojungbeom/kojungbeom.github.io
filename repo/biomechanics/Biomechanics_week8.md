# Biomechanics Week 8



## Observing the Angular kinematics

우리몸의 운동의 대부분은 회전운동임

관절이 개입을 하고 있고, 관절에 의해서 모든 동작들이 축을따라서 회전을 하는 운동임

Rotation 관점으로 보는게 인체공학적으로 맞다.



가장 먼저 운동학에서 사용되는 각운동을 표현하는 방식

- 각(Angle)로 표현 --> Angular kinematics
  - 인체에서의 각을 측정이 먼저다.
    - 측정기 이름이 바로 Goniometer



## Measuring angles

Relative angle

- 절대적인 축이 있는게 아니라 상대적인 각도
- 두개의 관절에서 한개의 관절을 기준으로 각을 측정한것이 Relative angle

- Anatomical reference가 기준이 된다. (모든관절이 다 펴져있는 상태)



Absolute Angles

- Measured with respect to an either
  horizontal or vertical reference line



특히 허리쪽으로 Absolute angle을 잴때는 vertical을 기준으로 잡는다.

- 경우에 따라서 달라짐

달리기 자세를 분석하는 경우는 horizontal을 기준으로 허리의 각도를 잰다.





### Instant Center of Rotation

- Center of Rotation이 원이고, 고정되는 부분이 딱 정해져있는 경우에는 회전축이 가운데 걸려있는 축에 의해서 결정이 된다. 근데 보면 관절과 관절사이에는 축이 정해져있지않음 서로 맞물리는 형태임. 이때 타원형이라면 회전의 중심방향이 계속바뀐다.

회전축이 고정되어있지 않으면 표면을 따라서 변화하는걸 Instant Center of Rotation



### Angular Distance and Displacement

- Angular distance
  - quantity
  - 시작점과 끝점이있고 그것의 변화량
  - 부호에 따라서 뱡향이 바뀜
- Angular dlsplacement
  - vector
  - path의 전체 길이
  - 반시계방향이 Plus

60도를가고 20도를 돌아왔을때 distance는 80도고

displacement는 어쩌구





### Angular Distance and Displacement

각도표현 세가지

- Degrees
- Radians
  - 세개의 Radius가 동일함
- Revolution



### Angular Speed, Velocity, and Acceleration

Angular distance는 $\fi$ 로 speed 구할 수 있음

Angular displacement는 $\theta$ 로 velocity 구할 수 있음

관절에서는 등속도운동을 거의하지않음

- 범위가 고정이 되어있기 때문에 가다가 멈춰야됨





### Angular Motion Vectors

돌아가는 회전의 방향을 표현하는게 어려움

오른손법칙으로 하면되는데 엄지방향이 플러스방향 (회전의 수직방향 축)



## Relationships Between Linear and Angular Motion
### Linear and Angular Displacement, Velocity, Acceleration

운동으로서의 의미를 가질때는 특히 스포츠 또는 일과 관련될때는 이 회전운동을 결국 직선운동으로 전달할때가 많음

- 날아오는 공을 배트를 휘둘러서(회전운동) 직선으로 날아가게하는게 목표

Angular motion도 순간적으로 보면 Linear motion이 되는데 이떄 핵심이 되는것은 바로 반지름.

- 일정한 시간 t 동안에 \fi만큼 회전을 했을때, 배트의 반지름에 따라서 같은 시간동안 움직이는 거리가 달리짐
- 

회전에는 두가지가속도가있음

- 접선방향의 가속도
  - 리니어에 비례
- 구심력
  - 회전의 괘적을 가지게되는 이유
  - 방향의 변화를 만들어냄
  - 반지름에 반비례함
  - 선속도 v^2에 비례한다.



순간적인 속도는 회전을 하지않고 직선방향으로 진행을 하려한다. -> v라고 하자(Linear)

중심으로 작용하는 a_n에 의해서 직진하지않고 아래방향으로 향하는 힘이 생긴다. (세모v_n)

a_r 증명해보기





다리를 움직인다고 가정하자

85.95도를 움직이는데 2초가 걸렸을때, 오메가 = 85.85/2 = 42.98도/sec

linear velocity = rw = 0.375m/sec , 이때 오메가는 radian이어야됨(파이 나누기 180도)



마지막문제는 포물선까지 포함해서 풀어야됨





## Moment of inertia

mass보다 위치가 더 큰 영향을 가짐 (r^2)

전체가 아니라 각각의 위치에 따라서 회전의 거리가 달라지게 됨

- 그래서 보통 전부 구하고 Sum을 해서 구함 (or 적분)

뭐 질량이 바뀌어도 무방하다고 생각하라고 하심

관성 = m 이라고 판단할 수 있다는거





이번엔 원통형의 실린더

- 회전의 중심축이 중요한 역할을 함 (여기서는 longitudinal axis)
- R에 대해서 적분을 한다. (처음에는 m으로 적분하고)
  - 이 물질에서 질량과 R의 관계를 뽑아내야함
  - Density = 질량/부피
- 식을 정리하면 1/2 *M*R^2
- 질량이 어디에 분포했느냐에 따라서 많이 달라진다고 함
- **l = mr^2으로 외우면 안되고, object의 모양이나 회전축에 따라서 식을 재정의 할 수 있어야한다.**

![image-20200520111843066](/home/ines/.config/Typora/typora-user-images/image-20200520111843066.png)

Moment of inertia = (각 부분부분부분의 합)

**모양이 ㅗ형인 경우에는 중간에꺼는 공식대로 구하고, 옆에 부분은 Parallel Axis Theorem으로 구하면 됨**

오브젝트를 쪼개고 쪼개서 구하는거라는걸 알아야한다는거!

식을 외울필요는 없고 쪽지에 잘 적어놨다가 해결하면됨



## Radius of gyration

무게중심이라고 하는거는 전체적인 오브젝트를 단 하나의 점으로만 표현할때 사용하는거임

- 사실 포지션에 따라서 달라질 수 있는거
- 오브젝트가 회전운동을 할때 회전에 대한 물체의 무게중심이 어디냐를 결정하는데 사용되는 공식이 l = mk^2 (moment of inertia)
  - 모든 sum을 대표하는 반지름 r이 존재하겟지 1/2 m*r을 적분햇다고 생각해도될듯
- 상대적 회전에 대한 무게중심!
- 전체 질량의 분포가 어느쪽으로 분포가 되있느냐의 지표가 된다.
  - index for mass distribution
- 뻗은 상태에서 다리를 움직이는거랑 굽힌채로 움직이는거랑 비교해보면 뻗은 상태가 더 힘듬
- 백미터달리기 할때 다리를 위로 올려서 움직이면 더 빨리 움직일 수 있는게 그 이유



결국 moment of inertia를 만들어주게 되지

- 무슨 운동을 하느냐에 따라 회전축이 달라지기 때문에 이떄 Moment of inertia는 달라진다.
  - Radius of gyration도 달라지니까
- k 가 더 커지면
  - torque가 커짐 --> torque가 큰 운동에 유리
  - 더 강한 근력 (동작이 크니까)
- k 가 작아지면
  - moment of inertia가 작아짐
  - 더 빨리 움직일 수 있음 (공중제비)





## Angular momentum

리니어에서는 M = mv였지

이게 각각 변환이 되어서

H = lw = mk^2w



local term과 remote term으로 구분가능

ex) 달려가서 공참

아래다리에 의한 local term, 전체다리에 의한 remote term



## Conservation of angular momentum

리니어에서는 질량이 안바뀌었는데, Angular에서는 반지름이 바뀌곤하지

이때 보존이 되야하기때문에 k와 w의 변화로 보존됨

단순히 보존만 되는게 아니라 다른 회전축으로 변환된다는거에 집중

- 





moment of inertia가 w의 변화를 만들어내는거 확인



## Angular Analogues of Newton's Laws

Newtons First low

- Angular law of inertia

Newtons Second Law

- Angular law of accelerate

Newtons Third Law

- Angular law of reaction

뉴턴 123이 angular 에서 잘 작동한다는거 확인





## Centripetal force

구심력

- rotation center로 향하는 힘을 의미
- 각속도가 2배커지면 4배의 구심력이 필요함
- 자전거를 기울이면서 타는이유
  - 기울여야 각도가 생기고 지표면에 reaction force가 발생해서 수평방향으로 향하는 reaction force가 구심력을 만들어냄
  - reaction force에 의해서 만들어질수 있다.
  - 

/  