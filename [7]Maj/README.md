### Maj
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write a function maj in Racket that takes three lists x, y and z of equal length and
    containing only 0’s and 1’s. It should return a list containing a 1 where two or more
    of x, y and z contain 1’s, and 0 otherwise.
        
    For example:
```scheme
(maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))

'(0 0 0 1 0 1 1 1)
```

### Problem Breakdown

#### What is the problem asking of me?
This problem is asking me to take 3 lists of equal lengths as inputs and output a list of base2 digits where if two or more corresponding elements in the three lists have a one, then produce a 1 in the output list - or else produce a 0.

This problem does not specify to write a function from *scratch* - so I'm making the assumption that I can use any racket pre-built function.

#### Further Examination
After of some of the permitted functions, I noticed map was included but I have not used it yet - so I assumed this problem needed to be mapped.

I played around with map to see how it works.
```Scheme
(map (lambda (x) (+ x 1)) '(1 2 3))
> '(2 3 4)

(map (lambda (x y z) (+ x y z)) '(1 0 1 0 0 1)  '(0 0 1 1 0 1) '(1 0 1 0 0 0))
> '(2 0 3 1 0 2)
```
It seemed to apply a lambda function to all elements of a list and produce a new list, now I figured I could pass in 3 lists and add all the elements together to produce a new list.

If the new list's element was greater than 1 then I could assume the figure 1 appeared more than once (twice or more).

#### Problem Solving
With the knowledge above I figured I could then map the new list and add a 0 or 1 depending on the values in the first map output.

i.e: '(1 0 2 2 3 0) = each element could be parsed and checked if it's greater than 1, if so map a 1 to the new list otherwise map a 0.

So I came up with the following solution. It was basically a nested map function where the first map applied a lambda function that took an element, checked if it was greater than 1 - if so return 1 else return 0. and the list argument for the first map function was the map function from **Further Examination** where I simply add 3 corresponding elements together.
```Scheme
(map 
     (lambda (x)
       (if (> x 1)
           1
           0))
     (map
      (lambda (x y z)
        (+ x y z))
      (list 0 0 0 0 1 1 1 1)
      (list 0 0 1 1 0 0 1 1)
      (list 0 1 0 1 0 1 0 1)))

> '(0 0 0 1 0 1 1 1)
```
This produced the correct output now it was just a matter of defining a function called maj which takes 3 lists as input.

```Scheme
(define (maj x y z)
  (map (lambda (x)
         (if (> x 1)
           1
           0))
       (map (lambda (x y z) (+ x y z)) x y z)))


(maj (list 0 0 0 0 1 1 1 1)
      (list 0 0 1 1 0 0 1 1)
      (list 0 1 0 1 0 1 0 1))

> '(0 0 0 1 0 1 1 1)
```
This worked fine but I figured there probably is no need to double map it because I could do both lambda operations in one. I simplified the solution to:
```Scheme
(define (maj x y z)
  (map (lambda (x y z)
         (if (> (+ x y z) 1)
           1
           0)) x y z))

(maj (list 0 0 0 0 1 1 1 1)
      (list 0 0 1 1 0 0 1 1)
      (list 0 1 0 1 0 1 0 1))
> '(0 0 0 1 0 1 1 1)
```
I was happy with this solution.


### Reference
[1] https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Fmap..rkt%29._map%29%29

