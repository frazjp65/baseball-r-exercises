## this is just ugly, there has to be a better way...

fields <- c('date', 'gameNum', 'dow', 'visitor', 'visitorLeague', 'visitorGameNumber',
            'home', 'homeLeague', 'homeGameNumber', 'visitingScore', 'homeScore', 
            'outs', 'DN', 'completion', 'forfeit', 'protest', 'parkID', 'attendance',
            'duration', 'visitingLine', 'homeLine', 'vAB', 'vH', 'v2B', 'v3B', 'vHR',
            'vRBI', 'vSH', 'vSF', 'vHBP', 'vBB', 'vIBB', 'vK', 'vSB', 'vCS', 'vGIDP', 'vCI', 
            'vLOB', 'vPU', 'vIER','vER', 'vWP', 'vB', 'vPO', 'vA', 'vE', 'vPB', 'vDP',
            'vTP', 'hAB', 'hH', 'h2B', 'h3B', 'hHR','hRBI', 'hSH', 'hSF', 'hHBP',
            'hBB', 'hIBB', 'hK', 'hSB', 'hCS', 'hGIDP', 'hCI', 'hLOB', 'hPU', 'hIER',
            'hER',
            'hWP', 'hB',  'hPO', 'hA', 'hE', 'hPB', 'hDP', 'hTP', 'Hpump', 'HumpName',
            '1Bump', '1BumpName', '2Bump', '2BumpName', '3Bump', '3BumpName', 'LFump',
            'LFumpName', 'RFump', 'RFUmpName', 'vManager', 'vManagerName', 'hManager',
            'hManagerName', 'wPitcher', 'wPitcherName', 'lPitcher', 'lPitcherName',
            'sPitcher', 'sPitcherName', 'GWRBIBatter', 'GWRBIBatterName',
            'vStartingPitcher', 'vStartingPitcherName', 'hStartingPitcher',
            'hStartingPitcherName', 'vp1', 'vp1Name', 'vp1P', 'vp2', 'vp2Name',
            'vp3P', 'vp3', 'vp3Name', 'vp3P', 'vp4', 'vp4Name', 'vp4P', 'vp5',
            'vp5Name', 'vp5P', 'vp6', 'vp6Name', 'vp6P', 'vp7', 'vp7Name', 'vp7P',
            'vp8', 'vp8Name', 'vp8P', 'vp9', 'vp9Name', 'vp9P', 'hp1', 'hp1Name',
            'hp1P', 'hp2', 'hp2Name', 'hp2P', 'hp3', 'hp3Name', 'hp3P', 'hp4',
            'hp4Name', 'hp4P', 'hp5', 'hp5Name', 'hp5P', 'hp6', 'hp6Name', 'hp6P',
            'hp7', 'hp7Name', 'hp7P', 'hp8', 'hp8Name', 'hp8P', 'hp9', 'hp9Name',
            'hp9P', 'grabBag', 'acquisition')

## this should be put in a loop            
data2014 <- read.csv('./data/retrosheet/gamelog/GL2014.TXT', header = FALSE)
names(data2014) <- fields
data2013 <- read.csv('./data/retrosheet/gamelog/GL2013.TXT', header = FALSE)
names(data2013) <- fields
data2012 <- read.csv('./data/retrosheet/gamelog/GL2012.TXT', header = FALSE)
names(data2012) <- fields
data2011 <- read.csv('./data/retrosheet/gamelog/GL2011.TXT', header = FALSE)
names(data2011) <- fields
data2010 <- read.csv('./data/retrosheet/gamelog/GL2010.TXT', header = FALSE)
names(data2010) <- fields
data2009 <- read.csv('./data/retrosheet/gamelog/GL2009.TXT', header = FALSE)
names(data2009) <- fields
data2008 <- read.csv('./data/retrosheet/gamelog/GL2008.TXT', header = FALSE)
names(data2008) <- fields
data2007 <- read.csv('./data/retrosheet/gamelog/GL2007.TXT', header = FALSE)
names(data2007) <- fields
data2006 <- read.csv('./data/retrosheet/gamelog/GL2006.TXT', header = FALSE)
names(data2006) <- fields
data2005 <- read.csv('./data/retrosheet/gamelog/GL2005.TXT', header = FALSE)
names(data2005) <- fields

data <- rbind(data2014, data2013, data2012, data2011, data2010, data2009, data2008, data2007, data2006, data2005)

managerData.vR <- aggregate(visitingScore ~ vManagerName, data=data, FUN=sum)
managerData.hR <- aggregate(homeScore ~ hManagerName, data=data, FUN=sum)
managerData.R <- merge(managerData.hR, managerData.vR, by.x = 'hManagerName', by.y = 'vManagerName')
managerData.R$R <- managerData.R$homeScore + managerData.R$visitingScore

managerData.vRA <- aggregate(homeScore ~ vManagerName, data=data, FUN=sum)
managerData.hRA <- aggregate(visitingScore ~ hManagerName, data=data, FUN=sum)
managerData.RA <- merge(managerData.hRA, managerData.vRA, by.x = 'hManagerName', by.y = 'vManagerName')
managerData.RA$RA <- managerData.RA$homeScore + managerData.RA$visitingScore

managerData.vW <- aggregate(visitingScore < homeScore ~ vManagerName, data=data, FUN=sum)
managerData.hW <- aggregate(visitingScore > homeScore ~ hManagerName, data=data, FUN=sum)
managerData.W <- merge(managerData.hW, managerData.vW, by.x = 'hManagerName', by.y = 'vManagerName')
colnames(managerData.W) <- c('manager', 'w1', 'w2')
managerData.W$W <- managerData.W$w1 + managerData.W$w2

managerData.vL <- aggregate(visitingScore > homeScore ~ vManagerName, data=data, FUN=sum)
managerData.hL <- aggregate(visitingScore < homeScore ~ hManagerName, data=data, FUN=sum)
managerData.L <- merge(managerData.hL, managerData.vL, by.x = 'hManagerName', by.y = 'vManagerName')
colnames(managerData.L) <- c('manager', 'l1', 'l2')
managerData.L$L <- managerData.L$l1 + managerData.L$l2

managers <- unique(managerData.R$hManagerName)

managerData <- data.frame(managers)

managerData$R <- merge(managerData, managerData.R, by.x = 'managers', by.y = 'hManagerName')['R']
managerData$RA <- merge(managerData, managerData.RA, by.x = 'managers', by.y = 'hManagerName')['RA']
managerData$W <- merge(managerData, managerData.W, by.x = 'managers', by.y = 'manager')['W']
managerData$L <- merge(managerData, managerData.L, by.x = 'managers', by.y = 'manager')['L']

managerData$Wpct <- with(managerData, W / L)
managerData$pytWpct <- with(managerData, R ^ 2 / (R ^ 2 + RA ^ 2))

qualifiedManagerData <- subset(managerData, W < 100)

png(filename = './chapter-4/output/exercise-3.png')
plot(data.frame(qualifiedManagerData$R - qualifiedManagerData$RA, qualifiedManagerData$pytWpct), xlab = 'Run Differential', ylab = 'Winning Percentage')
text(data.frame(qualifiedManagerData$R - qualifiedManagerData$RA, qualifiedManagerData$pytWpct), labels = qualifiedManagerData$managers)
dev.off()