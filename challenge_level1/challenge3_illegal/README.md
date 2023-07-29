## Bug explanation with screenshot: 
Exception handler jumps back to illegal instruction which again raises exception creating a never ending loop. 
![Bug screenshot](image.png)

## Screenshot of the fix:
![bug fix screenshot](image-1.png)

## Explanation of the fix:
In the exception handler, jump to a routine that ends the program .