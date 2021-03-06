.PHONY: initialcounts trimmedcounts wordmatrix powerparse powercounts powermatrix
		stemparse stemcounts stemmatrix custommatrix1 testmatrix testmatrixstem
		testmatrixcustom testmatrixpower svmmodel filteredmatrixword filteredmatrixpower
		svmmaker svmtester trainingwordfeatures svmmodelradial boostmodelCV svmmodellinearwordCV
		svmmodellinearpowerCV svmmodelradialwordCV svmmodelradialpowerCV

initialcounts:
	python parse.py
trimmedcounts:
	python importcsv.py
wordmatrix:
	python wordmatrix.py
powerparse:
	ipython powerparse.py
powercounts:
	ipython powerimportcsv.py
powermatrix:
	ipython powerwordmatrix.py
stemparse:
	ipython stemparse.py
stemcounts:
	ipython stemimportcsv.py
stemmatrix:
	ipython stemwordmatrix.py
custommatrix:
	ipython custommatrix.py
testmatrix:
	ipython testwordmatrix.py
testmatrixstem:
	ipython teststemmatrix.py
testmatrixcustom:
	ipython testcustommatrix.py
testmatrixpower:
	ipython testpowermatrix.py
svmmodellinearCV:
	ipython svm.py
filteredmatrixword:
	ipython filteredwordmatrix.py
filteredmatrixpower:
	ipython filteredpowermatrix.py
svmmaker:
	ipython svmmaker.py
svmtester:
	ipython svmtester.py
trainingwordfeatures:
	ipython parse.py
	ipython importcsv.py
	ipython filteredwordmatrix.py
svmmodelradialCV:
	ipython svmradial.py
boostmodelCV:
	ipython boost.py
svmmodellinearwordCV:
	ipython svmlinearword.py
svmmodellinearpowerCV:
	ipython svmlinearpower.py
svmmodelradialwordCV:
	ipython svmradialword.py
svmmodelradialpowerCV:
	ipython svmradialpower.py
boostmodelwordCV:
	ipython boostword.py
boostmodelpowerCV:
	ipython boostpower.py
boostmaker:
	ipython boostmaker.py
boostmakerwordpower:
	ipython boostmakerwordpower.py
boosttester:
	ipython boosttester.py
svmmakerradial:
	ipython svmmakerradial.py
svmmakerradial2:
	ipython svmmakerradial2.py
svmmodelradial2CV:
	ipython svmradial2.py
svmmodelradial3CV:
	ipython svmradial3.py
svmmodelradial4CV:
	ipython svmradial4.py
svmmodelradial5CV:
	ipython svmradial5.py	
svmmodelradial6CV:
	ipython svmradial6.py
svmmodelradialword2CV:
	ipython svmradialword2.py
svmmodelradialword3CV:
	ipython svmradialword3.py
svmmodelradialword4CV:
	ipython svmradialword4.py
svmmodelradialword5CV:
	ipython svmradialword5.py
svmmodelradialword6CV:
	ipython svmradialword6.py
svmmodelradialword7CV:
	ipython svmradialword7.py
svmmodelradialword8CV:
	ipython svmradialword8.py
boostmodelword2CV:
	ipython boostword2.py
boostmodelword3CV:
	ipython boostword3.py
boostmodelword4CV:
	ipython boostword4.py
svmmodelradialword9CV:
	ipython svmradialword9.py
svmmodelradialword10CV:
	ipython svmradialword10.py
svmmodelradialword11CV:
	ipython svmradialword11.py
svmmodelradialword12CV:
	ipython svmradialword12.py
svmmodelradialword13CV:
	ipython svmradialword13.py
svmmodelradialword14CV:
	ipython svmradialword14.py
svmmodelradialword15CV:
	ipython svmradialword15.py
svmmodelradialword16CV:
	ipython svmradialword16.py
svmmakerradial3:
	ipython svmmakerradial3.py
svmmakerradial4:
	ipython svmmakerradial4.py

