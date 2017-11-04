library('Lahman')

myteams.1900s <- subset(Teams, yearID <= 1899)[, c('teamID', 'yearID', 'lgID', 'G', 'W', 'L', 'R', 'RA')]

myteams$logWratio <- log(myteams$W / myteams$L)
myteams$logRratio <- log(myteams$R / myteams$RA)
pyfit <- lm(logWratio ~ 0 + logRratio, data = myteams)
exp <- coef(pyfit)[1]

myteams$pytWpct <- with(myteams, R ^ exp / (R ^ exp + RA ^ exp))
myteams$pytFit <- predict(pyfit)
myteams$pytResiduals <- residuals(pyfit)

png(filename = './chapter-4/output/exercise-2.png')
plot(myteams$RD, myteams$pytResiduals, xlab = 'Run Differential', ylab = 'Residual')
abline(h = 0, lty = 3)
dev.off()