# This script tests a hypothesis about a population mean μ. The details is below.
# It is known that the average IQ of all people is 100. 
# A sample of 10 students from a large introductory statistics class yields the following IQ’s:
# 120, 108, 98, 96, 105, 110, 123, 132, 102, 90
# We are interested in determining whether or not the average IQ of all students in that class differs from 100. i.e., we want to test the hypothesis 
# H.sub(0): μ = 100 vs H.sub(1): μ ≠ 100
# where µ is the average IQ of all students in that class.

# firstly, enter the data into an object called iq_data
iq_data<-c(120,108,98,96,105,110,123,132,102,90)

# use the t.test function
t.test(iq_data,mu=100,alt="two.sided",conf.level=.95)

### Explanation of Output: 
# The argument alt="two.sided" specifies the type of alternative hypothesis, which in this case is "≠". 
# If the alternative hypothesis is "<" then the argument used would be alt="less". 
#For ">" we would use alt="greater".
# The 95% confidence interval for μ is (98.981, 117.819), i.e., the average IQ of all students in that class is estimated to be between 98.981 and 117.819 with 95% confidence. 
# This confidence interval is obtained from the formula below
# xbar ± t.sub(n−1,α/2)*s/√n
# Here, t.sub(n−1,α/2) means (n−1,α/2) is a subscript of t.
# The value of t = 2.0174 is the value of the test statistic
# t.sub(n−1) = (xbar − μ.sub(0))/(s/√n)
# where μ0 is the value of specified under the alternative hypothesis (μ0 = 100 in our example). 
# The p-value of .07444 is for the hypothesis test H.sub(0): μ = 100 vs H.sub(1): μ ≠ 100. 
# Since the p-value is greater than .05, we do not reject the null hypothesis at the 5% significance level.
# It means that there’s not enough evidence to conclude that the students' IQ is different from 100 (even though the sample mean is 108.4).

# A 'manual' approach to do the hypothesis test is below
xbar<-mean(iq_data)
s<-sd(iq_data)
n<-length(iq_data)
cbind(n,xbar,s)

mu0<-100
tval<-(xbar-mu0)/(s/sqrt(n))
tval

# pt(q, df) = the cumulative distribution function (CDF) of the t-distribution with df degrees of freedom.
pval=2*(1-pt(abs(tval),n-1))
pval

# To find the p-value we have used the pt function, 
# which calculates the area to the left of the given value under the t-curve. 
# i.e., pt(t,n) gives the area to the left of t under the tn curve (similar to the normal table, but for the t-distribution).