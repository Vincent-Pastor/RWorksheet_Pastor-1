df2 <- data.frame(iris)
df2

df2[df2$Species == 'versicolor' ,]

sbst2 <- subset(df2, Species == 'versicolor' )
sbst2

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

mean(versicolormean)