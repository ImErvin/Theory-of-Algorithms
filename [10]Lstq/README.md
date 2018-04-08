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

```Scheme
(map (lambda (x y)
       (* (- x y) (- x y)))
     (list 4.5 5.1 6.2 7.8)
     (list 1.1 -0.1 6.1 3.8))

> '(11.559999999999999
    27.039999999999992
    0.010000000000000106
    16.0)
```
Seems to be working correctly.

#### Problem Solving
Now that I have a list of values, I need to create a method of summing all the values together and returning the total.

```Scheme
(define (sum x)
  (if (null? x)
      0
      (+ (car x) (sum (cdr x)))))
```
This produces "54.61" when I pass in the list produced in the map function.

All I need to do now is wrap the map function into a defined function.

```Scheme
(define (sum x)
  (if (null? x)
      0
      (+ (car x) (sum (cdr x)))))

(define (lstq x y)
  (sum (map (lambda (x y)
       (* (- x y) (- x y))) x y)))

(lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8))

> 54.61
```
This produced what I expected - I could have also used the apply function instead of sum. I was happy with this solution

### Reference


