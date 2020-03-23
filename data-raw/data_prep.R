## Data preparation
require('dplyr')
require('tidyr')
require('tibble')
require('usethis')
require('readr')
require('GEOquery')
require('glue')


# -- retrieve original data for GSE9750 --

orig.file <- tempfile("data", fileext = ".txt.gz")
download.file('ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE9nnn/GSE9750/matrix/GSE9750_series_matrix.txt.gz', 
              orig.file, mode = 'wb')

# -- expression data --

GSE9750_expression <- read_delim(orig.file, '\t', skip = 73, n_max = 22283) %>% as.data.frame()
rownames(GSE9750_expression) <- GSE9750_expression$ID_REF
GSE9750_expression$ID_REF <- NULL
GSE9750_expression <- GSE9750_expression %>% as.matrix()

# -- gene details --

GSE9750_gene_details <- getGEO("GPL96", destdir = tempdir())
GSE9750_gene_details <- GSE9750_gene_details@dataTable@table %>%
    rename(vars        = ID,
           Description = `Gene Title`,
           Symbol      = `Gene Symbol`) %>%
    select(vars, Description, Symbol) %>%
    mutate(Description = gsub(' ///.*', '', Description),
           Symbol = gsub(' /// ', '; ', Symbol)) %>%
    filter(vars %in% rownames(GSE9750_expression)) %>%
    group_by(Symbol) %>%
    mutate(n_values = n_distinct(vars)) %>%
    ungroup() %>%
    rowwise() %>%
    mutate(Symbol = ifelse(n_values > 1, glue("{Symbol} ({vars})"), Symbol)) %>%
    as.data.frame()
rownames(GSE9750_gene_details) <- GSE9750_gene_details$vars

# -- sample annotations --

GSE9750_sample_annot <- read_delim(orig.file, '\t', skip = 33, n_max = 37) %>%
    t() %>% as.data.frame(stringsAsFactors = F)
colnames(GSE9750_sample_annot) <- gsub('!', '', GSE9750_sample_annot[1, ])
GSE9750_sample_annot <- GSE9750_sample_annot[-1, ]

GSE9750_sample_annot <- GSE9750_sample_annot %>%
    select(Sample_geo_accession, Sample_characteristics_ch1, Sample_description) %>%
    extract(Sample_characteristics_ch1, "Age", "[A|a]ge +([0-9]+)", remove = F) %>%
    extract(Sample_characteristics_ch1, "Stage", "[S|s]tage +([A-Z,0-9]+),", remove = F) %>%
    extract(Sample_characteristics_ch1, "HPV", "(HPV +.*$)", remove = F) %>%
    mutate(HPV         = gsub("HPV", "", HPV),
           Sample_Type = case_when(grepl("cell line", ignore.case = T, Sample_description) ~ "cell line",
                                   grepl("dissect", ignore.case = T, Sample_description) ~ "microdissection",
                                   TRUE ~ "tissue specimen"),
           Sample_Type = ifelse(grepl('dissect', ignore.case = T, Sample_characteristics_ch1), 'microdissection', Sample_Type),
           Cell_Type   = case_when(grepl('squamous', ignore.case = T, Sample_characteristics_ch1) ~ 'squamous cell carcinoma', 
                                   grepl('adenocarcinoma', ignore.case = T, Sample_characteristics_ch1) ~ 'adenocarcinoma',
                                   grepl('normal', ignore.case = T, Sample_characteristics_ch1) ~ 'normal')) %>%
    select(Sample_geo_accession, Sample_Type, Cell_Type, Stage, Age, HPV) %>%
    as.data.frame()

GSE9750_sample_annot$Age <- as.character(cut(as.numeric(GSE9750_sample_annot$Age), 
                                             breaks = c(0, 40, 50, 60, 100),
                                             labels = c("<40", "40-50", "50-60", "60+")))
GSE9750_sample_annot$Age[is.na(GSE9750_sample_annot$Age)] <- "unknown"

rownames(GSE9750_sample_annot) <- GSE9750_sample_annot$Sample_geo_accession
GSE9750_sample_annot$Sample_geo_accession <- NULL

# -- save to package -- #

use_data(GSE9750_expression, overwrite = TRUE)
use_data(GSE9750_gene_details, overwrite = TRUE)
use_data(GSE9750_sample_annot, overwrite = TRUE)

