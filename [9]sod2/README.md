### Chse
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write a function sod2 in Racket that takes three lists x, y and z of equal length and
    containing only 0’s and 1’s. It should return a list containing a 1 where the number of
    1’s in a given position in x, y and z contains an odd number of 1’s, and 0 otherwise.
    
    For example:
```scheme
(sod2 (list 0 0 0 0 1 1 1 1) 
      (list 0 0 1 1 0 0 1 1) 
      (list 0 1 0 1 0 1 0 1))

'(0 1 1 0 1 0 0 1)
```

### Problem Breakdown

#### What is the problem asking of me?
This problem is asking me to take 3 lists of equal lengths as inputs and output a list of base2 digits where if the 1 occurs an odd number of times in a column, add a 1 to a new list or else add a 0.

E.G: if the (car x) (car y) and (car z) is 1 then I want to return 1 and put it onto a new list. but if (car x) and (car y) are 1 but (car z) is 0, then there are an even number of 1s so I add a 0.

This problem does not specify to write a function from *scratch* - so I'm making the assumption that I can use any racket pre-built function.

#### Further Examination
Same as the last two problems, this one is going to be a map function, I'm starting to think that the purpose of the last two questions was to understand how the map function works. I have seen the map function in a lot of the imperative languages I have learned and was never able to get a grasp of how they work but now I've got a pretty decent understanding of them.

This question is going to be pretty similar to the last two but I'm guessing the if statement in the maps lambda is going to be a different.

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


