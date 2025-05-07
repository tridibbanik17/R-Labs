# R-Labs
Introductory R tutorials and lab materials covering basic statistical analysis, data visualization, and hypothesis testing using real-world data sets.

## Getting Started

### Prerequisites

R: R can be downloaded and installed for free from https://cran.r-project.org/

RStudio: After downloading and installing R, the RStudio desktop app can be downloaded and installed from https://posit.co/download/rstudio-desktop/#download

Required Packages: 5 packages used in this repository are: base, stats, graphics, aplpack, and nortest.

To install these packages, copy and paste the below commands (all at once, or one at a time) into R, and then press 'enter'.
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

## Preparing the Databank data set
This data set contains information about 100 adults. It is a comma-delimited file, meaning that the data values are separated by commas. To import the data file into R and then save as an R project for use in future labs, follow the steps below.

1. Save the databank.txt file from this repository.
2. To import the text file into R, use the command below (replace C:\\Users\\OWNER\\Downloads\\databank.txt with the full path to your databank.txt file):
   
databank<-read.table("C:\\Users\\OWNER\\Downloads\\databank.txt", sep=",", header=T, na.strings=c("", "NA"))

In the above command, read the data set into R using the read.table command, store the result as an object called databank. Since the file is comma-delimited, use the option sep=",". Use header=T to let R know that the first row of the data set consists of headings.

## Repository Contents

R Scripts: Contains R scripts demonstrating various statistical analyses and visualizations.

Plots: Includes graphical outputs generated from the R scripts.

Data Files: Provides datasets (databank.RData, databank.txt) used in the tutorials.

Feel free to explore the repository and utilize the materials for your learning and projects.
