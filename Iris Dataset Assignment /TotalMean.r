df4 <- data.frame(iris)
df4

  slindex <- iris$Sepal.Length[1:50]
  slindex

  swindex <- iris$Sepal.Width[1:50]
  swindex

  plindex <- iris$Petal.Length[1:50]
  plindex

  pwindex <- iris$Petal.Width[1:50]
  pwindex

    setosamean <- c(slindex, swindex, plindex, pwindex)
    setosamean

  slindex2 <- iris$Sepal.Length[51:100]
  slindex2

  swindex2 <- iris$Sepal.Width[51:100]
  swindex2 

  plindex2 <- iris$Petal.Length[51:100]
  plindex2

  pwindex2 <- iris$Petal.Width[51:100]
  pwindex2

    versicolormean <- c(slindex2, swindex2, plindex2, pwindex2)
    versicolormean

  slindex3 <- iris$Sepal.Length[101:150]
  slindex3

  swindex3 <- iris$Sepal.Width[101:150]
  swindex3 

  plindex3 <- iris$Petal.Length[101:150]
  plindex3

  pwindex3 <- iris$Petal.Width[101:150]
  pwindex3

    virginicamean <- c(slindex3, swindex3, plindex3, pwindex3)
    virginicamean

totalmean <- c(setosamean, versicolormean, virginicamean)
totalmean

mean(totalmean)