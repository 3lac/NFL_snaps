#libraries used in this program
library(rvest)
library(tidyverse)
library(stringr)
library(tibble)
library(dplyr)
library(rlang)
library(purrr)
source("snapsep.R") #function that cleans and separates snap_raw and percentage
source("mut_snap.R") 

#*****************************************
### Please define weeks played inorder to work properly
#*
#*
weeks_played <- 2
unplayed_weeks <- seq(-2-(weeks_played*2),-20,-1)
#####
for (z in 1:32)
{
# loads URL and table 
url <- urls[z,2]
h <- read_html(url)
nodes <- html_nodes(h, "table")
nodes <- html_table(nodes)
temp_tab <- nodes[[2]]


#calling function to mutate to add in additional columns
temp_tab <- mut_snap(temp_tab,weeks_played)

#for loop to find the white rows and assign indexes to t 
t <- 1
n <- nrow(temp_tab) #number of rows
i <- 1
c = seq(1,3,1) # creating seq to store na index
for (i in 1:n){                #for loop that looks for empty and stores index in c
  if(!nzchar(temp_tab[[i,1]])){
    c[t] <- -i
    t <- t+1
  }
  
}
temp_tab <- temp_tab[c,] #removes white space
Clean_tab <- snapsep(temp_tab,2) # separates into snapraw and percentage
#removing unused weeks
Clean_tab <- Clean_tab[,unplayed_weeks]
names(unlist(teamnames))
name <- paste(teamnames[z],"_snapchart",sep = "")
assign(name,Clean_tab)
}