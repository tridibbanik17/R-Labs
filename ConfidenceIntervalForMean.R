# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script uses the databank data set to estimate the mean IQ of all the students from that school using a 98% confidence interval.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# extract the IQ variable, remove any NA's, and then find the resulting sample size n
IQ<-databank$IQ
IQ<-IQ[!is.na(IQ)]
n<-length(IQ)
n

# use the mean and sd functions to find the mean and standard deviation. Combine them in a table using the cbind command
xbar<-mean(IQ)
s<-sd(IQ)
cbind(n,xbar,s)

# find the confidence interval using the formula below
# xbar ± t.sub(n-1,α/2) * s/√n.
# To find t.sub(n-1,α/2) (which is called a quantile) use the qt function, which calculates quantiles for the t-distribution. 
# Since we are calculating a 98% confidence interval, we use α = .02. Note that n-1,α/2 is the subscript of t.
alpha<-.02
tval<-qt(1-alpha/2,n-1)
tval

# for the t.sub(n−1,α/2) value we have used qt(1-alpha/2,n-1) instead of qt(alpha/2,n-1). 
# The reason for this is that the qt function gives the t-value whose area to the left is equal to the given alpha value. 
# But our definition of t.sub(n,α) is that it is the t-value whose area to the right is equal to α. 
# Therefore t.sub(n,α) = qt(1-alpha,n).

# The confidence interval
se<-s/sqrt(n)
c(xbar-tval*se,xbar+tval*se)

# The 98% confidence interval for μ is (108.232, 112.808), i.e., the average IQ of all students at that school is estimated to be between 108.232 and 112.808 with 98% confidence.

# Alternatively, the confidence interval could be obtained using the t.test function 
t.test(IQ,conf.level=.98)
