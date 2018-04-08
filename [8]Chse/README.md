### Chse
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write a function chse in Racket that takes three lists x, y and z of equal length and
    containing only 0’s and 1’s. It should return a list containing the elements of y in
    the positions where x is 1 and the elements of z otherwise. 
    
    For example:
```scheme
(chse (list 0 0 0 0 1 1 1 1) 
      (list 0 0 1 1 0 0 1 1) 
      (list 0 1 0 1 0 1 0 1))

'(0 1 0 1 0 0 1 1)

```

### Problem Breakdown

#### What is the problem asking of me?
This problem is asking me to take 3 lists of equal lengths as inputs and output a list of base2 digits where if the nth element of the first list is 1, then keep that nth element of the second list or else set the nth element of the second list to the corresponding element of the third list.

I.E: if the (car x) is 1 then I want to take the (car y) and put it onto a new list. but if the (car x) is 0 then I want to take the (car z).

This problem does not specify to write a function from *scratch* - so I'm making the assumption that I can use any racket pre-built function.

#### Further Examination
For this problem

#### Problem Solving

### Reference
[1] https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28lib._racket%2Fprivate%2Fmap..rkt%29._map%29%29

