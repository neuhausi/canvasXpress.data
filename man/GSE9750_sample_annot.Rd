% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{GSE9750_sample_annot}
\alias{GSE9750_sample_annot}
\title{Gene Expression Dataset - Cervical Cancer (sample annotation)}
\format{
A dataframe containing prepared sample annotation data
}
\usage{
GSE9750_sample_annot
}
\description{
This example dataset is taken from the below referenced study.  That study was aimed 
at identification of gene expression profiles in cervical cancer and the role of specific genes
in cervical carcinogenesis.  

This dataset was prepared for visualization by retrieving the sample characteristics from the original data
file header. This was followed by reshaping and removal of special characters from the column headers.  The data was
further refined through dividing combined data and cleaning to create consistent values across samples before
subsetting to extract the sample annotations of interest and binning the Age.
}
\references{
Scotto L, Narayan G, Nandula SV, Arias-Pulido H et al. Identification of copy number 
gain and overexpressed genes on chromosome arm 20q by an integrative genomic approach in cervical 
cancer: potential role in progression. Genes Chromosomes Cancer 2008 Sep; 47(9):755-65. PMID: 18506748
}
\keyword{datasets}
