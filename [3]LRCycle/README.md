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

#### Problem Solving

### Reference
