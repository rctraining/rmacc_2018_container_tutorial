#This example is from:
#http://www.bodowinter.com/tutorial/bw_LME_tutorial.pdf

#load needed packages
library(lme4)

#load data for model
politeness=read.csv("http://www.bodowinter.com/tutorial/politeness_data.csv")

#summarize data:
head(politeness)

#make plot of data
boxplot(frequency ~ attitude*gender,col=c("white","lightgray"),politeness)

#fit model
politeness.model = lmer(frequency ~ attitude + (1|subject) + (1|scenario), data=politeness)

#summarize model
 summary(politeness.model)
