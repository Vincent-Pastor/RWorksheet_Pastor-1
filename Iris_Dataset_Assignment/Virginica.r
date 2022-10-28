df3 <- data.frame(iris)
df3

sbst3 <- subset(df3, Species == 'virginica' )
sbst3


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

# Total mean of each characteristics.
mean(virginicamean)

# Mean of each characteristics of the species.
mean(slindex3)
mean(swindex3)
mean(plindex3)
mean(pwindex3)
