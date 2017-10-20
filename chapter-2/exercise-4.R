SO <- c(2198, 4672, 1806, 3509, 3371, 2502, 1868, 2583, 2803)
BB <- c(951, 1580, 745, 1363, 999, 844, 1268, 1434, 1217)
Name <- c("Alexander", "Clemens", "Galvin", "Johnson", "Maddux", "Mathewson", "Nichols", "Spahn", "Young")

SO.BB.Ratio <- SO / BB
SO.BB <- data.frame(Name, SO, BB, SO.BB.Ratio)
swr.2.8 <- subset(SO.BB, SO.BB$SO.BB.Ratio > 2.8)
SO.BB <- SO.BB[order(SO.BB$BB, decreasing = TRUE), ]