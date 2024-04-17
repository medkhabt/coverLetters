#! /bin/bash 

## This file is concerned by the initialization of an application process 
## First arg is the company name 
## Second arg is the Position name 

mkdir applications 2>/dev/null
mkdir applications/$1 2> /dev/null
## Copy the template of coverletter 
mkdir applications/$1/$2 2> /dev/null 
mkdir applications/$1/$2/src 2>/dev/null
mkdir applications/$1/$2/target 2>/dev/null
mkdir applications/$1/$2/build 2>/dev/null

## I can even create a simlink to the template and change the path each time we add a new level or not , but i don't think it is necessary for now. 
cp .src/template_cover_letter.tex applications/$1/$2/src/cover_letter.tex 
## need to put my cv tex in the
## Just Copy my cv for now. 

## Copy the config file for the coverletter empty 
cp .src/mystyle.sty applications/$1/$2/src 
## Copy the run script, with the option of regenrating the cv. 
cp .src/run.sh applications/$1/$2/src

bash .src/load_config.sh applications/$1/$2/src
#rm load_config.sh
