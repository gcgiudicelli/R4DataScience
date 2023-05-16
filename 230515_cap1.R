## Giudicelli GC - 15/05/2023
## R version 4.2.2
## R for Data Science - Chapter 1

## set wd
setwd("~/Desktop/R4DS/")

## load tidyverse libraries (already installed)
## install.packages("tidyverse") ## if not installed
library(tidyverse)
## install.packages("ggplot2") ## if not installed
library(ggplot2)

## Question: cars with bigger engines use more fuel than cars with smaller engines?
## We will use the ggplot2::mpg data frame to answer this question
ggplot2::mpg
?mpg ## more info about the data frame

## Creating plots
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
## The plot shows a negative relationship between displ (engine displacement, in litres) and hwy (highway miles per gallon).
## Therefore, cars with bigger engines use more fuel than cars with smaller engines.

## Exercises, pages 6 and 7
## 1. ggplot(data = mpg) displays a blank graph (no information).
## 2. mtcars has 32 rows e 11 columns; I count lines with nrow(mtcars) and columns with ncol(mtcars).
## 3. drv describes the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd.
## 4. I used the following command:
## ggplot(data = mpg) + 
##   geom_point(mapping = aes(x = hwy, y = cyl))
## 5. I first plot the graph with the following command:
## ggplot(data = mpg) + 
##   geom_point(mapping = aes(x = class, y = drv))
## The graph is not usefull to answer our question because it informs the type of the car (class) and the type of drive train (drv).
