# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script creates a Grouped Frequency Distribution. Save it and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# Extract the IQ column and remove any NA's
IQ<-databank$IQ
IQ<-IQ[!is.na(IQ)]
IQ

# Determine the range of values for the IQ variable by using the range function
range(IQ)

# Create the grouped frequency table by first grouping the observations in the IQ variable into intervals using the cut() function
# By using the option right=FALSE we have instructed R to NOT include the right endpoint in each interval.
group=cut(IQ,breaks=c(80,90,100,110,120,130,140),right=FALSE)
group

# Ccreate the frequency table using the table() function
count<-table(group)
count

# Find the percentage of observations in each group
n<-length(IQ)
percent<-count/n*100
percent

# To find the cumulative percents, use the cumsum command 
cumpct<-cumsum(percent)
cumpct

# Print the complete frequency table in column format using the cbind() function
cbind(count,percent,cumpct)
