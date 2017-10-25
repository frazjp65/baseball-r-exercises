hofpitching <- read.csv('./data/hofpitching.csv')

hofpitching$BF.group <- with(hofpitching, cut(BF, c(0, 10000, 15000, 20000, 30000), labels = c('Less than 10000', '(10000, 15000)', '(15000, 20000)', 'more than 20000')))
hofpitching$WAR.Season <- with(hofpitching, WAR / Yrs)

png(filename="./chapter-3/output/exercise-3a.png")
stripchart(WAR.Season ~ BF.group, data = hofpitching)
dev.off()

png(filename="./chapter-3/output/exercise-3b.png")
boxplot(WAR.Season ~ BF.group, data = hofpitching)
dev.off()