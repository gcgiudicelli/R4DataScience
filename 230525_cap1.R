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

## Geometric objects
## graphics from page 16 - on the book they are incorrect
## left
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))
## right
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

## Adding drv information on the previous graphic
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

## Testing different graphics with geom_smooth
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))
ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),
              show.legend = FALSE)

## To show different geom at the same graphic, add different geom_ functions
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

## The previous graphic code presents some duplication: (mapping = aes(x = displ, y = hwy)).
## To avoid this repetition, you should PLACE MAPPING, as following:
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()

## Creating the mapping as previously you could exhibits different aesthetics in each layer
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth()

## Specifying different data for each layer. Smooth line displays a subset of the mpg dataset, the subcompact cars. 
## The local data argument in geom_smooth() overrides the global data argument in ggplot() for that layer only.
## Not sure how useful this is, perhaps I'll figure it out later.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "subcompact"),
              se = FALSE)

## Exercises, pages 20 and 21
## 1. Graphic line: geom_line. Boxplot: geom_boxplot. Area graphic: geom_ares.
## Histogram: geom_histogram - with histogram you must only have an x or y aesthetic.
ggplot(data = mpg) +
  geom_area(mapping = aes(x = displ, y = hwy))
## 2. I believe the code will generate a plot similar to the one at page 19, but with the drv variable instead of class.
## It was different (and better) that what I was expecting.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(se = FALSE)
## 3. show.legend = FALSE hides the legend. It is useful because the group aesthetic by itself does not add a legend 
## or distinguishing features to the geoms (as mentioned at page 18).
## 4. se argument display confidence interval around smooth; TRUE by default, see level to control.)
?geom_smooth
## 5. Graphics are exactly the same; the first one we place mapping, as suggested on page 19.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth()
ggplot() +
  geom_point(
    data = mpg, 
    mapping = aes(x = displ, y = hwy)
    ) +
  geom_smooth(
    data = mpg, 
    mapping = aes(x = displ, y = hwy)
    )
## 6. 
## Graphic 1 OK
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE)
## Graphic 2 was like this (comment), bellow is the correct one
# ggplot(data = mpg, mapping = aes(x = displ, y = hwy, linetype = drv)) +
#   geom_point() +
#   geom_smooth(se = FALSE)
ggplot(data = mpg, aes(x = displ, y = hwy,)) +
  geom_point() +
  geom_smooth(mapping = aes(group = drv), se = FALSE)
## Graphic 3
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(se = FALSE)
## Graphic 4
## Did a lot o plots, but couldn't get to the correct one.
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(se = FALSE)
## Graphic 5
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = FALSE)
## The below graphic is nice, with linetype with the same colors as drv points
# ggplot(data = mpg, aes(x = displ, y = hwy, color = drv, linetype = drv)) +
#   geom_point() +
#   geom_smooth(se = FALSE)
## Graphic 6
## I thought I must use color/fill, as bellow, but no.
# ggplot(data = mpg) +
#   geom_point(mapping = aes(x = displ, y = hwy, color = drv), fill = "white")
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(aes(colour = drv))
