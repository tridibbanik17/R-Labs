# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script performs exploratory data analysis (EDA) using boxplots and descriptive statistics on the databank dataset.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# obtain boxplots of the weight variable in the databank data set grouped by gender.
# To create a boxplot, use the boxplot function
bplot<-boxplot(weight~gender,data=databank,main="Boxplot of WEIGHT by GENDER",
               xlab="GENDER",ylab="WEIGHT",col="lightslateblue")

# The resulting object, bplot, contains a component called stats, which contains the values of a2, Q1, Q2, Q3 and a1 for each sample
stats<-bplot$stats
stats

# Explicitly give names to the rows and columns of the above output using the rownames and colnames commands, respectively
rownames(stats)<-c("a2","Q1","Q2","Q3","a1")
colnames(stats)<-bplot$names
stats

### Explanation of Output: 
# The median weight of 167 for males tells us that roughly half of the males in the sample weighed more than 167 pounds. 
# The value of Q1 = 112 for females tells us that roughly 25% of the females in the sample weigh less than 112 pounds. 
# The value of 187 for males tells us that roughly 25% of the males in the sample weigh more than 187 pounds. 
# We can also see from the values of and Q1 and Q3 that approximately half of the males in the sample weigh between 152 and 187 pounds, and that the interquartile range for the weight of males is (187 - 152) = 35. 
# The output also gives the adjacent values a1 and a2 for females and males in the sample.
# The adjacent value of a1 is defined to  be the largest value in the data set that is not an outlier.
# The adjacent value of a2 is defined to  be the smallest value in the data set that is not an outlier.

# Information about outliers can also be obtained using the out component of the boxplot
bplot$out

### Explanation of Output: 
# numeric(0) means a numeric vector of length 0. 
# This means that for our example there are no outliers in either sample. 
# If there were outliers in either sample, then they would appear as output of the above command.

# The boxplot function does not return information about other descriptive statistics like the mean or standard deviation.
# But we can find those manually using the tapply function.

# extract the weights and gender variables
weight<-databank$weight
gender<-databank$gender

# use the tapply function along with mean, sd and length functions
mean<-tapply(weight,gender,mean,na.rm=T)
sd<-tapply(weight,gender,sd,na.rm=T)
n<-tapply(weight,gender,length)

# tapply function applies the given function (mean, sd, or any other function) to each grouping in the gender variable (or any categorical variable given in the 2nd argument)

# combine them into a table using the cbind command
cbind(n,mean,sd)
