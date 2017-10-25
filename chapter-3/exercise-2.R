hofpitching <- read.csv('./data/hofpitching.csv')

png(filename="./chapter-3/output/exercise-2a.png")
hist(hofpitching$WAR)
dev.off()

head(hofpitching[order(hofpitching$WAR, decreasing = TRUE), ], n = 2)$X