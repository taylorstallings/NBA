devtools::install_github("abresler/nbastatR")
library("nbastatR")

attach(Totals)
Totals
##newTotals <- Totals[order(,-Team)]
library(ggplot2)
library(dplyr)
# Basic scatter plot
gg<- ggplot(Totals, aes(x=TPtPercentage, y=TwoPtAttempted, label=Team)) + geom_point()
gg
gg + geom_text(check_overlap = TRUE, hjust = 0, nudge_x = 0) + geom_abline(slope=1,intercept=0)

gg# Change the point size, and shape
ggplot(mtcars, aes(x=FGA, y=FG%)) +
  geom_point(size=2, shape=23)

my_data <- as_tibble(Totals)
my_data

my_data %>% 
  rename(
    FGP = FG%%
  )

names(Totals)
names(Totals)[13] <- 'TwoPtAttempted'



attach(nba_teams)
nba_teams
new_nba <- nba_teams[nba_teams$isNonNBATeam == 0,c(1,13)]
ggplot(d, aes(x, y)) + geom_image(image=d$image[1])
geom_image(aes(image = urlThumbnailTeam), size = 0.15)


##print(nba_teams())
##jazz_shots <- teams_shots(teams = "Utah Jazz", seasons = c(2019))
##jazz_shots()
new_nba
attach(new_nba)
##works with dplyr
new_nba <- new_nba %>% arrange((nameTeam))
Totals <- Totals %>% arrange((Team))
##combining datasets
data1 <- data.frame(new_nba,Totals)
data1
##adding images to ggplot
gg2 <- ggplot(data1, aes(x = TPtPercentage, y=TwoPtAttempted)) +
  geom_image(aes(image = urlThumbnailTeam), size = 0.08) +
  xlab("3Pt%") +
  ylab("2Pt%") +
  ggtitle("2019-2020 Season Shooting Efficiency") +
  geom_smooth(colour = 'red')

gg2

library(dplyr)
library(nbastatR)
df_asg <-
  get_all_star_game_scores()
df_asg %>% glimpse()
df_asg %>% count(namePlayerMVP, sort = T)

dictionary_nba_names()
get_nba_stats_api_items()
