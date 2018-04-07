### Left & Right Cycle
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write, from scratch, two functions in Racket. The first is called lcycle. It takes a list as input and returns the list cyclically shifted one place to the left. The second is called rcycle, and it shifts the list cyclically shifted one place to the right.

    For Example:
```scheme
(lcycle (list 1 2 3 4 5))
'(2 3 4 5 1)

(rcycle (list 1 2 3 4 5))
'(5 1 2 3 4)
```

### Problem Breakdown

#### What is the problem asking of me?
There are two functions the problem is asking me to create. The first function is a left cycle, where the first index of the list will be moved to the end of the list. The second function is a right cycle, where the last index of a list will be moved to the start of the list.

This seems like a relatively easy problem in any imperative language, but when I'm working with functional programming it seems to be a much more difficult problem.

After a little bit of research on the racket documentation [1] and revising code from Ian McLoughlin's Github [2] - I found that because of the way lists are created (collection of pairs), you may only get the first element (car) and last element (cdr) of any given pair be it in a list or not.

#### Further Examination

I figured for this problem I needed to really understand how *(car)* and *(cdr)* work. To achieve this, I took it to Dr Racket to start playing around and see what I can break and learn. 

I started by trying to retrieve the first element of a list of length 4.
```scheme
(car '(1 2 3 4))

> 1
```
It seems like when I *(car)* any list of any size it will give me the first element. My understanding is, it checks the first pair and returns the first element of that pair (size can vary but the first pair will always be the first 2 elements of the list).

I then tried to retrieve the last element of a list of length 4.
```scheme
(cdr '(1 2 3 4))

> '(2 3 4)
```
I saw that it runs a list of everything except the first element. To me that means Racket sees the second element of the list as another list? Though confusing, it made some sense because of how (cons) works. 

I immediately figured I could repeat *(cdr)* 2 more times to return the very last element.
```scheme
(cdr (cdr (cdr '(1 2 3 4))))

>'(4)
```
To my surprise *(cdr)* returned a list/pair even when it was just a single number. I checked to see if it was producing a pair/list using *(pair? ..)*/*(list? ..)*. I was not able to find material as to why this was happening but I kind of got that this could be used to reconstruct a list.

I then wanted to see if I could have a control for a recursive loop for reconstructing a list. After some reading on the racket documentation [1] I figured I could check to see if the output was *(null? ..)* if so it means I have reached the end of the - this could be used to stop a recursive call.

At this point I figured I had enough of ammo to tackle the problem.


#### Problem Solving

### Reference
[1] https://docs.racket-lang.org/reference/pairs.html

[2] https://github.com/theory-of-algorithms/example-scheme/blob/master/lists.rkt
