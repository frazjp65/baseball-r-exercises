data1998 <- read.csv('./data/all1998.csv')
fields <- read.csv('./data/fields.csv')
names(data1998) <- fields[, 'Header']

retro.ids <- read.csv('./data/retrosheetIDs.csv')
sosa.id <- as.character(subset(retro.ids, FIRST == 'Sammy' & LAST == 'Sosa')$ID)
mac.id <- as.character(subset(retro.ids, FIRST == 'Mark' & LAST == 'McGwire')$ID)

sosa.data <- subset(data1998, BAT_ID == sosa.id)
mac.data <- subset(data1998, BAT_ID == mac.id)

mac.data <- subset(mac.data, BAT_EVENT_FL == TRUE)
sosa.data <- subset(sosa.data, BAT_EVENT_FL == TRUE)

mac.data$PA <- 1:nrow(mac.data)
sosa.data$PA <- 1:nrow(sosa.data)

mac.HR.PA <- mac.data$PA[mac.data$EVENT_CD == 23]
sosa.HR.PA <- sosa.data$PA[sosa.data$EVENT_CD == 23]

mac.spacings <- diff(c(0, mac.HR.PA))
sosa.spacings <- diff(c(0, sosa.HR.PA))

summary(mac.spacings)
summary(sosa.spacings)

png(filename="./chapter-3/output/exercise-7f-1.png")
hist(mac.spacings)
dev.off()

png(filename="./chapter-3/output/exercise-7f-2.png")
hist(sosa.spacings)
dev.off()