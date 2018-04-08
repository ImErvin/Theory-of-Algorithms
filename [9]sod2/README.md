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

#### Problem Solving

### Reference


