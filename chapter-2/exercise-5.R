library(plyr)
library('Lahman')

stats <- function(d) {
  c.SO <- sum(d$SO, na.rm = TRUE)
  c.BB <- sum(d$BB, na.rm = TRUE)
  c.IPouts <- sum(d$IPouts, na.rm = TRUE)
  c.midYear <- median(d$yearID, na.rm = TRUE)
  data.frame(SO=c.SO, BB=c.BB, IPouts=c.IPouts, midYear=c.midYear)
}

career.pitching <- ddply(Pitching, .(playerID), stats)

combined.pitching <- merge(Pitching, career.pitching, by="playerID")

career.10000 <- subset(career.pitching, IPouts >= 10000)

png(filename="./chapter-2/output/exercise-5e.png")
plot(career.10000$midYear, career.10000$SO / career.10000$BB)
dev.off()
