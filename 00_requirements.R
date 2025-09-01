#Necessary libraries and functions

#For String manipulation
if (!require(tidyverse)) {
  install.packages("tidyverse")
  library(tidyverse)
}

#For graphing our lms
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

#For neatly placing our graphs together
if (!require(gridExtra)) {
  install.packages("gridExtra")
  library(gridExtra)
}

#For formatting in final report
if (!require(tinytex)) {
  install.packages("tinytex")
  library(tinytex)
}