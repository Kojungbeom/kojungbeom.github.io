# 2022-12-30-[Leet]-#20-Valid-Parantheses

# [문제]

Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid.

An input string is valid if:

1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.
3. Every close bracket has a corresponding open bracket of the same type.

[문제해석]

주어진 괄호의 짝이 맞고, 순서가 맞을 경우 True 반환, 아닐 경우 False return

## example 1:

```
Input: s = "()"
Output: true
```

## example 2:

```
Input: s = "(]"
Output: false
```

## constraints:

- `1 <= s.length <= 104`
- `s` consists of parentheses only `'()[]{}'`.

# [풀이]

input: (string) parantheses

output: True / False

- stack flow
1. stack에 무엇을 넣어줄 것인지 → input 괄호
2. 언제 stack을 pop  → open bracket에 해당하는 close bracket과 for문의 괄호 비교할 때 
3. 무엇을 반환 → dict를 보고 같은지 틀린지 판단!

```python
class Solution:
    def isValid(self, s: str) -> bool:
			dict = {'{': '}', '[' : ']', '(' : ')'}
			
			'''
			len(stack) > 0 -> pop
			stack.append(다음 괄호)
			'''

			stack = []
			for i in s:
				#1. input = '(]', i = '('
				#3. i = ']'
				#open bracket을 만났을때
				if i in dict.keys():
					stack.append(i) #2. stack = ['(']
				#open bracket을 만나지 않았을 경우
				else:
					#4. len(stack) > 1, ']' != ')'
				  if len(stack) == 0 or i != dict[stack.pop()]:
						return False #5. return False
```

- 유심히 생각해야 하는 것

** 중요 **

1. 괄호의 순서가 맞는지 어떻게 알까? → open bracket이 먼저 나왔는지 확인
2. 괄호의 짝이 맞는지 어떻게 확인할까 → dict로 미리 괄호의 짝을 지정!

```python
class Solution:
    def isValid(self, s: str) -> bool:
			dict = {'{': '}', '[' : ']', '(' : ')'}
			
			'''
			len(stack) > 0 -> pop
			stack.append(다음 괄호)
			'''

			stack = []
			for i in s:
				#1. input = '(]', i = '('
				#3. i = ']'
				#open bracket을 만났을때
				if i in dict.keys():
					stack.append(i) #2. stack = ['(']
				#open bracket을 만나지 않았을 경우
				else:
					#4. len(stack) > 1, ']' != ')'
				  if len(stack) == 0 or i != dict[stack.pop()]:
						return False #5. return False
			
			#s = '[[[' or s = '{[[[(' => open bracket만 계속해서 저장될 때!
			if len(stack) != 0:
				return False
			else:
				return True
```