## Bug explanation with screenshot: 
Issue was test not exiting out of loop because it keeps looping and there is no code added to exit out of the loop.
![bug screenshot](image-1.png)

## Screenshot of the fix:
![bug fix screenshot](image-2.png)

## Explanation of the fix:
Added a decrementing counter initialized to 3, decrement by 1 on each iteration and break out of the loop if the counter reaches zero. Counter initialized to 3 since there are 3 testcases.

