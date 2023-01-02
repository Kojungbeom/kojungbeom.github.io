# 2023-1-1-[Leet]-#198-House-Robber-EJ01

# [문제]

You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and **it will automatically contact the police if two adjacent houses were broken into on the same night**.

Given an integer array `nums` representing the amount of money of each house, return *the maximum amount of money you can rob tonight **without alerting the police***.

[문제 해석]

input: integer array = amount of money of each house

output: maximum amount of money without alerting police

인접한 집은 갈 수 없음 !

## example 1:

```
Input: nums = [1,2,3,1]
Output: 4
Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).
Total amount you can rob = 1 + 3 = 4.
```

## example 2:

```
Input: nums = [2,7,9,3,1]
Output: 12
Explanation: Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
Total amount you can rob = 2 + 9 + 1 = 12.
```

## Constraints

- `1 <= nums.length <= 100`
- `0 <= nums[i] <= 400`

# [풀이]

```python
class Solution:
    def rob(self, nums):
'''
1. rray가 홀수인 경우 → idx가 홀수인 것들만 pick 
2. array가 짝수인 경우 → 앞부터, 뒤부터인지 둘 중에 뭐가 더 큰지 비교
'''
        #짝수인 경우
        f_sum = 0
        b_sum = 0
        if len(nums) % 2 == 0:
            for idx in range(len(nums)):
                if idx % 2 == 0:
                    f_sum += nums[idx]
                else:
                    b_sum += nums[idx]
                    
            if f_sum > b_sum:
                return f_sum
            else:
                return b_sum
        else:
            for idx in range(len(nums)):
                if idx % 2 == 0:
                    f_sum += nums[idx]
                else:
                    b_sum += nums[idx]
            if f_sum > b_sum:
                return f_sum
            else:
                return b_sum
```

→ test case 40/70만 맞음 ..

→틀린 이유 : [2,1,1,2]과 같은 case에서는 짝수번째 수와 홀수번째 수를 더해도 결과는 같기 때문에 비교 불가능!

### [정답]

- 누적한 최댓값을 비교 → 동적프로그래밍
- 동적프로그래밍 풀이 방식 → dp table 사용

```python
class Solution:
		def get_max(self, arr):
			return max(arr)
    def rob(self, nums):
			#요소가 하나밖에 없기 때문에 그대로 return
			if len(nums) == 1:
				return nums[0]
			#길이가 2 이상일 경우
			for i in range(2, len(nums)):
				#nums에 누적하여 저장
				nums[i] = self.get_max(nums[:i-1]) + nums[i]
			#둘 중 최댓값을 비교
			return max(nums[-1], nums[-2])
```

1. dp를 사용하여 최대 가치 저장
2. nums의 길이가 1일 경우 arr그대로 return
3. 인접한 요소에 접근하기 않기 위해 nums에 i번째 요소와 (i-1)번째 요소를 더하고 마지막에 nums에 저장된 최댓값들 비교