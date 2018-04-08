### Hamming Weight
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write a function hamming-weight in Racket that takes a list l as input and returns
    the number of non-zero elements in it. 
    
    For example:
```scheme
(hamming-weight (list 1 0 1 0 1 1 1 0))
5
```

### Problem Breakdown
#### What is a Hamming Weight
The hamming weight is the amount of symbols in a string (where a string is a combination of base2 numbers) that are not 0. The hamming weight is also used for hamming distance. [1]

The hamming weight is used in several areas such as [1]:
1. Determining the path lengths between nodes in chord distributed hash tables
2. IrisCode lookups
3. Computer chess programs

#### What is the problem asking of me?
From a racket perspective I need to be able to take a list of binary numbers and produce an integer of how many of those binary numbers does not equal 0.

This problem does not specify to write a function from *scratch* - so I'm making the assumption that I can use any racket pre-built function.

#### Further Examination
I figured for this problem I could use 

#### Problem Solving

### Reference
[1] https://en.wikipedia.org/wiki/Hamming_weight

