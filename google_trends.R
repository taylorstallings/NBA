##practice gtrends

install.packages("gtrendsR")
install.packages("trendyy")
library(tidyverse)
library(ggplot2)
library(gtrendsR)
library(trendyy)

country = "US"
donovan <- trendy("Donovan Mitchell", geo=country) %>% get_interest()

View(donovan)

donovan_events = data.frame(date=as.Date(c("2017-06-22", "2018-04-23", "2020-03-10", "2020-08-17")), 
                            event=c("Drafted", "Game 4 vs. Thunder - 33 pts", "Coronavirus shuts down league", "57 points - 3rd most in playoff history"))

#note: labeling is trashy, look into that
ggplot(donovan, aes(x = as.Date(date), y = hits)) +
  geom_line(colour = "steelblue", size = 2.5) +
  geom_vline(data=donovan_events, mapping=aes(xintercept=date), color="red") +
  geom_text(data=donovan_events, mapping=aes(x=date, y=0, label=event), size=4, angle=40, vjust=-0.5, hjust=0 ) + 
  xlab(label = "Search Dates") + 
  ylab(label = 'Relative Hits %')