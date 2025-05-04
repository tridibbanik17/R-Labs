# Open the workspace databank.RData by using File > Load Workspace and selecting databank.RData and pressing Open. 
# This script uses the weight and gender variables in the databank dataset to produce a separate histogram of weights for males and females.
# Save the script as a .R file and then run. To run a certain line of the script, move the cursor to the line and use ctrl+Enter in Windows.

# extract the weight and gender variables
weight<-databank$weight
gender<-databank$gender

# create two new variables containing the weights of females only, and males only, respectively
female_weight<-weight[gender=="F"]
male_weight<-weight[gender=="M"]

# use the hist command to display two separate labeled histograms of weight for females and males using the intervals 90-110, 110-130, 130-150, 150-170, 170-190, 190-210, 210-230, and 230-250
#We first use the c() function to combine the cutpoints into a vector
cutpoints<-c(90,110,130,150,170,190,210,230,250)

# use the xaxt="n" option to supress the tickmarks on the x-axis
# and the right=FALSE option so that right endpoints are not included
# in the intervals
hist(female_weight,breaks=cutpoints,labels=TRUE,right=FALSE,col="green",
     xaxt="n",main="Weights of Females",xlab="Weight")

# specify that the tickmarks on the x-axis be at the cutpoints
axis(side=1,at=cutpoints)

hist(male_weight,breaks=cutpoints,labels=TRUE,right=FALSE,col="red",
     xaxt="n",main="Weights of Males",xlab="Weight")
axis(side=1,at=cutpoints)
