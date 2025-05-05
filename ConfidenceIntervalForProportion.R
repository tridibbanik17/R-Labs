# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script uses the databank data set to estimate the proportion p of all the students from that school whose IQ is greater or equal to 120 using a 99% confidence interval.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# extract the IQ variable, remove any NA's, and then find the resulting sample size n
IQ<-databank$IQ
IQ<-IQ[!is.na(IQ)]
n<-length(IQ)
n

# find the number of 'successes' x by forming a vector which we call successes containing just those observations that are greater than or equal to 120
successes<-IQ[IQ>=120]
successes

x<-length(successes)
x

# find the confidence interval using the formula below
# phat ± z.sub(α/2) * √(phat*(1-phat)/n).
# To calculate z.sub(α/2) (which is called a quantile) use the qnorm function, which calculates quantiles for the normal distribution. 
# Since we are calculating a 99% confidence interval, we use α = .01. Note that α/2 is the subscript of z.
alpha<-.01
zval<-qnorm(1-alpha/2)
zval

# for the z.sub(α/2) value we have used qnorm(1-alpha/2) instead of qnorm(alpha/2). 
# The reason for this is that the qnorm function gives the z-value whose area to the left is equal to the given alpha value. 
# But our definition of z.sub(α) is that it is the z-value whose area to the right is equal to α. 
# Therefore z.sub(α) = qnorm(1-alpha).

# The confidence interval
phat<-x/n
se<-sqrt(phat*(1-phat)/n)
c(phat-zval*se,phat+zval*se)

# The 99% CI (0.096967, 0.303033) tells us that the proportion of students at that school whose IQ is 120 or greater is estimated to be between 9.7% and 30.3% with 99% confidence.