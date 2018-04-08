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
This problem is very similar to the previous hamming-weight problem but rather than checking if an element is 0, I can check if element 1 and element 2 are equals, if so I can increment a counter and at the end return the counter value.

I can also assume that the input will always be lists of equal length.

#### Problem Solving
Since I knew where I wanted to start I skipped further examination and jumped into the problem solving.

I wanted to create a lambda function that took two numbers and compared them for equality.
```Scheme
(define helper
  (lambda (x y) (= x y)))

(helper 1 1)
> #t
```
This worked fine and I could use this as a predicate for my counter function.

My next step was to create the counter function. The logic I had in mind was to have a nested if statement, the first if would check if we're at the end aka check if either list was null. 

The next would simply check if the first element of both lists satisfied the helper function, if so it would simple depreciate the list by feeding the CDR of the two lists back into the function. If it did not satisfy the predicate, it would increment and pass back repeat the list depreciation. 
```Scheme
(define (hamming-distance x y)
  (if (null? x)
      0
      (if (helper (car x) (car y))
          (hamming-distance (cdr x) (cdr y))
          (+ 1 (hamming-distance (cdr x) (cdr y))))))
 
 (hamming-distance '(1 0 1 0 1 1 1 0) '(1 1 1 1 0 0 0 0))
 > 5
```
This worked and produced the correct output and after consulting with my lecturer, there was an error when creating the tasks and all most be written from scratch - this was the best solution I could come up with using the functions that are allowed.



### Reference
[1] https://en.wikipedia.org/wiki/Hamming_distance

