# R-Labs
Introductory R tutorials and lab materials covering basic statistical analysis, data visualization, and hypothesis testing using real-world data sets.

R can be downloaded and installed for free from https://cran.r-project.org/

After downloading and installing R, the RStudio desktop app can be downloaded and installed from https://posit.co/download/rstudio-desktop/#download

5 packages used in this repository are: base, stats, graphics, aplpack, and nortest.

To install these packages copy and paste the below commands (all at once, or one at at time) into R, and then press 'enter'.
if(!require("base")){
    install.packages("base")
    library("base")
}

if(!require("stats")){
    install.packages("stats")
    library("stats")
}

if(!require("graphics")){
    install.packages("graphics")
    library("graphics")
}

if(!require("aplpack")){
    install.packages("aplpack")
    library("aplpack")
}

if(!require("nortest")){
    install.packages("nortest")
    library("nortest")
}

Preparing the Databank data set:
This data set contains information about 100 adults. It is comma-delimited file, meaning that the data values are separated by commas. To import the data file into R and then save as an R project for use in future labs, follow the steps below.

1. Save the databank.txt file from this repository.
2. To import the text file into R, use the command below (replace C:\\Users\\OWNER\\Downloads\\databank.txt with the full path to your databank.txt file):
   
databank<-read.table("C:\\Users\\OWNER\\Downloads\\databank.txt", sep=",", header=T, na.strings=c("", "NA"))

In the above command, read the data set into R using the read.table command, store the result as an object called databank. Since the file is comma-delimited, use the option sep=",". Use header=T to let R know that the first row of the data set consists of headings.

3. To save the data as an R file for use in future labs: Select Session > Save Workspace As in the RStudio desktop app. Save it as a .RData (R Images) file (i.e., databank.RData). databank.RData can be downloaded from this repository.

4. To load a saved workspace (i.e., databank.RData), open any .RData file. Then, load workspace by going to File > Load Workspace in the RGui. To view certain rows and columns, use the following command: 
For example, to view rows 1 to 5 and columns 1 to 12 of the file named databank.RData, the command would be
databank[1:5,1:12]
