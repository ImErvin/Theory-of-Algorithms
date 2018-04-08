### Hamming Distance
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write a function hamming-distance in Racket that takes two lists and returns the
    number of positions in which they differ.
    
    For example:
```scheme
(hamming-distance (list 1 0 1 0 1 1 1 0) (list 1 1 1 1 0 0 0 0))
5
```

### Problem Breakdown

#### What is a Hamming Distance
The hamming distance is calculated between two strings of equal length (where string are a collection of base2 numbers). The calculation compares the nTh element of each string to see if the corresponding elements are different. [1]

#### What is the problem asking of me?
The problem is asking me to compare each element of a list to it's corresponding element and determine if the element differs (kind of like XOR). 

This problem does not specify to write a function from *scratch* - so I'm making the assumption that I can use any racket pre-built function.

#### Further Examination

#### Problem Solving

### Reference
[1] https://en.wikipedia.org/wiki/Hamming_distance

