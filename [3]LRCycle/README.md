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

> '(4)
```
To my surprise *(cdr)* returned a list/pair even when it was just a single number. I checked to see if it was producing a pair/list using *(pair? ..)*/*(list? ..)*. I was not able to find material as to why this was happening but I kind of got that this could be used to reconstruct a list or I could use *(car)* on it to turn it into a single number.

I then wanted to see if I could have a control for a recursive loop for reconstructing a list. After some reading on the racket documentation [1] I figured I could check to see if the output was *(null? ..)* if so it means I have reached the end of the - this could be used to stop a recursive call.

At this point I figured I had enough of ammo to tackle the problem.


#### Problem Solving
##### LCYCLE
I started off by trying to figure out how to do lcycle first. After a lot of a work around attempting to get it done in one function without using append I figured it to be impossible (to my knowledge atleast).

I started off by trying to create a function that will recursively delete a list till it's '() (or null).

```Scheme
(define (test n)
  (print n)
  (if (null? n)
      n
      (test (cdr n))))

(test '(1 2 3 4 5))
> '(1 2 3 4 5)'(2 3 4 5)'(3 4 5)'(4 5)'(5)'()'()
```
This worked but I didn't quite know where to go from here for a while, I figured maybe I could simply use *(cons)* to simply:
```Scheme
(define (test n)
  (cons (cdr n) (car n)))

(test '(1 2 3 4 5))
> ((2 3 4 5) . 1)
```
I had a pesky ".1" so I paired the *(car)* with null to produce:
```Scheme
(define (test n)
  (cons (cdr n) (cons (car n) null)))

(test '(1 2 3 4 5))
> ((2 3 4 5) 1)
```
This was closer to what I wanted but this produced a list within a list.. I researched and found that I could *(flatten)* the list but I was told that was the easy way out.

I was very stuck for what I could do from here till I figured I could take the two lists and flatten them myself by taking the concept of creating a list on the fly from [task 2](https://github.com/ImErvin/Theory-of-Algorithms/tree/master/%5B2%5DCollatzList).

I built onto the concept from task 2 using the logic of depreciating the list one element at a time as seen in the first "test" function under the **Problem Solving** heading above.
```Scheme
(define (test n)
  (test1 (cdr n) (cons (car n) null)))

(define (test1 n o)
  (if (null? n)
      o
      (cons (car n) (test1 (cdr n) o))))

(test '(1 2 3 4 5))
> '(2 3 4 5 1)
```
I passed in the elements apart from the first element as n and the first element paired with null as o. Instead of simply deleting one element at a time, I used cons to add onto a list and then delete and repeat. At the final element, simply insert the first element of the list (o) to the end of the list.

##### RCYCLE
For the Rcycle I figured I needed the last element to be the be pushed onto the start of the list so I had to retrieve the last element.

This was an easy task to solve as in the Lcycle, to check if the program was at the last item I needed to simply check if n was null. Therefore if the cdr of n was null, that will make it the second last element, so I can return n at that point.
```Scheme
(define (test2 n)
  (if (null? (cdr n))
      n
      (test2 (cdr n))))

(test2 '(1 2 3 4 5))
> '(5)
```

Now that I have the first element of the new list, I need have to figure out how to remove the last element of the list and join that list to the first element.

For this I think if I can return a list without the last element I will be a step closer as joining the new first element to the list without the last element will produce what I want.
```Scheme
(define (test3 n)
  (cons (car n) (if (null? (cdr (cdr n)))
                    null
                    (test3 (cdr n)))))

(test3 '(1 2 3 4 5))
> '(1 2 3 4)
```
Now that I have two lists I can join them using the same method as lcycle.
```Scheme
(define (test4 n)
  (test1 (test2 n) (test3 n)))

(test4 '(1 2 3 4 5))
> '(5 1 2 3 4)
```
I am happy with the result, I wish I was able to do it in one nifty little function for both lcycle and rcycle but I could not come up with a way for it. This was the only way I could see of doing it after breaking the problem down into smaller steps.

### Reference
[1] https://docs.racket-lang.org/reference/pairs.html

[2] https://github.com/theory-of-algorithms/example-scheme/blob/master/lists.rkt
