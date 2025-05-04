# This script creates and interprets a normal probability plot for the following data, 43, 16, 12, 15, 14, 71, 4, 4, 27, 52, 7, 7, 23, 18, 9.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# create a variable called data which contains the above observations.
data<-c(43,16,12,15,14,71,4,4,27,52,7,7,23,18,9)

# use the qqnorm function together with the qqline function to construct the normal probability plot, along with a line. 
# use the datax=T option so that the data is put on the x-axis, and the z-scores on the y-axis
qqnorm(data,pch=19,col="blue",datax=T)
qqline(data,col="green",datax=T)

# qqline adds a line to a theoretical normal probability plot which passes through the first and third quartiles (by default). 
# pch stands for 'plotting character'. pch='19' gives a solid circle.

# calculate a numerical measure of the 'closeness' of the points on the normal probability plot to a straight line using the function ad.test which is part of the nortest package. 
# ad.test performs an Anderson-Darling test for normality.
# load the nortest package and apply the Anderson-Darling test to the data
library("nortest")
ad.test(data)

# If the command doesn't work, it might be because the nortest package is not installed

### Explanation of Output:
# If the data set is a random sample from a population that is normally distributed, then the points on the normal probability plot will roughly form a straight line, and the points will be randomly scattered about this straight line. 
# In the above graph, the points do not appear to fall on the straight line drawn by R because there is a slight curved pattern to the points. 
# A quantitative measure of the "closeness" of the points to a straight line is given by the p-value for the Anderson-Darling test. 
# It is not universally agreed upon how this p-value should be interpreted. 
# One way is as follows: If the p-value is less than .05 then we can conclude that the data do not follow a normal distribution. 
# If the p-value is greater than .10 then we can conclude that the data is consistent with the population following a normal distribution, and it would be reasonable to assume that the data come from a normal population. 
# If .05 ≤ p-value ≤ .10 then the results are inconclusive. 
# In this case it would be best to collect more data from the population and then draw another normal probability plot. 
# For the example (the plot is uploaded in this repository in the Plots folder with the file name of NormalProbabilityPlot.png) we see that the p-value is less than .05,
# therefore, we conclude that the data do not come from a population that follows a normal distribution.