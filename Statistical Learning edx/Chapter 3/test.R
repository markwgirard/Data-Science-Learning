library(ISLR)
data(Auto)
lm.fit=lm(mpg~. -name, data = Auto)
summary(lm.fit)

