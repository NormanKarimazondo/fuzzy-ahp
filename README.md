Fuzzy-AHP for landfill site selection in R 3.5.0

Criteria weighting: -install.packages("fuzzyAHP") 
-install library(fuzzyAHP). 
-create comparison matrix using the matrix() function in terms of Saaty's scale. 
-load FuzzyAHP library -use pairwiseComparisonMatrix() function converts the input matrix.
-calculate CR using consistencyRatio() function. 
-calculate the weights using the calculateWeights() function.


Ranking alternatives:

-create a fuzzy comparison matrix 
-calculate the the fuzzy AHP results 
-defuzzify the results using the Yager method 
-ranked the alternatives based on defuzzified results.
