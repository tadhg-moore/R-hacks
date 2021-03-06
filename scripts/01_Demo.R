#' Re-written script - post-corruption
#' Date: 2021-06-08
#' Author: Tadhg Moore
#'


library(plyr)

fils <- list.files("data/surftemp/", full.names = TRUE)


out <- lapply(fils, read.csv) # Read in csv files and store as a list
df <- do.call("rbind", out) # Bind each member of the list into one dataframe
head(df)

summer_temp <- ddply(df, c("scenario", "year", "lake"), function(x) {
  sub <- x[x$month == 6, ]
  anom = mean(sub$anom)
  return(data.frame(anom = anom))
}, .progress = "text")

head(summer_temp)

library(ggplot2)

p1 <- ggplot(summer_temp) +
  geom_line(aes(year, anom, color = lake)) +
  facet_wrap(~scenario) +
  guides(color = FALSE)
p1

# All lakes
out2 <- ddply(df, c("scenario", "year", "model"), function(x) {
  sub <- x[x$month == 6, ]
  anom = mean(sub$anom)
  std_dev = sd(sub$anom)
  return(data.frame(anom = anom, std_dev = std_dev))
}, .progress = "text")
head(out2)

p2 <- ggplot(out2) +
  geom_ribbon(aes(year, ymin = anom - std_dev, ymax = anom + std_dev, fill = model),
              alpha = 0.3) +
  geom_line(aes(year, anom, color = model)) +
  facet_wrap(~scenario) +
  guides(color = FALSE)
p2
