## Comments from Maintainer

This is a new package - it is a split off of the data from the canvasXpress R package, as that package reached the 5MB 
limit as of 1.25.6.  

The version number matches the version of the canvasXpress R package as of the data split so starts at a larger version
than perhaps expected.  After this package's approval the canvasXpress package will be updated to suggest this package 
and depend on the datasets for the shiny examples as well as the automated testthat tests.

Per review requests the following changes have been made:  

* better information on the dataset(s) in this package in previous reviews:  
  * I have updated attribution and informaton for the dataset GSE9750, and created a more reusable data preparation script.  
* reference the DOI links in the DESCRIPTION file's description section  
* fix the README.md links
* separate the output format out of a list into the 3 components previously submitted

Thanks again for your consideration.

---  
    
## Test environments
    
RStudio Server Pro (ubuntu 18.04.2)  

* R 3.4.4  
* R 3.5.3  
* R 3.6.2

Travis-CI (ubuntu 16.04.6)

* R 3.5.3
* R 3.6.2
* R devel (2020-03-13 r77948)

WinBuilder

* devtools::check_win_devel()  
* devtools::check_win_release()  
* devtools::check_win_oldrelease()  


RHub

* devtools::check_rhub(interactive = F)

---  
    
## R CMD check results
    
    
```
devtools::check()  

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

---  
    
## Reverse dependencies
    
    
**NONE**

Note: The canvasXpress package will suggest the use of this package
    
```
pdb <- available.packages()
tools::package_dependencies(packages = c('canvasxpress.data'),
                            db = pdb, reverse = TRUE)

$canvasXpress.data 
NULL
```
