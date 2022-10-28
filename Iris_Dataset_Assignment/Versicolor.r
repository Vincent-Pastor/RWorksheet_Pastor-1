df2 <- data.frame(iris)
df2

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

# Total mean of each species.
mean(versicolormean)

# Mean of each characteristics of the species.
mean(slindex2)
mean(swindex2)
mean(plindex2)
mean(pwindex2)


