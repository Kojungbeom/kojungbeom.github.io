---
title:  Graphic Card를 교체해보자!
excerpt: Graphic card 교체하는 방법
date: 2020-12-21 12:00:00
categories:
  - Information
tags:
  - Information
lastmod : 2020-12-21 12:00:00
---

# Graphic Card를 교체해보자

오늘 연구실 Local computer의 그래픽카드를 Nvidia GTX 1080 Ti에서 Nvidia RTX 3090으로 교체했다.

그래픽 드라이버 때문에 문제생겨서 화면 안나오고 그럴까봐 처음에는 기본 환경인 Ubuntu 18.04를 밀고나서 

교체할까 생각했었는데, 혹시 그냥해도 될까 싶어서 시도했더니 성공했다.

나중에도 다른 컴퓨터들 그래픽카드 교체할 일이 있을 것 같아서 어떻게 했는지에 대해서 기록했다.

<br>

### 1. 그래픽카드 교체

먼저 유튜브 동영상을 참고하여 그래픽카드를 갈아낀다. [링크](https://www.youtube.com/watch?v=kb52ebyJ_AQ)

갈아꼈으면 다시 케이블을 연결하고 부팅한다.

<br>

### 2. 그래픽 드라이버 재설치

교체후에 컴퓨터를 다시 키면 이미 여기서부터 화면이 안나오는 경우도 있는 것 같다. 이 경우에는 어쩔 수 없다. 포맷하는 수 밖에..

나는 다행히도 화면이 나왔다. `Software & Updates`에서 Additional Drivers 탭으로 들어가면 실제로 그래픽드라이버를 잡지 못하고 있는 것을 확인할 수 있다. 

(원래 사용하던 그래픽카드에 맞는 그래픽 드라이버와, 교체한 그래픽카드에 맞는 그래픽 드라이버가 다르기 때문!)

```
$ sudo apt-get remove --purge nvidia*
$ sudo apt-get remove --purge cuda*
$ sudo apt autoremove
$ sudo apt autoclean
```

이전에 이미 설치되어 있던 `Graphic driver`들과 `cuda`를 삭제해준 다음, reboot 하고나서 다시 `Software & Updates`를 확인하면 

교체된 그래픽카드에 맞는 그래픽 드라이버들이 인식되어 있는것을 확인할 수 있다. 

<img src="/images/how_to_change_graphic_card/software_and_updates.png" width="800px" height="400px" align="center">

원하는 드라이버를 선택한 후 `Apply Changes`를 눌러준다음 다시 reboot 해주면 정상적으로 그래픽 드라이버가 깔리고 정상적으로 모든것이 실행되는 것을 볼 수 있다.

Anaconda 쪽에는 아무 문제가 없는지는 나중에 확인해봐야 알 것 같다.