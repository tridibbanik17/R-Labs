# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script uses the databank data set to test the hypothesis that the average systolic blood pressure is different for men than for women in the sampled population.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# use the t.test function
t.test(systolic~gender,data=databank,alt="two.sided",
       conf.level=.95,var.equal=FALSE,na.action="na.omit")

# The argument alt="two.sided" specifies the type of alternative hypothesis, 
# which in this case is "≠". 
# If the alternative hypothesis is "<" then the argument used would be alt="less". 
# For ">" we would use alt="greater".

### Explanation of Output: 
# This is the output for testing the hypothesis of equal means, 
# H0: μ1 = μ2 vs H1: μ1 ≠ μ2, assuming unequal variances. 
# When we assume unequal variances, the test statistic is
# td.f. = (x1bar − x2bar)√((s1^2/n1)+(s2^2/n2))
# where
# d.f. = ((A + B)^2)/(((A^2)/(n1−1))+((B^2)/(n2−1))), A = ((s1)^2)/(n1), B = ((s2)^2)/(n2)
# The value of this test statistic is given in the output as t = -0.64926. 
# Since the p-value of 0.5177 is greater than .05, we do not reject the null hypothesis at the 5% level. 
# Therefore we cannot conclude that there is a difference in systolic blood pressure between males and females in the sampled population. 
# Also, the 95% confidence interval for μ1 − μ2 is given as (-6.734137,3.414137). 
# Since this confidence interval contains the value 0, we again conclude that we cannot reject the null hypothesis.