### Brute-Force Prime Number Distinguisher
##### Solution by Ervin Mamutov - G00311015

### Task

    Write, from scratch, a function in Racket that uses a brute-force algorithm that takes a single positive integer and return true if the number is a prime and false otherwise. 
    Call the function decide-prime.

### Problem Breakdown

#### What is a Brute-Force Algorithm?
Brute-Force search, is also sometimes called Exhaustive search, is a very general problem-solving technqiue used in computer science. This algorithm consists of systematically enumerating all possible candidaates for the solutions and checking wether each candidate satisfies the problem's statement.**[1]**

#### What is a Prime Number?
A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.**[2]** Prime numbers are a basic concept but have great uses in Computing for cryptography for example.

##### Conditions for a Prime Number

1. The number must be a positive integer larger than 1
2. When a prime number is divided by another positive integer, the result will only be a positive integer when the prime number is divided by iteself and the number 1.

#### Further Examination
This problem asks me to determine if the number being passed into the function is a prime number *using brute force*. To me this means I will need to check every number between 2 and N (where N is the number in investigation), and check if it divides into N to produce another positive natural number.

Obviously if it is divisable by another number to produce a positive natural number, then it is not a prime number as it breaks one of the conditions above.

#### Problem Solving
I started off by seeing if I could create a function that could return true or false if two numbers that are supplied as parameters divide to create a whole number.

Next I wanted to see if I could solve this problem with another programming langauge to envision the layout of the algorithm.
```javascript
var x = 37;

function decideprime(n){
	if(n == x){
		console.log("Not prime")
		return false;
    }
	if(x/n != Math.floor(x/n)){
		decideprime(n+1)
    }else{
		console.log("Is prime")
    }
}

decideprime(2)
```
This code seemed to work fine and so my next step was to replicate it in racket.


### Reference
[1] https://en.wikipedia.org/wiki/Brute-force_search

[2] https://en.wikipedia.org/wiki/Prime_number