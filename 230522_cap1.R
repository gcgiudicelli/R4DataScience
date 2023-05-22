## Giudicelli GC - 19/05/2023
## R version 4.2.2
## R for Data Science - Chapter 1
## Exercices solutions: https://jrnold.github.io/r4ds-exercise-solutions/

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

## Creating facets (subgroups)
## facet_wrap to create a plot with ONE variable 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
## facet_grid to create a plot with TWO variables
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ cyl)
## . instead of variable name (in facet_grid) to don't plot in rows or columns dimension
## plot columns
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
## plot rowns
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

## Exercises, pages 15 and 16
## 1. The graphic is not very informative, because the continuous variable (displ) was modified to a categorical variable, 
## therefore the plot presents a facet for each value.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ displ, nrow = 1)
## 2. The empty cells in the first plot below means that no observation was found for those drv/cyl combinations.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = hwy, y = cty)) +
  facet_grid(drv ~ cyl)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = drv, y = cyl))
## 3. The first graphic plot only in columns, and the second only in rows. The . means that columns or rows will not be plotted.
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)
## 4. Vantage: see distinct comparison at the same time. Disvantage: don't see the role picture/relationship. 
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
## 5. nrow decides how many rows should be presented in the plot, ncol does the same but with the columns. 
## facet_grid doesn't have nrow and ncol because it will plot more than one variable, while facet_wrap plot just one.
?facet_wrap
## 6. The plot will be more informative because it will have more space to represent the variable with unique levels.
