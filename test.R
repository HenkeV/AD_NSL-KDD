kdd=read.csv(file="KDDTest+.arff", sep = ",")
colnames <- read.table("names", skip = 1, sep = ":")
names(kdd) <- colnames$V1
