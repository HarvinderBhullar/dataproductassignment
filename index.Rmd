---
title       : Multivariate Aalysis of mtcars Data
subtitle    : 
author      : Harvinder
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Synopsis

1. Explore the relationship between a set of variables and miles per gallon (MPG) from mtcars data
2. Make it interactive for the user so that user can learn by interaction
3. Create graphs and display statistics 
4. Try different models using lm function

--- .class #id 

## Structure of the Application

1. The web pages is divided into  four tabs
2. Tab1 displays the graphs, pair wise, different models drawn on the same plot
3. Tab2 displays the different statistics, these can be selected by selecting a radio button from the left hand side.
4. Tab3 displays the model comparision, which is done using annova
5. Tab4 display the mtcars data for reference

--- .class #id1

## Modeling 

 The author explored three different models
 * First Model mpg with only  one feature (i.e. am) 
 
```r
lm(mpg~factor(am) -1, data= mtcars)
```

 * Second model mpg with am, drat, wt and qsec
 
```r
lm(mpg~ factor(am) + drat+wt+qsec -1, data=mtcars)
```

 * Third model
 
```r
lm(mpg~ factor(am) + disp + drat+wt+hp+qsec+carb -1, data=mtcars)
```

--- .class #id2

## Model Comparison

1. Model comparision was done using annova. The steps are given as follows

```r
f1  <- lm(mpg~factor(am) -1, data= mtcars)
f2 <- update(fn , mpg~factor(am) +  drat+wt+qsec -1)
f3 <- update(fn ,mpg~factor(am)  +  disp + drat+wt+hp+qsec+carb -1)
anova(f1,f2,f3)

```
It shows that model 2 is the best model, Please use the web application to see the results.

