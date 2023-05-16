## Giudicelli GC - 16/05/2023
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

## Creating plots
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))
## The plot shows a negative relationship between displ (engine displacement, in litres) and hwy (highway miles per gallon).
## Therefore, cars with bigger engines use more fuel than cars with smaller engines.

## Mapping colors in each graphic point according to the variable class 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

## Change color for size
## Now each size of the graphic points will represent distinct classes 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))
## Warning message:
## Using size for a discrete variable is not advised.

## Change size for alpha (controls the transparency of the color points)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

## Change alpha for shape (represents each class with distinct forms)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

## To change manually an aesthetic (such as the color) you must do it OUT of the aes
## See the difference between the following graphics:
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

## Exercises, pages 12 and 13
## 1. The points are not black in the graphic because o change manually an aesthetic you must do it OUT of the aes.
## 2. Categorical: manufacturer, model, trans, drv, fl, class. Continuous: displ, year, cyl, cty, hwy. When typing mpg, the classification
## of the variables are represented between <>.
##  3. With continuous variables the graphics are not too informative. 
## The last one, with shape, did not run (error message): a continuous variable cannot be mapped to the shape aesthetic.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = displ)) ## color
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = displ)) ## size
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = displ)) ## shape
## 4. When the same variable is attributed to different aesthetics, it is represented in two ways (here, color and shape).
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class, size = class, shape = class))
## After looking the correct answer: "The code works and produces a plot, even if it is a bad one." 
ggplot(mpg, aes(x = displ, y = hwy, colour = hwy, size = displ)) +
  geom_point()
## 5. The stroke aesthetic change the size of the graphic points.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class, stroke = 2))
## 6. Not sure if I write the command correctly, but it did not run, since geom_point() requires the aesthetics: x and y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(color = displ < 5))
## After looking the correct answer: "In this case, the result of displ < 5 is a logical variable which takes values of TRUE or FALSE."
ggplot(mpg, aes(x = displ, y = hwy, colour = displ < 5)) +
  geom_point()
