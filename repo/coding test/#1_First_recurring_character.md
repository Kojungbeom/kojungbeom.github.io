# First Recurring Character

[CS Dojo Youtube Channel](https://www.youtube.com/watch?v=GJdiM-muYqc)

2020/9/11 추움

Here's coding interview question from Google.  This is a fairly simple problem, so it's probably a sort of questions that's often asked on a phone interview. And here's the problem. you're given a string. you're supposed to write a function that takes the string and return the first recurring character in that string. For example if you're given this string as the input `ABCA`, there's only one recurring character in this string, `A`. So your function should return `A`. If you're given this string, `BCABA`, you see that there are two recurring characters, `B` and `A`. And the first recurring character is `B`. So you should return `B` from your function. If you're given this string `ABC`, there's no recurring character in this string. So your function should return either null or none depending on the language which you're using. Now for practice, i would recommend that you pause this video right here, think about for a second, and then come back to the video.

Now when you're given this problem, initially you may come up with naive solution like this one. In our naive solution, we're going to first check the first character in the given string. For example, this string on the screen, the first character in this string is `D`, and we're going to ask ourselves is there another occurrence of the same character `D` in the subsequent characters. We can check this character by character and the answer is "No, there's no other occurrence of `D`, so we can move on to the next character, and then we can go through the same process. Ask ourselves "is there another occurrence of `B` in the subsequent character, check that character by character, and once we get to this other occurrence of `B`, we'll know that `B` is the first recurring character in this string, so we can just return `B` from our function, and we're done. With this naive solution, we're essentially checking every potential pair of character in this string to see if there's any recurring character. And so the number of pairs we need to check with this naive solution would be n choose 2 or n times n-1 divided by 2 which is equal to big O of n square. And so the time complexity or the runtime for this algorithm would be big O of n square. Let's see if we can do better than that.

And here's a more efficient solution to this problem. Instead of checking every potential pair of characters, we're going to go through this string only once from left to right, character by character. And as we see a character, we're going to store it in a data structure such as a set, a dictionary, or hash table to show that we've seen this character already. So for example, when we're examining first character `D`, we're going to store it, let's say in a hash table. And in a hash table, we need a (key value) pair, so we're going to use the character as the key, and value could be anything, but let's just use 1 to show we've seen this character once. And when we go to the next character, in this case `B` right here, we need to first ask ourselves "Have we seen this character already before this character.". And we can do that with this hash table, And the answer is "No". Because `B` is not in this hash table yet. So we're going to put `B` in this hash table as the key, and the value will be 1 again to show that we've seen this character once. We'll keep going like that, until we get to a character that we've seen already which is the second occurrence of `B` right here in this case. And we know that we've seen this character already because it's already in the hash table of course, And at that point, we can return `B` in this particular case, and we're done. With this solution, because we only go through this string once from left to right, the time complexity or the runtime for this algorithm is big of n where n is the number of characters in the string. Now let's see what this solution by look like in code. we're going to define our function "First recurring", which takes the given string of course. For example, for this one, we turns the first recurring character in that string. we're going to use pseudo code to explain this code. The first step in our function is to define "counts" which is the dictionary or the hash table we're going to use to keep track of each character that we've seen. And then we're going to run `for loop` for each character in the given string or fork `char` in given string, and then if this character `char` is already in the dictionary or the hash table, then that means this is the first recurring character, so return that character. And if not, for example, if we're examining this first character in this particular example `D`, put that character as a key in this dictionary or hash table, and the value corresponding to that will be 1. And again this could be anything, but i am just using 1 to show that we've seen this character once. And here you might notice that i am not using else statement here, but that's just a style issue, so you could use it if you would like to. Now after this for loop, if we haven't returned yet, that means there is no recurring character in this string. So in that case, either return `None` or `Null` depending on the language. And that's my solution.
