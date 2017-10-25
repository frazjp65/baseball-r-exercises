hofpitching <- read.csv('./data/hofpitching.csv')

hofpitching$MidYear <- with(hofpitching, (From + To) / 2)
hofpitching$WAR.Season <- with(hofpitching, WAR / Yrs)

png(filename="./chapter-3/output/exercise-5a.png")
plot(hofpitching$WAR.Season, hofpitching$MidYear)
dev.off()