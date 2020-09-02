## helper/lineno.html

```
{% capture code_content_with_lineno %}{{ div_tag_begin }}<table style="margin: 0px"><tbody><tr><td class="gutter"><pre>{{ lineno }}</pre></td></td><td class="code">{{ code_content }}</td></tr></tbody></table>{{ div_tag_end }}{% endcapture %}
  {% assign source = source | replace: code_content, code_content_with_lineno %}
{% endfor %}

{% assign lineno = source %}
```

- `<pre>{{ lineno }}</pre></td>`이 부분이 없어질 경우, 코드박스에 줄번호가 사라짐



