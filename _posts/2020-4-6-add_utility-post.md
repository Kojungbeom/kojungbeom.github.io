---
title:  "Github 블로그 기능추가"
excerpt: "까먹었다면 여기로"
date: 2020-4-6 12:00:00
categories:
  - Information
tags:
  - Information
  - Jekyll
lastmod : 2020-4-6 12:00:00
sitemap :
changefreq : daily
priority : 1.0
---



---

# Github Blog에 댓글 기능 만들기 (Jekyll, utterances)

[MadPlay's MadLife님 블로그 참고](https://madplay.github.io/post/jekyll-blog-comments-with-utterances)

## 과정

1. ### utterances 다운로드

   - https://utteranc.es/

2. ### 새로운 Repository 생성 (Optional)

   - 그냥 같은 repository에다가 해도 상관없음

3. ### utterances에서 빈칸을 채우고 매핑방법 선택

   

4. #### 만들어진 스크립트 코드를 복사해서 포스트 레이아웃에 include

   - 스트립트 코드의 repo 항목이 내가 선택한 repository가 맞는지 확인



웹프로그래밍을 아예 모르다보니 어디다가 붙여넣기 해야하는지 햇갈렸는데 겨우 찾았다.

테마마다 다를수도 있음.

1. **/_includes 에 아래와 같은 코드를 가진 comments.html 파일을 만든다.**

   -comments.html-

```html
<script src="https://utteranc.es/client.js"
        repo="Kojungbeom/kojungbeom.github.io"
        issue-term="title"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>
```



2. **/_layouts/post.html 맨 아랫줄에 다음과 같은 코드를 추가한다.**

```html
<hr>
{% include comments.html %}
```



---

# Github Blog에 카테고리와 테마 추가하기

[devYurim님 블로그 참고]([https://devyurim.github.io/development%20environment/github%20blog/2018/08/07/blog-6.html](https://devyurim.github.io/development environment/github blog/2018/08/07/blog-6.html))

위 블로그에서는 category.html, index.html 파일을 수정해야 한다고 하셨는데,

저같은 경우는 그냥 아무것도 안하고 글에 

```html
categories:
  - Information
tags:
  - Information
```

그냥 이런식으로 해주니까 나왔습니다.

Jekyll 자체가 워낙 잘되있어서 그런듯하지만, 테마마다 다를 수 있으므로 위 블로그를 참고하세요.




