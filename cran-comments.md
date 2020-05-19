## Comments from Maintainer

Minor fixes and new datasets

---  
    
## Test environments
    
RStudio Server Pro (ubuntu 18.04.2)  

* R 3.5.3  
* R 3.6.3
* R 4.0.0

Travis-CI (ubuntu 16.04.6)

* R 3.6.3
* R 4.0.0
* R devel (2020-05-04 r78358)

WinBuilder

* devtools::check_win_devel()  
* devtools::check_win_release(_R_CHECK_FORCE_SUGGESTS_)  
* devtools::check_win_oldrelease()  


RHub

* devtools::check_rhub(
     env_vars    = c("_R_CHECK_FORCE_SUGGESTS_" = "false"),
     interactive = F)

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
