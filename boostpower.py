import sklearn
from sklearn import grid_search, datasets
from sklearn.ensemble import GradientBoostingClassifier
import csv
import random
import pickle

print("trainingpowerNB.csv is opening")

with open("trainingpowerNB.csv", 'rU') as f:  #opens PW file
	reader = csv.reader(f)
	matrix = list(list(rec) for rec in csv.reader(f, delimiter=','))

print("Splitting labels and predictors")

X = [] # X = matrix of train
Y = [] # Y = class Values

z = 0
for row in matrix:
	if z == 0:
		z = 1
		continue
	X += [row[:-2]]
	Y += [row[-1]]

print("Changing strings into numbers")

Y = map(int, Y)
z2 = 0
for row in X:
	X[z2] = map(float, row)
	z2 += 1

print("Doing CV")
gbc = GradientBoostingClassifier(verbose = 1)
param_grid = {"learning_rate": [0.1], "n_estimators": [500], "max_depth": [2, 3]}
# n_estimators is number of trees
# learning rate typically 0.01 and 0.001
# number of splits in each tree (1 works well usually) 225

bestmodel = grid_search.GridSearchCV(gbc, param_grid, cv = 5)

size = len(X)
ind = random.sample(range(size), size/5)
sampleX = [X[x] for x in ind]
sampleY = [Y[x] for x in ind]

ok = bestmodel.fit(sampleX, sampleY)

# ok = bestmodel.fit(X, Y)

print("Cross Validation complete.")

print("Writing out object")

with open("boost_power_CV_0", "wb") as f:
	pickle.dump(ok, f)

print("Best Score is: ")
print(ok.best_score_)

print("Best Parameters are: ")
print(ok.best_params_)

print("Grid Scores are: ")
print(ok.grid_scores_)

print("Script complete.")

# def cv_estimate(n_folds=3):
#     cv = KFold(n=X_train.shape[0], n_folds=n_folds)
#     cv_clf = ensemble.GradientBoostingClassifier(**params)
#     val_scores = np.zeros((n_estimators,), dtype=np.float64)
#     for train, test in cv:
#         cv_clf.fit(X_train[train], y_train[train])
#         val_scores += heldout_score(cv_clf, X_train[test], y_train[test])
#     val_scores /= n_folds
#     return val_scores

# http://scikit-learn.org/stable/auto_examples/ensemble/plot_gradient_boosting_oob.html