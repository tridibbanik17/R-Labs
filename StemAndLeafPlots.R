# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script uses the weight variable in the databank data set (which is given in pounds). We will construct a stem-and-leaf plot of the weight variable in kilograms. We first convert to kilograms by multiplying the weight in pounds by 0.4536.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# convert the weight column (which is in pounds) to kilograms
weight<-databank$weight
weight_kg<-weight*0.4536

# To display the stem-and-leaf plot, use the stem.leaf function, which is part of the aplpack package. Note: If the below command doesn't work, it might be because the aplpack package is not installed.
# stem.leaf has used the intervals 40-45, 45-50, 50-55, 55-60, etc. i.e., each stem has been separated into m = 2 parts. To remove NA's from the data, use the na.rm=T option. Use the trim.outliers=F option so that R does not remove outliers when creating the stem and leaf plot.
library("aplpack")
stem.leaf(weight_kg,na.rm=T,trim.outliers=F)

# To use intervals of length 10 (i.e., 40-50, 50-60, etc.), split each stem into m = 1 part
stem.leaf(weight_kg,na.rm=T,trim.outliers=F,m=1)

### (Detailed explanation of the output) Explanation of Depths: 
# The column of numbers at the left of the plot are called depths (i.e., 8, 36, etc.). 
# The brackets around (20) mean two things. 
# Firstly, it means that there are 20 observations in that row, i.e., 20 observations between 60 and 70 (not including 70). 
# Secondly, it means that the median is in that row, i.e., the median is somewhere between 60 and 70 (not including 70). 
# The numbers above (20), i.e., 36 and 8 give the number of observations that are less than or equal to the numbers in that row. 
# So, for example, the 36 means that there are 36 observations that are less than or equal to 59. i.e., there are a total of 36 observations in the first two rows combined. 
# The numbers below (20), i.e., 44, 21, 5, and 1 give the number of observations that are greater than or equal to the numbers in that row. 
# So, for example there are 44 observations that are greater than or equal to 70. i.e., there are a total of 44 observations in the last four rows combined.
