### Chse
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write a function lstq in Racket that takes as arguments two lists l and m of equal
    length and containing numbers. It should return d, the distance given by the sum of
    the square residuals between the numbers in the lists:
    
    d = Sum(l-m)^2

    This means take the ith element of m from the ith element of l and square the result
    for all i. Then add all of those to get d.

    For example:
```scheme
(lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8))

54.61
```

### Problem Breakdown

#### What is the problem asking of me?
This problem is asking me to apply a distance function to corresponding elements of 2 lists and at the end return the sum of all the distance functions.

This problem does not specify to write a function from *scratch* - so I'm making the assumption that I can use any racket pre-built function.

#### Further Examination
Looking deeper into this function I figured I could probably use a map function to apply the distance function to the corresponding elements.


#### Problem Solving
After a bit of thinking I figured I could use the odd? function to determine if the number of 1s odd or even. Then I remembered I should use modulo instead so I started creating my map function.

My idea for the lambda function was to check if the sum of x y z % 2 = 0. If it did then return a 0 as this indicates the sum of 1s was even, or else return 1.
This worked with no instances of 1 too because 0 % 2 = 0.

I had to be careful of the order I wrote the if statement as 2 % 0 would cause an error.
```Scheme
(map (lambda (x y z)
       (if (= (modulo (+ x y z) 2) 0)
           1
           0)) (list 0 0 0 0 1 1 1 1) 
               (list 0 0 1 1 0 0 1 1) 
               (list 0 1 0 1 0 1 0 1))

> '(0 1 1 0 1 0 0 1)
```
This worked and just like the previous two questions I simply had to wrap this map function in a defined function.

```Scheme
(define (sod2 x y z)
  (map (lambda (x y z)
       (if (= (modulo (+ x y z) 2) 0)
           0
           1)) x y z))

(sod2 (list 0 0 0 0 1 1 1 1) 
       (list 0 0 1 1 0 0 1 1) 
       (list 0 1 0 1 0 1 0 1))

> '(0 1 1 0 1 0 0 1)
```
I was happy with this solution

### Reference


