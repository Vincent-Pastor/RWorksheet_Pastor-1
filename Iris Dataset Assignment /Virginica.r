df3 <- data.frame(iris)
df3

df3[df3$Species == 'virginica' ,]

sbst <- subset(df3, Species == 'virginica' )
sbst


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

mean(virginicamean)