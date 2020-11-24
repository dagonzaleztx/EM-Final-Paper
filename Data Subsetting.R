


#####Data Subsetting####

#This is preliminary subsetting of data that will be sent over to my partner Zhonghao. Due to email size restrictions, I will have to compress the files, but before that, I will need to remove unncessary covariates to avoid. This will, hopefully, preclude the necessity of splitting the data set and having him reassemble it.

acs2018 = read.csv("C:/Users/David/Documents/Econ - Markets for Electricity/Term Paper/csv_htx/psam_h48.csv")

acs2018 = acs2018[, - (159:237)] #Remove reclication weights

#Add a year column
acs2018$year = substr(acs2018$SERIALNO, 1,4)

#Remove geographies that are uniform
acs2018 = acs2018[, - c("RT", "DIVISION", "REGION", "ST")]
acs2018 = acs2018[setdiff(names(acs2018), c("RT", "DIVISION", "REGION", "ST"))]

#Now, let's split the data frame

acs2018_basic = acs2018[1:7]
acs2018_unit = acs2018[, c(1, 8:57)]
acs2018_household = acs2018[, c(1, 58:96)]
acs2018_flags = acs2018[, c(1,97:155)]

write.csv(acs2018_basic,"C:/Users/David/Documents/Econ - Markets for Electricity/Term Paper/acs2018_basic.csv", row.names = FALSE)
write.csv(acs2018_unit,"C:/Users/David/Documents/Econ - Markets for Electricity/Term Paper/acs2018_unit.csv", row.names = FALSE)
write.csv(acs2018_household,"C:/Users/David/Documents/Econ - Markets for Electricity/Term Paper/acs2018_household.csv", row.names = FALSE)
write.csv(acs2018_flags,"C:/Users/David/Documents/Econ - Markets for Electricity/Term Paper/acs2018_flags.csv", row.names = FALSE)