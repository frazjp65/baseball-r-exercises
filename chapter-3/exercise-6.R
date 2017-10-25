library('Lahman')

getinfo <- function(firstname, lastname) {
  playerline <- head(subset(Master, nameFirst == firstname & nameLast == lastname), n = 1)
  name.code <- as.character(playerline$playerID)
  birthyear <- playerline$birthYear
  birthmonth <- playerline$birthMonth
  birthday <- playerline$birthDay
  byear <- ifelse(birthmonth <= 6, birthyear, birthyear + 1)
  list(name.code = name.code, byear = byear)
}

cobb.info <- getinfo('Ty', 'Cobb')
cobb.data <- subset(Batting, playerID == cobb.info$name.code)
cobb.data$Age <- cobb.data$yearID - cobb.info$byear

williams.info <- getinfo('Ted', 'Williams')
williams.data <- subset(Batting, playerID == williams.info$name.code)
williams.data$Age <- williams.data$yearID - williams.info$byear

rose.info <- getinfo('Pete', 'Rose')
rose.data <- subset(Batting, playerID == rose.info$name.code)
rose.data$Age <- rose.data$yearID - rose.info$byear

createdata <- function(d) {
  d <- d[order(d$Age), ]
  d$cumH <- cumsum(d$H)
  d[, c('Age', 'cumH')]
}

rose.h <- createdata(rose.data)
cobb.h <- createdata(cobb.data)
williams.h <- createdata(williams.data)

png(filename="./chapter-3/output/exercise-6d.png")
plot(rose.h, type = 'l', lwd = 2, ylab = 'Hits in the Season')
lines(cobb.h, lwd=2, col='grey')
lines(williams.h, lwd=2, col='blue')
dev.off()