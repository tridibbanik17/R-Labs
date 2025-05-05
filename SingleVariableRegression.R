# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script uses the databank data set to find a regression equation relating systolic blood pressure (y) to weight (x).
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# use the lm (linear models) command
reg<-lm(systolic~weight,data=databank)
summary(reg)
anova(reg)

### Explanation of Output: 
# The value of b0 (90.36620) is given next to (Intercept), below Estimate. 
# Below that is the value of b1 (0.26584). b0 and b1 are calculated from the formulas
# b1 = (n(Σxy)−(Σx)(Σy))/n(Σx^2)−(Σx)^2, 
# and b0 = ybar − b1*xbar.
# Therefore the regression equation is yhat = 90.36620 + 0.26584*x. 
# The t value of 7.872 next to weight and under the t value column is the value of the test statistic,
# t.sub(n−2) = r/√((1 − r^2)/(n − 2))
# for testing H0 : ρ = 0 vs H1: ρ ≠ 0. 
# (Note that r is the sample correlation coefficient and ρ is the population correlation coefficient.).
# The p-value of 4.75e-12 next to weight and under the Pr(>|t|) column is the p-value for the hypothesis test H0: ρ = 0 vs H1: ρ ≠ 0. 
# Since the p-value is less than .05, we can reject H0 and conclude that there is a significant correlation between y and x.
# The ANOVA table is given near the bottom under Analysis of Variance Table. 
# The p-value (Pr(>F)) of 4.749e-12 in the first row of the ANOVA table is the p-value for the same hypothesis test as above (i.e., H0: ρ = 0 vs H1: ρ ≠ 0), and the F value of 61.971 is the value of the corresponding test statistic, i.e.,
# F.sub(1,n−2) = MS(regression)/MS(error)
# The two above-mentioned p-values are always the same when there is only one predictor variable, 
# and the corresponding test statistics are related by t^2 = F (i.e., 7.872^2 = 61.971). 
# The value of Multiple R-squared: 0.3874 above the ANOVA table is the value of the coefficient of determination,
# R^2 = SS(regression)/SS(total) = 6231.1/(6231.1 + 9853.7) = 0.3874.

# To check the regression assumptions, we can produce a normal probability plot of the residuals
plot(reg,2,pch=19,col="blue")

### Explanation of the Normal Probability Plot: 
# This is a normal probability plot of the observed residuals ehat.sub(i) = y.sub(i) − yhat.sub(i). 
# Here, y.sub(i) means i is a subscript of y.
# Since the points lie roughly on the straight line and there does not appear to be any nonlinear pattern,
# we can conclude that the assumption that the residuals follow a normal distribution is a reasonable one.

#To check the equal variance assumption, we can look at a plot of residuals vs fitted values
plot(reg,1,pch=19,col="red")
# Explanation of the Residuals vs Fitted Values Plot: 
# This is a plot of the observed residuals ehat.sub(i) vs the fitted values yhat.sub(i), 
# and is used to check the assumption that the residuals all come from a population with the same variance. 
# If this assumption is satisfied then this graph should just be a random scattering of points, with no apparent patterns in the plot. 
# The vertical spread of the points on the plot should be roughly the same across the whole range of fitted values. 
# In the Residuals vs Fitted graph, the residuals corresponding to fitted values between 115 and 120 appear to have less variation (vertical spread) than the remaining points in the plot. 
# However, since it is not a large group of points, this could have occurred by chance and is probably not enough evidence to conclude that the assumption of equal variance is not satisfied. 
# Therefore overall, the graph does not give any strong indication that the assumption of equal variance is violated.
# It means that the assumption of equal variance is reasonable.