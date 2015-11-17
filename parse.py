import os
import glob
import re

# Prepare the path for all .txt files. 

base_path = os.path.abspath(os.path.dirname(__file__))
txt_path = os.path.join(base_path, "Training", "*", "*.txt")

# Create category paths seperately, in case we need them. 

child_path = os.path.join(base_path, "Training", "Child(0)", "*.txt")
history_path = os.path.join(base_path, "Training", "History(1)", "*.txt")
religion_path = os.path.join(base_path, "Training", "Religion(2)", "*.txt")
science_path = os.path.join(base_path, "Training", "Science(3)", "*.txt")

# Function that opens the file at PATH, 
# parses out words, and returns them as
# lower case and splitted.

def parse(path):
	file = open(path)
	print(path)
	text = file.read()
	words = text.lower().split()
	words = list(map(remSym, words))
	words = list(filter(None, words))
	return words

# Takes input x, and removes all characters not a lower case alphabet.

def remSym(x):
	return re.sub("[^a-z]", "", x)

wordlist = []
i = 0
for file in glob.glob(txt_path):
	new_wordlist = parse(file)
	wordlist += new_wordlist
	i += 1
print(i)
wordset = set(wordlist)

i = 0
for file in glob.glob(child_path):
	i += 1
for file in glob.glob(history_path):
	i += 1
for file in glob.glob(religion_path):
	i += 1
for file in glob.glob(science_path):
	i += 1
print(i)
