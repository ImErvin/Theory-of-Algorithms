### Sublsum
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write a function sublsum in Racket that takes a list (of integers) as input and returns a list of sublists of it that sum to zero. For this problem, you can use the
    combinations built-in function. Note the order of the sublists and their elements
    doesn’t matter.
    For Example:
```scheme
(sublsum (list 1 2 3 4 -5))
'((2 3 -5) (-5 1 4))

(sublsum (list 1 2 3 4 5))
'()
```

### Problem Breakdown

#### What is the problem asking of me?
This problem is asking me to take a list of integers and return all the sublists of that list that when adding all the integers of the sublist, it produces 0.

This problem does not specify to write a function from *scratch* - so I'm making the assumption that I can use any racket pre-built function.

There is a hint in the question to use the combinations function.

#### Further Examination


#### Problem Solving

### Reference
