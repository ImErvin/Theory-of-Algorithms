### Collatz Conjecture
##### Solution by Ervin Mamutov - github.com/imervin

### Task

    Write, from scratch, a function in Racket that takes a positive integer n0 as input
    and returns a list by recursively applying the following operation, starting with the
    input number.

    End the recursion when (or if) the number becomes 1. Call the function collatz-list.
    So, collatz-list should return a list whose first element is n0, the second element
    is n1, and so on.

### Problem Breakdown

#### What is the Collatz Conjecture?
This conjecture is named after Lothar Collatz who introduced the concept in 1937. The algorithm is: take any positive integer n. Then each term is obtained from the previous term as follows: if the previous term is even, the next term is one half the previous term. Otherwise, the next term is 3 times the previous term plus 1. The conjecture is that no matter what value of n, the sequence will always reach 1. [1]

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
#lang racket
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

I'm quite happy with this solution, It seems to be pretty minimalistic and functional.

Further documentation on the code can be found in the "collatzlist.rkt" file in this repository.


### Reference
[1] https://en.wikipedia.org/wiki/Collatz_conjecture#Visualizations

[2] https://softwareengineering.stackexchange.com/questions/308108/when-is-it-appropriate-to-make-a-separate-function-when-there-will-only-ever-be
