W <- c(373, 354, 364, 417, 355, 373, 361, 363, 511)
L <- c(208, 284, 310, 279, 227, 288, 208, 245, 316)
Name <- c("Alexander", "Clemens", "Galvin", "Johnson", "Maddux", "Mathewson", "Nichols", "Spahn", "Young")
Win.PCT <- 100 * W / (W + L)
Wins.350 <- data.frame(Name, W, L, Win.PCT)
Wins.350 <- Wins.350[order(Wins.350$Win.PCT, decreasing = TRUE), ]