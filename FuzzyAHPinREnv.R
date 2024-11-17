comparisonMatrix = matrix (c("1","1","1","3","1","4","1","1","3","7","6",
                             "1","1","1","3","1","4","1","1","3","8","7",
                             "1","1","1","2","3","6","1","1","4","6","6",
                             "1/3","1/3","1/2","1","2","3","1/3","1/2","4","4","5",
                             "1","1","1/3","1/2","1","5","1","1","5","7","5",
                             "1/4","1/4","1/6","1/3","1/5","1","1/5","1/7","1/3","1","1",
                             "1","1","1","3","1","5","1","1","3","5","7",
                             "1","1","1","2","1","7","1","1","4","4","5",
                             "1/3","1/3","1/4","1/4","1/5","3","1/3","1/4","1","1","1",
                             "1/7","1/8","1/6","1/4","1/7","1","1/5","1/4","1","1","2",
                             "1/6","1/7","1/6","1/5","1/5","1","1/7","1/5","1","1/2","1"),  
                           nrow = 11, ncol = 11, byrow = TRUE)

rownames(comparisonMatrix)=c("WB","EV","SP","ST","RD","RL","LU","LC","PD","ED","PL")                
colnames(comparisonMatrix)=c("WB","EV","SP","ST","RD","RL","LU","LC","PD","ED","PL")                

comparisonMatrix
library(FuzzyAHP)
comparisonMatrix = pairwiseComparisonMatrix(comparisonMatrix)
show(comparisonMatrix)
print(comparisonMatrix)

CR = consistencyRatio(comparisonMatrix); CR
weights = calculateWeights(comparisonMatrix)
print(weights)



values = c(6,	6,	3,	1,	5,	1,	2,	1,	5,	2,	2,
           5,	5,	6,	1,	6,	2,	2,	1,	4,	1,	1,
           4,	4,	1,	3,	3,	3,	1,	1,	6,	3,	4,
           2,	3,	5,	3,	1,	5,	1,	1,	1,	5,	5,
           3,	1,	2,	3,	4,	6,	1,	1,	3,	6,	6,
           1,	2,	4,	3,	2,	4,	1,	1,	2,	4,	3)
values = matrix(values,nrow = length(values)/length(weights@weights),
                ncol = length(weights@weights),byrow = TRUE)


fuzzyComparisonMatrix = fuzzyPairwiseComparisonMatrix(comparisonMatrix)
print(fuzzyComparisonMatrix)

fuzzyresults = calculateAHP(fuzzyComparisonMatrix, values);fuzzyresults
deffuzified = defuzziffy(fuzzyresults,"Yager")
print(deffuzified)

fuzzyrank = (nrow(values)+1) -
  sum(is.na(deffuzified))-
  rank(deffuzified, na.last = "keep", ties.method = "max")
print(fuzzyrank)

fuzzyfullresults =cbind(fuzzyComparisonMatrix, fuzzyresults, fuzzyrank)
colnames(fuzzyfullresults) = c("WB","EV","SP","ST","RD","RL","LU","LC","PD","ED","PL")
rownames(fuzzyfullresults) = c("A","c","D","E","F","G");fuzzyfullresults
print(fuzzyfullresults)

