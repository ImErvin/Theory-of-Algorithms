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

Right off the bat I wanted to understand what the combinations function did in racket.
```Scheme
(combinations '(1 2 3 4 5))
```
The output of this was too long to show here but it was all the combinations of 1,2,3,4,5 (e.g ((1) (2) (1,2)) etc.).

I figured I could loop over each of the sublists and calculate the sum of each sublist. If it happens that it returns 0, I could store that into a new list.

I also figured if there are no negative integers in the list then there is no need to continue - as there is no possible combination of positive numbers that sum to make 0.

#### Problem Solving
Firstly I wanted to see if I could add all the elements of the combinations and return a number. I found a nifty apply function on the racket documention [1].

I understood the concept of it straight away. It took a sign and a list, and applied that sign to each element of the list e.g '(1 2 3 4) with the sign + = 10.
```Scheme
(apply + '(1 2 3 4))

> 10
```
I wanted to play around with lambda functions for this problem. I proceeded to create a lambda function that takes a list x and applies a + apply to it.
```Scheme
(define sublsum (lambda (x) (apply + x)))

(sublsum '(1 2 3 4))
> 10
```
Now I wanted to feed in the combinations to this lambda function but apply does not work on empty or size 1 lists. I started researching on how to only feed in lists that are greater than size 1 but after reading the list functions [2] I found that I could apply a filter function to a list that will perform an operation on each element and return the operations that satisfy the filter operation.

With this information I had to redesign the lambda function to return #t or #f if the apply of a sublist is equal to 0. Now I could pass in this lambda function as my first argument for filter and the combinations of a list as the second argument.

```Scheme
(define (sublsum x)
  (filter (lambda (x) (= 0 (apply + x))) (combinations x)))

(sublsum '(1 2 3 4 -5))
> '(() (2 3 -5) (1 4 -5))
```
This worked just as I wanted it to, but after further inspection I noticed that the sample provided by the problem did not include the first sublist '(). I simply added an if/else statement to return false if the list is empty.

```Scheme
(define (sublsum x)
  (filter (lambda (x)
            (if (null? x)
                #f
            (= 0 (apply + x)))) (combinations x)))

(sublsum '(1 2 3 4 -5))
> '((2 3 -5) (1 4 -5))
(sublsum '(1 2 3 4 5))
> '()
```
I was happy with this one minimalistic function.




### Reference
[1] https://docs.racket-lang.org/reference/procedures.html

[2] https://docs.racket-lang.org/reference/pairs.html#%28def._%28%28quote._~23~25kernel%29._cdr%29%29
