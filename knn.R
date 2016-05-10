# reads the files:
kdd_train=read.csv(file="KDDTrain+.txt", sep = ",")
kdd_train=kdd_train[,-43]
# reads the names of the columns
colnames <- read.table("names", skip = 1, sep = ":")
# Sets the names on the trainingset
names(kdd_train) <- colnames$V1

#badCols <- nearZeroVar(kdd_train)
# if (length(nearZeroVar(kdd_train)) > 0) {
# kdd_train <- kdd_train[, -nearZeroVar(kdd_train-c(1,3,5))] 
# }
# requires/installs the packages
require(class)
# predicts with KNN
#knn(train = kdd_train, test = kdd_train, cl = class, k = 355)
kdd_train$group <- 0
#kdd_train$class <- as.character(kdd_train$class)
# loops through and writes the correct class based on the subclass which is attacks
for(i in 1:nrow(kdd_train))
  if((kdd_train[i,42]=="smurf")|(kdd_train[i,42]=="neptune")|(kdd_train[i,42]=="back")|(kdd_train[i,42]=="teardrop")|(kdd_train[i,42]=="pod")|(kdd_train[i,42]=="land")){
    kdd_train[i,43]="DoS"
  }else if(kdd_train[i,42]=='normal'){
    kdd_train[i,43]="Normal"
  }else if((kdd_train[i,42]=="buffer_overflow")|(kdd_train[i,42]=="loadmodule")|(kdd_train[i,42]=="perl")|(kdd_train[i,42]=="rootkit")){
    kdd_train[i,43]="U2R"
  }else if( (kdd_train[i,42]=="ftp_write")|(kdd_train[i,42]=="guess_passwd")|(kdd_train[i,42]=="multihop")|(kdd_train[i,42]=="phf")|(kdd_train[i,42]=="imap")|(kdd_train[i,42]=="spy")|(kdd_train[i,42]=="warezclient")|(kdd_train[i,42]=="warezmaster")){
    kdd_train[i,43]="R2L"
  }else if((kdd_train[i,42]=="ipsweep")|(kdd_train[i,42]=="nmap")|(kdd_train[i,42]=="portsweep")|(kdd_train[i,42]=="satan")){
    kdd_train[i,43]="Probe"
  }

