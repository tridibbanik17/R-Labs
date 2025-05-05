# One-Way ANOVA (Analysis of Variance) is a statistical method used to determine 
# whether there are statistically significant differences between the means of three or more independent (unrelated) groups.
# Suppose that we want to test 4 different drugs that were designed to speed up recovery time for patients who have contracted Covid-19. 
# A group of 27 patients who had contracted Covid-19 were each randomly assigned to receive one of 4 drugs. 
# The sample of recovery times in days within each group is given as follows.

# Drug 1	Drug 2	Drug 3	Drug 4
# 17.5	  15.8	  15.9	  16.2
# 16.2	  17.3	  16.2	  16.8
# 16.9	  18.2	  15.8  	15.7
# 17.4  	17.1  	14.7  	14.9
# 19.2  	17.8  	18.3  	16.2
# 18.3	          17.2  	17.1
# 17.6      	    16.2  	15.8
#                         15.4

# firstly, enter the data into R
sample1<-c(17.5,16.2,16.9,17.4,19.2,18.3,17.6)
sample2<-c(15.8,17.3,18.2,17.1,17.8)
sample3<-c(15.9,16.2,15.8,14.7,18.3,17.2,16.2)
sample4<-c(16.2,16.8,15.7,14.9,16.2,17.1,15.8,15.4)

recovery.time<-c(sample1,sample2,sample3,sample4)
recovery.time

# Notice that we have 'stacked' the data, meaning that the data is all combined into one variable.

# create a second variable that tells us which sample each observation from the first variable came from.
sample<-c(rep("1",7),rep("2",5),rep("3",7),rep("4",8))
sample

# Note that rep("1",7) is a quick way of writing "1","1","1","1","1","1","1". 
# This tells R that the first 7 observations came from sample 1. 

# The aov function carries out an analysis of variance
anova<-aov(recovery.time~sample)
# Normal Probability Plot
plot(anova,2,pch=19,col="blue")
# Residuals vs Fitted Plot
plot(anova,1,pch=19,col="red")

# Explanation of the Plots: 
# We first look at the above normal probability plot (or Q-Q Residuals plot). 
# Since the points fall roughly along a straight line, it appears the assumption that the populations follow a normal distribution is a reasonable one. 
# The Residuals vs Fitted plot is used to check the assumption of equal population variances. 
# Here we look at the amount of variation (vertical spread of the data) for each of the four samples. 
# Since the amount of variation is roughly the same for each sample, the assumption of equal variances seems to be a reasonable one.

# an Anderson-Darling test for normality can also be done
library("nortest")
ad.test(anova$residuals)

# Explanation of Output:
# Since the p-value is greater than .10, we again conclude that the normality assumption is reasonable.

# a more formal test of the equal variance assumption using Bartlett's test can be done
bartlett.test(recovery.time~sample)

# Explanation of Output:
# This output includes a p-value for the test of equal variances assuming that the data follow a normal distribution. 
# Since the p-value of 0.737 is greater than .05 we do not reject H0: σ1^2 = σ2^2 = σ3^2 = σ4^2, 
# and therefore we again conclude that the assumption of equal variances is reasonable.

# Since all of the assumptions are checked, and they appear to be reasonable, we can look at the ANOVA F-test.
summary(anova)

# Explanation of Output:
# The p-value (Pr(>F)) of 0.0137 given in the ANOVA table is for the test
# H0: μ1 = μ2 = μ3 = μ4 vs H1: μi ≠ μj for at least one pair (i,j).
# Since the p-value is less than .05 we can reject the null hypothesis at the 5% significance level. 
# Therefore we conclude that there are differences in mean recovery time for the different drugs.

# Since the null hypothesis was rejected in the overall F-test, 
# we can now do Bonferroni multiple comparisons to see where the differences exist.
pairwise.t.test(recovery.time,sample,p.adj="bonf")

# Explanation of Output:
# The above output gives bonferroni p-values for the hypothesis tests 
# H0: μi = μj vs H1:μi ≠ μj for each pair (i,j). 
# The only significant p-value (using α = .05) is for 1 vs 4, 
# with a p-value of 0.022 < .05. 
# Therefore we reject the hypothesis H0: μ1 = μ4. 
# All other pairs of means are not significantly different.