## (A) Loading the MASS package

library(MASS)

## (B) One Sample T-test

?chem
chem

chemdataset <- chem
str(chemdataset)
head(chemdataset)

help(t.test)

## Null HYpothesis : Mean part/million of copper in the flour is equal to 1
## Alternate Hypothesis : Mean part/million of copper in the flour is greater than 1


t.test(chemdataset,alternative = "greater",mu = 1)


## Here we can support the claim and alternate hypothesis is true
## that flour prodduction company producing whole mean flour with greater than 1 part/million



## (C) Two sample T-test

cats
catsdataset <- cats
str(catsdataset)
head(catsdataset)

male <- subset(catsdataset,Sex == "M")
male
female <- subset(catsdataset,Sex == "F")
female



## NUll Hypothesis : Body Weight of Male and Female is equal.
## Alternate Hypothesis : Body weight of male and female is not equal.

t.test(male$Bwt,female$Bwt,alternative = "two.sided")

## Pvalue = 8.831e-15 which is way less than significance level. Thus we
## reject the null hypothesis. 
## Thus the body weight of male and female cats is not equal.

##(D) Paired t-test

help(shoes)

shoes
shoesdataset <- shoes
str(shoesdataset)


## NUll Hypothesis : The mean wear of material A is equal to material B
## Alternative HYpothesis : The mean wear of material A is greater than material B

t.test(shoesdataset$A,shoesdataset$B,alternative = "greater",paired = TRUE)

## Here the p-value is 0.9957 which is greater than the significance level
## (0.05). Thus we do not reject the null hypothesis and conclude that claim is not eniugh
## to support the claim that material A wear is greater than B.


## (E) Test of equal or given opportunities

?bacteria
str(bacteria)
head(bacteria)
ncol(bacteria)
nrow(bacteria)


bacteria_dataset <- bacteria
bacteria_dataset
table(bacteria_dataset$y,bacteria_dataset$trt)


## Placebo = y + n = 84 + 12 = 96
## Drug = (y + y) + (n + n) = 93 + 31 = 124


## NUll Hypothesis : The effect of drug on bacteria is equal to placebo
## Alternate Hypothesis : The effect of drug on bacteria is greater than placebo



prop.test(x=c(93,84),n=c(124,96),alternative = "greater")

## Here the p-value is 0.9841 which is greater than significance level (0.05)
## Thus we do not reject the null  hypothesis. 
## To conclude there is not enough evidence that drug has more impact on bacteria 
## than placebo.


## F-test
?var.test
var.test(male$Bwt,female$Bwt)

