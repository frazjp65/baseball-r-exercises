outcomes <- c("Single", "Out", "Out", "Single", "Out", "Double", "Out", "Walk", "Out", "Single")
table(outcomes)

f.outcomes <- factor(outcomes, levels = c("Out", "Walk", "Single", "Double"))
table(f.outcomes)

outcomes == "Walk"
sum(outcomes == "Walk")