kdd_train$service = as.character(kdd_train$service)
kdd_train$service[kdd_train$service == "auth"] = 1
kdd_train$service[kdd_train$service == "finger"] = 1
kdd_train$service[kdd_train$service == "bgp"] = 2
kdd_train$service[kdd_train$service == "courier"] = 2
kdd_train$service[kdd_train$service == "csnet_ns"] = 2
kdd_train$service[kdd_train$service == "ctf"] = 2
kdd_train$service[kdd_train$service == "daytime"] = 2
kdd_train$service[kdd_train$service == "discard"] = 2
kdd_train$service[kdd_train$service == "domain"] = 2
kdd_train$service[kdd_train$service == "echo"] = 2
kdd_train$service[kdd_train$service == "ecr_i"] = 2
kdd_train$service[kdd_train$service == "efs"] = 2
kdd_train$service[kdd_train$service == "exec"] = 2
kdd_train$service[kdd_train$service == "gopher"] = 2
kdd_train$service[kdd_train$service == "hostnames"] = 2
kdd_train$service[kdd_train$service == "http_443"] = 2
kdd_train$service[kdd_train$service == "imap4"] = 2
kdd_train$service[kdd_train$service == "iso_tsap"] = 2
kdd_train$service[kdd_train$service == "klogin"] = 2
kdd_train$service[kdd_train$service == "kshell"] = 2
kdd_train$service[kdd_train$service == "ldap"] = 2
kdd_train$service[kdd_train$service == "link"] = 2
kdd_train$service[kdd_train$service == "login"] = 2
kdd_train$service[kdd_train$service == "mtp"] = 2
kdd_train$service[kdd_train$service == "name"] = 2
kdd_train$service[kdd_train$service == "netbios_dgm"] = 2
kdd_train$service[kdd_train$service == "netbios_ns"] = 2
kdd_train$service[kdd_train$service == "netbios_ssn"] = 2
kdd_train$service[kdd_train$service == "netstat"] = 2
kdd_train$service[kdd_train$service == "nnsp"] = 2
kdd_train$service[kdd_train$service == "nntp"] = 2
kdd_train$service[kdd_train$service == "pop_2"] = 2
kdd_train$service[kdd_train$service == "printer"] = 2
kdd_train$service[kdd_train$service == "private"] = 2
kdd_train$service[kdd_train$service == "remote_job"] = 2
kdd_train$service[kdd_train$service == "rje"] = 2
kdd_train$service[kdd_train$service == "shell"] = 2
kdd_train$service[kdd_train$service == "sql_net"] = 2
kdd_train$service[kdd_train$service == "ssh"] = 2
kdd_train$service[kdd_train$service == "sunrpc"] = 2
kdd_train$service[kdd_train$service == "supdup"] = 2
kdd_train$service[kdd_train$service == "systat"] = 2
kdd_train$service[kdd_train$service == "uucp"] = 2
kdd_train$service[kdd_train$service == "uucp_path"] = 2
kdd_train$service[kdd_train$service == "vmnet"] = 2
kdd_train$service[kdd_train$service == "whois"] = 2
kdd_train$service[kdd_train$service == "Z39_50"] = 2
kdd_train$service[kdd_train$service == "domain_u"] = 3
kdd_train$service[kdd_train$service == "ftp_data"] = 3
kdd_train$service[kdd_train$service == "http"] = 3
kdd_train$service[kdd_train$service == "IRC"] = 3
kdd_train$service[kdd_train$service == "ntp_u"] = 3
kdd_train$service[kdd_train$service == "other"] = 3
kdd_train$service[kdd_train$service == "red_i"] = 3
kdd_train$service[kdd_train$service == "smtp"] = 3
kdd_train$service[kdd_train$service == "tftp_u"] = 3
kdd_train$service[kdd_train$service == "urh_i"] = 3
kdd_train$service[kdd_train$service == "urp_i"] = 3
kdd_train$service[kdd_train$service == "X11"] = 3
kdd_train$service[kdd_train$service == "eco_i"] = 4
kdd_train$service[kdd_train$service == "pm_dump"] = 4
kdd_train$service[kdd_train$service == "ftp"] = 5
kdd_train$service[kdd_train$service == "pop_3"] = 6
kdd_train$service[kdd_train$service == "tim_i"] = 6
kdd_train$service[kdd_train$service == "time"] = 6
kdd_train$service[kdd_train$service == "http_8001"] = 3
kdd_train$service[kdd_train$service == "aol"] = 3
kdd_train$service[kdd_train$service == "telnet"] = 7
kdd_train$service = as.factor(kdd_train$service)

kdd_train$flag = as.character(kdd_train$flag)
kdd_train$flag[kdd_train$flag == "SH"] = 1
kdd_train$flag[kdd_train$flag == "SF"] = 2
kdd_train$flag[kdd_train$flag == "S3"] = 3
kdd_train$flag[kdd_train$flag == "S2"] = 4
kdd_train$flag[kdd_train$flag == "S1"] = 5
kdd_train$flag[kdd_train$flag == "S0"] = 6
kdd_train$flag[kdd_train$flag == "RSTR"] = 7
kdd_train$flag[kdd_train$flag == "RSTOS0"] = 8
kdd_train$flag[kdd_train$flag == "RSTO"] = 9
kdd_train$flag[kdd_train$flag == "REJ"] = 10
kdd_train$flag[kdd_train$flag == "OTH"] = 11
kdd_train$flag = as.factor(kdd_train$flag)

kdd_train$protocol_type = as.character(kdd_train$protocol_type)
kdd_train$protocol_type[kdd_train$protocol_type == "tcp"] = 1
kdd_train$protocol_type[kdd_train$protocol_type == "icmp"] = 2
kdd_train$protocol_type[kdd_train$protocol_type == "udp"] = 3
kdd_train$protocol_type = as.factor(kdd_train$protocol_type)


# Remove NAs
kdd_train = na.omit(kdd_train)
# remove zero varaince
#nzv_cols <- nearZeroVar(kdd_train)
#if(length(nzv_cols) > 0) kdd_train <- kdd_train[, -nzv_cols]
kdd_train=kdd_train[, -c(1,7,8,9,11,18,19,20,21,22,34,35,36,37,38,39,40,41)]

trainIndex <- createDataPartition(kdd_train$group, p = .6, list = F)
kddTraining = kdd_train[trainIndex,]
kddTesting = kdd_train[-trainIndex,]
kddTrainingTarget = kddTraining$group

# kddTraining1 = na.omit(kddTraining)
# kddTesting1 = na.omit(kddTesting)
# kddTrainingTarget1 = na.omit(kddTrainingTarget)
knn(kddTraining, kddTesting, kddTrainingTarget, k = 3)
