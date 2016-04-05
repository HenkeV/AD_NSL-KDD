kdd_train=read.csv(file="KDDTrain+.arff", sep = ",")
kdd_test=read.csv(file="KDDTrain+_20Percent.arff", sep = ",")
colnames <- read.table("names", skip = 1, sep = ":")
names(kdd_train) <- colnames$V1
names(kdd_test) <- colnames$V1
train <- (kdd_train$class)
test <- (kdd_test$class)
require(class)
knn(train = kdd_test, test = kdd_train, cl = class, k = 355)
