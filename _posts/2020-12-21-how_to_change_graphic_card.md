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

<br>

### 3. `Cuda` , `cuDNN` 재설치

[참고한 링크](https://velog.io/@skyfishbae/RTX3090-2대-Ubuntu-18.04-딥러닝-환경-구축-2-Anaconda-Tensorflow-keras-설치)

`Cuda`는 그래픽카드에 따라서 어떤 버전을 깔아야하는지 잘 알아보고 설치해야한다.

3090으로 교체했다면 `cuda 11`이상의 버전을 설치해야한다.

[cuda 11.1 다운로드 링크](https://developer.nvidia.com/cuda-11.1.0-download-archive)

<img src="/images/how_to_change_graphic_card/nvidia_cuda_download.png" width="800px" height="400px" align="center">

<br>

사용하고 있는 운영체제에 맞게 선택하면 터미널에서 아래의 명령어로 간단하게 설치할 수 있다.

```
$ wget https://developer.download.nvidia.com/compute/cuda/11.1.0/local_installers/cuda_11.1.0_455.23.05_linux.run
$ sudo sh cuda_11.1.0_455.23.05_linux.run
```

<br>

[cuDNN 다운로드 링크](https://developer.nvidia.com/cudnn)

`cuDNN`은 설치한 `cuda`버전에 따라서 맞는걸로 설치해주면 된다. 나는 `cuda 11.1`에 맞는 `cuDNN 8.0.5`을 다운받았다.

다운받은 후 압축을 풀고 cuDNN 파일들을 cuda 폴더로 이동시킨다.

```
$ tar -xzvf cudnn-11.1-linux-x64-v8.0.5.39.tgz
$ sudo cp cuda/include/cudnn*.h /usr/local/cuda/include
$ sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
$ sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
```

`cuda 10.0`부터 `cuda`라는 이름의 바로가기 폴더가 자동으로 생겨서 환경변수에 버전을 명시해줄 필요가 없어졌다고 알고 있는데, 만약 환경변수에 버전을 명시해논 상태라면 바꿔주자.

```
export PATH=/usr/local/cuda-11.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-11.1/lib64:$LD_LIBRARY_PATH
```

<br>

이제 다 됐다. 아래 명령어들로 버전확인하고 reboot 한번 해주면 완료!

```
$ nvcc --version
$ nvidia-smi
```







