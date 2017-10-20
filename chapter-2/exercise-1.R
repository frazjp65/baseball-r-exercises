players <- c("Henderson", "Brock", "Cobb", "Collins", "Carey", "Morgan", "Aparicio", "Molitor", "Alomar")
SB <- c(1406, 938, 897, 741, 738, 689, 506, 504, 474)
CS <- c(335, 307, 212, 195, 109, 162, 136, 131, 114)
G <- c(3081, 2616, 3034, 2826, 2476, 2649, 2599, 2683, 2379)

SB.Attempt <- SB + CS
Success.Rate <- SB / SB.Attempt
SB.Game <- SB / G

png(filename="./chapter-2/output/exercise-1e.png")
plot(SB.Game, Success.Rate)
dev.off()