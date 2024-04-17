## How to initialize a new application

```
bash init_application.sh [Company Name] [Role Name]
```
this will create 

```
applications/
└── Firm Name  
    └── Role Name  
        ├── build
        ├── src
        │   ├── cover_letter.tex
        │   ├── mystyle.sty 
        │   └── run.sh
        └── target
``` 

- the cover_letter.tex is the template created in ./src that is copied. Normally you shouldn't touch it but in case you want to change somehting about the template, it is the best place to go.  
- the mystyle.sty is the file that should be filled normally, with the information that is necessary to focus on in writing a cover letter.  

to compile the file and look at the resulted pdf. You should run 
``` 
bash run.sh cover_letter.tex
```
which will generate the following files, and display the file ( at least for OSX 'using open' ). You can also just use (`pdflatex cover_letter.tex`)  
```
        ├── build
        │   ├── cover_letter.aux
        │   ├── cover_letter.log
        │   └── cover_letter.out
        └── target
            └── cover_letter.pdf
```


In case some of the parameters, configurations (the mystyle.sty parameters) are commun between different applications. you can fill them up in the file `configs/shared_configs.xml`, when you generate the application it will fill the parameters in the corresponding `mystyle.sty` file
