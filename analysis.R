library(data.table)
a = fread("totals.csv")
b = as.data.frame(a)
words = names(b)
counts = as.numeric(b[1, ])

# Returns the number of words
# that occur more than CUTOFF

margincount = function(cutoff) {
  return(sum(counts > cutoff))
}


# Choose the left hand cutoff 
# margins then call the function above.

margins = 360:5000
margincounts = sapply(margins, margincount)
plot(margins, margincounts)
abline(v = 500)
abline(v = 10)
abline(h = 10000)
abline(v = 429)

# Find the alpha for 3000 words.

cutoff_locs = head(which(margincounts <= 2500))
alphacutoffs = margins[cutoff_locs]
margincounts[cutoff_locs]


# Extract all the words that pass
# our conditions above. 

indicies = which(counts > 429)
selectedwords = words[indicies]

# Load up word matrix.

wordmatrix = fread("matrix.csv", header = TRUE)
wordmatrix = as.data.frame(wordmatrix)

# Double check that CLASS column exists.

table(wordmatrix$CLASS)

# Double check that FILE column exists.

head(wordmatrix$FILE)
tail(wordmatrix$FILE)

# Double check the sum of columns equals counts variable.

testcounts = apply(wordmatrix[, 1:3], 2, function (x) sum(as.numeric(x)))
testcounts

counts[1:3]

####################################################
#                                                  #
#   Create Validation Set with Equal Proportions   #
#                                                  #
####################################################

total = 7164 + 5352 + 2361 + 7431
child_prop = 7164/total
history_prop = 5352/total
religion_prop = 2361/total
science_prop = 7431/total

child_n = round(300 * child_prop)
history_n = round(300 * history_prop)
religion_n = round(300 * religion_prop)
science_n = round(300 * science_prop)

child_locs = which(wordmatrix$CLASS == 0)
history_locs = which(wordmatrix$CLASS == 1)
religion_locs = which(wordmatrix$CLASS == 2)
science_locs = which(wordmatrix$CLASS == 3)

set.seed(123)
child_sample_index = sample(x = child_locs, size = child_n, replace = FALSE)
history_sample_index = sample(x = history_locs, size = history_n, replace = FALSE)
religion_sample_index = sample(x = religion_locs, size = religion_n, replace = FALSE)
science_sample_index = sample(x = science_locs, size = science_n, replace = FALSE)

validation_set_index = c(child_sample_index, history_sample_index,
                        religion_sample_index, science_sample_index)
validation_set = wordmatrix[validation_set_index, ]

#################################
#                               #
#   Double check prop matrix.   #
#                               #
#################################

props = fread("matrixprop.csv")
props = as.data.frame(props)
dim(props)
dim(wordmatrix)

########################################################
#                                                      #
#   Mess around with power matrix counts of bigrams.   #
#                                                      #
########################################################

totalspower = fread(input = "totalspoweruntrimmed2.csv", header = TRUE, verbose = TRUE)
totalspower = as.data.frame(totalspower)

bigrams = names(totalspower)
bigramcounts = as.numeric(totalspower)

margincount = function(cutoff) {
  return(sum(totalspower > cutoff))
}
margins = seq(0.22442, 1, 0.005)
margincounts = sapply(margins, margincount)
plot(margins, margincounts)

hist(as.numeric(totalspower), breaks = 1000)
max(as.numeric(totalspower))

x = 100
margincount(x)
upperbetalocs = which(bigramcounts > x)
bigrams[upperbetalocs]

# Testing 4 power cuts

totals = fread("totalspower.csv", header = TRUE, data.table = FALSE)
View(totals)

childpower = fread("childpowerCut.csv", header = TRUE, data.table = FALSE)
historypower = fread("historypowerCut.csv", header = TRUE, data.table = FALSE)
religionpower = fread("religionpowerCut.csv", header = TRUE, data.table = FALSE)
sciencepower = fread("sciencepowerCut.csv", header = TRUE, data.table = FALSE)
