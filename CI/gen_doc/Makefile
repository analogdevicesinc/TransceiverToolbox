# Usage:
#	make <target> MLRELEASE=<MATLAB release version ex: R2018b> HDLBRANCH=<HDL git branch ex: hdl_2018_r1>
# Example
#	make build MLRELEASE=R2018b HDLBRANCH=hdl_2018_r1

SHELL := /bin/bash

MLFLAGS := -nodisplay -nodesktop -nosplash

ifeq ($(MLRELEASE),)
MLRELEASE := R2021a
endif

ifeq ($(HDLBRANCH),)
HDLBRANCH := hdl_2018_r2
endif

ifeq ($(OS),Windows_NT)
MLPATH := /cygdrive/c/Program\ Files/MATLAB
MLFLAGS := $(MLFLAGS) -wait
else
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
MLPATH := /usr/local/MATLAB
endif
ifeq ($(UNAME_S),Darwin)
MLPATH := /Applications
MLRELEASE := MATLAB_${MLRELEASE}.app
endif
endif

ifeq ($(BOARD),)
BOARD :=
endif

ifeq ($(INCLUDE_EXAMPLES),)
INCLUDE_EXAMPLES := 1
endif

GITTAG := $(shell git describe --tags HEAD)

.ONESHELL:
doc_ml:
	cd docs ; \
	MATLAB=ON python3 gen_all_doc.py ; \
	cd .. ; \
	mkdir mdoc ; \
	sleep 1 ; \
	mkdocs build -d mdoc ; \
	cd ../.. ; \
	rm -rf doc ; \
	mv CI/gen_doc/mdoc doc

doc:
	cd docs ; \
	python3 gen_all_doc.py ; \
	cd .. ; \
	mkdir mdoc ; \
	sleep 1 ; \
	mkdocs build -d mdoc ; \
	cd ../.. ; \
	rm -rf doc ; \
	mv CI/gen_doc/mdoc doc
