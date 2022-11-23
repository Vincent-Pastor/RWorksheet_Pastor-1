# RWORKSHEET 3b 

# 1. Create data frame using the table below.
# a. Write the codes. 

Respondents <- c(seq(1,20))
Sex <- c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2)
FathersOccupation <- c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1)
PersonsatHome <- c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6)
SiblingsatSchool <- c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2)
TypesofHouse <- c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2)

df <- data.frame(Respondents, Sex, FathersOccupation, PersonsatHome, SiblingsatSchool, TypesofHouse)
df

# b. Describe the data. Get the structure or the summary of the data.

summary(df)

# c. Is the mean number of siblings attending is 5? - No


# d. Extract the 1st two rows and then all the columns using the subsetting functions. Write the codes and its output.

sbst0 <- subset(df[1:2, 1:6])
sbst0

# e. Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its result.

Respondents <- c(seq(1,20))
Sex <- c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2)
FathersOccupation <- c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1)
PersonsatHome <- c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6)
SiblingsatSchool <- c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2)
TypesofHouse <- c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2)

df <- data.frame(Respondents, Sex, FathersOccupation, PersonsatHome, SiblingsatSchool, TypesofHouse)
df

content4 <- subset(df[c(3,5), c(2,4)])
content4

# f. Select the variable types of houses then store the vector that results as types_houses. Write the codes.

types_houses <- df$TypesofHouse
types_houses

# g. Select only all Males respondent that their father occupation was farmer. Write the codes and its output.

farmer <- subset(df[c(1:20), c(2,3)])
farmer

male <- subset(df,Sex == '1' & FathersOccupation == '1')
male

malefarmer<- male[c(2,3)]
malefarmer


# h. Select only all females respondent that have greater than or equal to 5 number of siblings attending school. Write the codes and its outputs.

shl <- subset(df[c(1:20), c(2,5)])
shl

female <- shl[df$SiblingsatSchool >= '5',]
female


# 2. Write a R program to create an empty data frame. Using the following codes:
#  df = data.frame(Ints=integer(), Doubles=double(), Characters=character(), Logicals=logical(), Factors=factor(), stringsAsFactors=FALSE) print("Structure of the empty dataframe:") print(str(df))

df = data.frame(Ints=integer(),
                Doubles=double(), Characters=character(),
                Logicals=logical(),
                Factors=factor(),
                stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))

# a. Describe the results. - The data frame has zero columns, 5 rows and zero level.

# 3. Interpret the graph.
# Figure 1: Sentiments of Tweets per day - Donald Trump 
# - There are more negative comments than neutral and positive comments from July 14 to July 21.
