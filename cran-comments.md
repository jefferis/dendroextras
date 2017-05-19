## Changes since the last CRAN release

* fix namespace issues resulting in NOTEs for current CRAN build.

## Test environments
* local OS X install, R 3.4.0
* ubuntu 12.04 (on travis-ci), R 3.3.3
* win-builder (devel)

## R CMD check results

On winbuilder

https://win-builder.r-project.org/dNeZvh1v4PAs/00check.log

0 errors | 0 warnings | 1 note


Possibly mis-spelled words in DESCRIPTION:
  Dendrogram (4:49)
  dendrograms (7:53)
  subtree (11:5)

These all seem like false positives.

## Reverse dependencies

I have run R CMD check on the 3 reverse dependencies on CRAN. There were no 
errors or warnings. Two packages had notes but these are unrelated to changes in
dendroextras.
