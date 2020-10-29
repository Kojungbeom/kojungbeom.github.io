

# Geometric transformation

어쩔 수 없이 선형대수가 좀 필요하다. 왜냐면 Matrix 바탕으로 하니까 그렇다.

### Computer graphics

영상을 의미한다. 

영상을 다루는데 있어서 최소한의 수학을 이 뒤에서 다룰 것 이다.

이미지가 표현하는 방법은 픽셀하나하나가 위치정보를 가지고있다고도 할 수 있지만, vertice 방식으로 되어있다면 이미지를 늘려도 별로 영향이 없다.



translation은 사실 Linear하지가 않아

- 다시 또 Linear 하다는 건 뭘까?
- Homogeneity
- additivity
- https://www.facebook.com/mathsarang/posts/416457968430463/



줄일때는 cv2.INTER_AREA

- 의도치않은 Line (Artifact)가 생길 수 있다.

늘릴때는 아무거나?