install:
	Rscript -e 'library(devtools);install_local(".")'

test: install
	Rscript -e 'library(testthat);test_package("nprm")'
