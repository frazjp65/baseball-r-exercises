hofpitching <- read.csv('./data/hofpitching.csv')

hofpitching$MidYear <- with(hofpitching, (From + To) / 2)
hofpitching$WAR.Season <- with(hofpitching, WAR / Yrs)
hofpitching.recent <- subset(hofpitching, MidYear >= 1960)

hofpitching[order(hofpitching$WAR.Season, decreasing = TRUE), ]

png(filename="./chapter-3/output/exercise-4b.png")
plot(hofpitching.recent$WAR, hofpitching.recent$Yrs)
text(hofpitching.recent$WAR, hofpitching.recent$Yrs, labels = hofpitching.recent$X)
dev.off()