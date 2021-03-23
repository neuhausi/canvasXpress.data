## Comments from Maintainer


---  
    
## Test environments
    
RStudio Server Pro (ubuntu 18.04.2)  

* R 3.6.3
* R 4.0.2

Travis-CI (ubuntu 16.04.6)

* R 3.6.3
* R 4.0.2
* R devel (2021-03-17 r80092)

WinBuilder

* devtools::check_win_devel()  
* devtools::check_win_release()  

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

* canvasXpress    

```
revdepcheck::cran_revdeps('canvasXpress.data')

[1] "canvasXpress"      "canvasXpress.data"
```

```
revdepcheck::revdep_reset()
revdepcheck::revdep_check()
revdepcheck::revdep_report_cran()

## revdepcheck results

We checked 1 reverse dependencies (0 from CRAN + 1 from BioConductor), comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages

```
