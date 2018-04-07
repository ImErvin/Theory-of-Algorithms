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
My take back from this problem is to be able to create a recursive function that will take a value N, add this number to a list. Once the number is saved in this list, I will need to perform a different operation on the number depending on if the number is odd or even.

The formula provided is:

    If N is odd  : N = 3(N) + 1

    If N is even : N = N / 2

Once one of the two operations is complete, I will feed the new value of N into the function.
#### Problem Solving

To start off I want to quickly prototype the function I have in mind in Javascript. I'm thinking that the function will take one argument "n" which will be a positive integer and use a nested If/else to perform operations on "n".

```javascript
var listOfNs = [];

function collatzlist(n){
    listOfNs.push(n);
    if(n <= 1){
	console.log(listOfNs);
	return;
    }else{
        if(n % 2 == 0){
            n = n / 2;
        }else{
            n = (3*n) + 1;
	}
	    collatzlist(n);
    }
}
```

The code above seems to work pretty well but my concern now is it in good practice in functional programming to do everything within one function or would it be a better idea to separate concern e.g collatzlist will call another function called odd which would take in an argument perform an operation on that argument (e.g return 3 * argument + 1) and return that number back to the collatzlist function for recursion.

After a little bit of research I found an answer on stackexchange [2] which said that "If the function is made of sequential steps aimed to a final result, then no need to split it, even if it's relatively long. But if the functions does one thing, then another, then another and then another, with conditions, logically separated blocks, etc., it should be split. As a result of that logic, functions should be usually small."

Now that I have a clear path of what I need to do, I first need to learn how to work with lists in Racket, it seems like I will only need to know how to create a list and add onto that list.

```scheme
(list 1 2 3 4) ; create a list
(define l '( 1 2 3 4)) ; define l is a a list
l
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 null))))) ; construct a list from cons of a and b
(append '(1 2) '(3 4)) ; Add to lists together using append
(append l 1) ; Try to append 1 to the end of l produces '(1 2 3 4 . 1)
(append l (cons 1 null)) ; Successfully got rid of the . using a cons of 1 and null
```

Now that I have a fair idea of how to work with racket lists I'm going to attempt to recreate the javascript function in racket.

```scheme
(define listOfNs '())

(define (collatzlist n)
  (append listOfNs n)
  (if (<= n 1)
      listOfNs
      (if (odd? n)
          (cons n (collatzlist (odd n)))
          (cons n (collatzlist (even n))))))

(define (odd n)
  (+ (* 3 n) 1)
 )

(define (even n)
  (/ n 2)
 )

(odd 4)

(even 4)
(collatzlist 100)
```
This method worked correctly for me but I was told I could not use "append" functionality. After consulting with my lecturer I was told I should not declare a list at the top and then add to it, that was the imperative way and this is functional programming! He mentioned that using cons was the better way of doing it - I was also asked to use modulo to determine if a number is odd instead of using "odd?".

After looking back on the work I have done to construct a list, I figured the only way to create a list was to dynamically nest a cons in a recursive function and return the result at the end of the loop. 

The result I managed to come up with was:
```scheme
(define (collatzlist n)
  (cons n (if (= (- n 1) 0)
              null
              (if (= (modulo n 2) 0)
                  (collatzlist (even n))
                  (collatzlist (odd n))))))

(define (even n)
  (/ n 2)
 )

(define (odd n)
  (+ (* 3 n) 1)
 )

(collatzlist 99)
```

I'm quite happy with this solution, its pretty minimalistic and functional.

Further documentation on the code can be found in the "collatzlist.rkt" file in this repository.


### Reference
[1] https://docs.racket-lang.org/reference/pairs.html

[2] https://github.com/theory-of-algorithms/example-scheme/blob/master/lists.rkt
