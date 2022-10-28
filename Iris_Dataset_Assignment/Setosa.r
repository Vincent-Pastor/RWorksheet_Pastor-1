df1 <- data.frame(iris)
df1

sbst <- subset(df1, Species == 'setosa' )
sbst

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

# Total mean of each species.
mean(setosamean)

# Mean of each characteristics of the species.
mean(slindex)
mean(swindex)
mean(plindex)
mean(pwindex)