## Comments from Maintainer

* Updated to remove online-available test data for canvasXpress to match the updated expectations in that package
* Added an example to the only function in the package :-)

---  
    
## Test environments


RStudio Server Pro (ubuntu 18.04.2)  

* R 3.6.3
* R 4.0.5
* R 4.1.0

Travis-CI (ubuntu 16.04.6)

* R 3.6.3
* R 4.0.2
* R devel (2021-06-20 r80534)

WinBuilder

* devtools::check_win_devel()  
* devtools::check_win_release()  

RHub

* devtools::check_rhub(interactive = F, 
                       env_vars    = c(`_R_CHECK_FORCE_SUGGESTS_` = "false"))


---  
    
## R CMD check results
    
    
```
devtools::check()  

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

---  
    
## Reverse dependencies

* canvasXpress    

```
revdepcheck::cran_revdeps('canvasXpress.data')

[1] "canvasXpress"      "canvasXpress.data"
```

```
revdepcheck::revdep_report_cran()

## revdepcheck results

We checked 1 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
```
