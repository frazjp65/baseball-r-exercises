hofpitching <- read.csv('./data/hofpitching.csv')

hofpitching$BF.group <- with(hofpitching, cut(BF, c(0, 10000, 15000, 20000, 30000), labels = c('Less than 10000', '(10000, 15000)', '(15000, 20000)', 'more than 20000')))

frequencyTable <- table(hofpitching$BF.group)

png(filename="./chapter-3/output/exercise-1b.png")
barplot(frequencyTable, xlab = 'Batters Faced', ylab = 'Frequency', main = 'Batters Faced by HoF Pitchers')
dev.off()

png(filename="./chapter-3/output/exercise-1c.png")
pie(frequencyTable, main = 'Batters Faced by HoF Pitchers')
dev.off()
