install.packages("waffle")
library(waffle)
library(dplyr)
?waffle
newJazz <- JazzPoints %>%
  select(Player, ThreePtPct, TwoPtPct, FTPct)
print(newJazz)
attach(newJazz)

newJazz$ThreePtPct <- round(newJazz$ThreePtPct, digits = 0)
newJazz$TwoPtPct <- round(newJazz$TwoPtPct, digits = 0)
newJazz$FTPct <- round(newJazz$FTPct, digits = 0)





newJazz$ThreePtPct <- as.integer(newJazz$ThreePtPct)
newJazz$TwoPtPct <- as.integer(newJazz$TwoPtPct)
newJazz$FTPct <- as.integer(newJazz$FTPct)

print(newJazz)

jazzData <- c(newJazz$ThreePtPct)

parts <- c(newJazz$ThreePtPct)

parts <- c(25, 66, 9)
chart <- waffle::waffle(parts, 
                        rows = 10, 
                        keep = TRUE, 
                        xlab = "1 square = 1 percent of points scored", 
                        title = "1997-98 Utah Jazz Scoring Distribution",
                        flip=TRUE,
                        colors = c("#00afe8","#95504c", "#3a3996"),
                        size = 1)

print(chart)

parts <- c(16, 48, 36)
chart <- waffle::waffle(parts, 
                        rows = 10, 
                        keep = TRUE, 
                        xlab = "1 square = 1 percent of points scored", 
                        title = "2019-2020 Utah Jazz Scoring Distribution",
                        flip=TRUE,
                        colors = c("#002144","#ffa202", "#284e37"),
                        size = 1)

print(chart)
##trying again with waffles


attach(newJazz)
devtools::install_github("liamgilbey/ggwaffle")
attach(ggwaffle)
waffle_data <- waffle_iron(data, aes_d(group = ThreePtPct), rows=10)

ggplot(waffle_data, aes(x, y, fill = group)) + 
  geom_waffle()
