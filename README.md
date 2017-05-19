# dendroextras

[![Release Version](https://img.shields.io/github/release/jefferis/dendroextras.svg)](https://github.com/jefferis/dendroextras/releases/latest) 
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/dendroextras)](https://cran.r-project.org/package=dendroextras) 
[![Build Status](https://travis-ci.org/jefferis/dendroextras.svg)](https://travis-ci.org/jefferis/dendroextras)


An R package providing additional functions to cut, label and colour dendrogram clusters.

## Installation
### Released versions
The recommendation is to install from [CRAN](https://cran.r-project.org/).

```r
install.packages("dendroextras")
```

### Bleeding Edge
You can, however, download the [tar ball](https://github.com/jefferis/dendroextras/tarball/master), and run `R CMD INSTALL` on it, or use the **devtools** package to install the development version:

```r
# install.packages("devtools")

library(devtools)
install_github("dendroextras", "jefferis")
```

Note: Windows users need [Rtools](http://www.murdoch-sutherland.com/Rtools/) and [devtools](https://CRAN.R-project.org/package=devtools) to install this way.
