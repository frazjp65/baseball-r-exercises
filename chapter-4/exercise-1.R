library('Lahman')

dataByDecade <- function(startYear) {
  tmp <- subset(Teams, yearID > startYear & yearID <= startYear + 10)[, c('teamID', 'yearID', 'lgID', 'G', 'W', 'L', 'R', 'RA')]
  tmp$RD <- with(tmp, R - RA)
  tmp$Wpct <- with(tmp, W / (W + L))
  
  return(tmp)
}

plotData <- function(data, startYear) {
  linfit <- lm(Wpct ~ RD, data = data)
  filename <- paste("./chapter-4/output/exercise-1-", startYear, ".png", sep="")
  png(filename = filename)
  plot(data$RD, data$Wpct, xlab = 'Run Differential', ylab = 'Winning Percentage')
  abline(a = coef(linfit)[1], b = coef(linfit)[2], lwd = 2)
  dev.off()
}

predictPct <- function(data, rd) {
  linfit <- lm(Wpct ~ RD, data = data)
  print(coef(linfit)[1] + rd * coef(linfit)[2], lwd = 2)
}

myteams.1960 <- dataByDecade(1960)
plotData(myteams.1960, 1960)
predictPct(myteams.1960, 10)
myteams.1970 <- dataByDecade(1970)
plotData(myteams.1970, 1970)
predictPct(myteams.1970, 10)
myteams.1980 <- dataByDecade(1980)
plotData(myteams.1980, 1980)
predictPct(myteams.1980, 10)
myteams.1990 <- dataByDecade(1990)
plotData(myteams.1990, 1990)
predictPct(myteams.1990, 10)
myteams.2000 <- dataByDecade(2000)
plotData(myteams.2000, 2000)
predictPct(myteams.2000, 10)