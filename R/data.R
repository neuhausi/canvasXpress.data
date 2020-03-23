#' canvasXpress datasets
#'
#' This package contains data used and referenced in the canvasXpress R package
#'
#' @docType package
#' @name canvasXpress.data
#' @aliases canvasXpress.data canvasXpress.data-package
NULL

#' Gene Expression Dataset - Cervical Cancer (sample annotation)
#' 
#' @description This example dataset is taken from the below referenced study.  That study was aimed 
#' at identification of gene expression profiles in cervical cancer and the role of specific genes
#' in cervical carcinogenesis.  
#' 
#' This dataset was prepared for visualization by retrieving the sample characteristics from the original data
#' file header. This was followed by reshaping and removal of special characters from the column headers.  The data was
#' further refined through dividing combined data and cleaning to create consistent values across samples before
#' subsetting to extract the sample annotations of interest and binning the Age.
#' 
#' @references Scotto L, Narayan G, Nandula SV, Arias-Pulido H et al. Identification of copy number 
#' gain and overexpressed genes on chromosome arm 20q by an integrative genomic approach in cervical 
#' cancer: potential role in progression. Genes Chromosomes Cancer 2008 Sep; 47(9):755-65. PMID: 18506748
#' 
#' @format A dataframe containing prepared sample annotation data
#' 
"GSE9750_sample_annot"


#' Gene Expression Dataset - Cervical Cancer (expression values)
#' 
#' @description This example dataset is taken from the below referenced study.  That study was aimed 
#' at identification of gene expression profiles in cervical cancer and the role of specific genes
#' in cervical carcinogenesis.  
#' 
#' This dataset was prepared for visualization by retrieving the gene expression values that follow the source 
#' data header information and moving the ID column to the rownames.  This allows the storage and processing of the 
#' large numeric data as a matrix instead of a data frame for efficiency while retaining the ability to join it to
#' the sample annotations and gene information.
#' 
#' @references Scotto L, Narayan G, Nandula SV, Arias-Pulido H et al. Identification of copy number 
#' gain and overexpressed genes on chromosome arm 20q by an integrative genomic approach in cervical 
#' cancer: potential role in progression. Genes Chromosomes Cancer 2008 Sep; 47(9):755-65. PMID: 18506748
#' 
#' @format A numeric matrix containing gene expression data
#' 
"GSE9750_expression"


#' Gene Expression Dataset - Cervical Cancer (gene details)
#' 
#' @description This example dataset is the gene information for genes present in the GSE9750 study referenced 
#' below.  The data was retrieved from the GEOquery package referenced below.
#' 
#' This dataset was prepared for visualization by renaming the columns and subsetting to only the information
#' necessary for visualization.  The Symbol and Description fields were also cleaned and prepared.
#' 
#' @references Davis, S. and Meltzer, P. S. GEOquery: a bridge between the Gene Expression Omnibus (GEO) and
#' BioConductor. Bioinformatics, 2007, 14, 1846-1847
#' 
#' @references Scotto L, Narayan G, Nandula SV, Arias-Pulido H et al. Identification of copy number 
#' gain and overexpressed genes on chromosome arm 20q by an integrative genomic approach in cervical 
#' cancer: potential role in progression. Genes Chromosomes Cancer 2008 Sep; 47(9):755-65. PMID: 18506748
#' 
#' @format A dataframe containing gene metadata for the GSE9750 study
#' 
"GSE9750_gene_details"
