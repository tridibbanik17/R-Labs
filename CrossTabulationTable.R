# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script creates a cross-tabulation for the variables exercise and smoking status in the Databank data set. 
# The values of the exercise variable are defined as follows: 0 = none, 1 = light, 2 = moderate, 3 = heavy. 
# The values of the smoking status variable are defined as: 0 = does not smoke, 1 = smokes less than one pack per day, 2 = smokes one or more packs per day.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# extract the exercise and smoking status columns
exercise<-databank$exercise
smoking.status<-databank$smoking.status

# use the table function to create a cross-tabulation table using these two variables
cross<-table(exercise,smoking.status)
cross

# To find the totals of the rows and columns, first find their individual sums. 
# To find the sum for each row we use the rowSums function
All<-rowSums(cross)
All

# combine these sums with the previous table using the cbind command
cross<-cbind(cross,All)
cross

# similarly for the column sums, use the colSums command followed by rbind
All<-colSums(cross)
cross<-rbind(cross,All)
cross

### Explanation of Output:
# This output tells us, for example, that there were 5 people in the sample who did light exercise and smoked one or more packs per day (exercise = 1, smoke = 2). 
# There were a total of 47 people in the sample who did not smoke (smoke = 0, regardless of exercise status). 
# There were a total of 13 people in the sample who exercised moderately (exercise = 2, regardless of smoking status). 
# If a person were randomly selected from the above sample, the probability that they don't exercise at all (exercise = 0), given that they don't smoke at all (smoke = 0) is 17/47 = 36.17%,
# the probability that they don't exercise at all (exercise = 0), given that they smoke less than one pack per day (smoke = 1) is 14/37 = 37.84%, 
# the probability that they don't exercise at all (exercise = 0) given that they smoke one or more packs per day (smoke = 2) is 7/16 = 43.75%. 
# Therefore the data suggest that the more a person smokes, the more likely they are to not do any exercise.
