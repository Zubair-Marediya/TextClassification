#svmtester
# takes in parameters and trains a svm model with those parameters

import sklearn
from sklearn.ensemble import GradientBoostingClassifier
from sklearn import grid_search, datasets
import csv
import random
import numpy as np
import pickle
import re

print("testpowerNB.csv is opening")

# trainingwordpower trainingword
with open("testpowerNB.csv", 'rU') as f:  #opens PW file
	reader = csv.reader(f)
	testmatrix = list(list(rec) for rec in csv.reader(f, delimiter=','))

print("boostpowerNBmodel is opening")

with open("boostpowerNBmodel", "rb") as f: #"goodSVM"
	goodmodel = pickle.load(f)

print("Splitting labels and predictors")
file_names =[]
X = [] # X = matrix of train

z = 0
z2 = 0
for row in testmatrix:
	if z == 0:
		z = 1
		continue
	X += [row[:-1]]
	file_names += [row[-1]]
	z2 += 1
	print(z2)

print("Changing strings into numbers")

z2 = 0
for row in X:
	X[z2] = map(float, row)
	z2 += 1

print("Making predictions")

predicted = goodmodel.predict(X)

def numonly(x):
	return int(re.sub("[^0-9]", "", x))

print("Fixing file names.")

file_names = map(numonly, file_names)

print("Resorting predictions")

final = zip(file_names, list(predicted))
final.sort()
x = map(list, final)

x = [["id", "category"]] + x

print("Writing out predictions")

with open("testboostpowerpred.csv", "wb") as f:
	writer = csv.writer(f)
	writer.writerows(x)
	
print("Script complete")

