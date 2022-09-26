#1
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
         35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
         51, 35, 24, 33, 41)
age

#2
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
         35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
         51, 35, 24, 33, 41)
reciprocal <- 1/age
reciprocal

#3
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
         35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
         51, 35, 24, 33, 41)
new_age <- c(age, 0, age)
new_age
#It repeats the numbers inside the object age.

#4
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
         35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
         51, 35, 24, 33, 41)
sort(age)

#5
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29,
         35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41,
         51, 35, 24, 33, 41)
min(age)
max(age)

#6 
data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3, 2.5, 2.3, 2.4, 2.7)
data

#7
num1 <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3, 2.5, 2.3, 2.4, 2.7)*2
num1

#8.1
seq(1:100)

#8.2
number <- 20:60
print(number)

#8.3
number <- 20:60
mean(number)

#8.4
number <- 50:91
sum(number)

#8.5
seq(1:1000)

#8 C.
seq(1, 1000, by = 100)

#9
#filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100))
# The code results in error while using the letter (f).

Filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100))

#10
number <- 100:1
print(number)

#11
multiple_by3 <- c(3,6,9,12,15,18,21,24)
multiple_by5 <- c(5,10,15,20)
sum(multiple_by3)
sum(multiple_by5)
sum(multiple_by3, multiple_by5)

#12
{ x <- 0+ x + 5 + }
#Output is ERROR

#13
score <- c(72,86,92,63,88,89,91,92,75,75,77)
score[2]
score[3]

#14
a = c(1,2,NA,4,NA,6,7)
print(a,na.print="-999")
#The NA change to -999 

#15.
class(x) <- "foo"
name = readline(prompt="Input your name: ")
age = readline(prompt="Input your age: ")
print(paste("My name is",name, "and I am",age ,"years old."))
print(R.version.string)
