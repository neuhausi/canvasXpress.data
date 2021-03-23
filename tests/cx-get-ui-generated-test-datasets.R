if (interactive()) {
    library(dplyr)

    webFile <- readLines(con = "https://canvasxpress.org/data/cX-function.R")
    
    # fixes to URLs if required - these are known issues with the URLs in the test file
    webFile <- gsub("https://www.canvasxpress.org/data/cX-olympicMedals",
                    "https://www.canvasxpress.org/data/cX-OlympicMedals", webFile)
    
    #grab url download links
    dataUrls <- data.frame(line = webFile, stringsAsFactors = F) %>%
        filter(grepl('read.table("https://www.canvasxpress.org', line,  fixed = TRUE)) %>%
        #exclude specific larger files
        filter(!grepl('cX-codiv|LungCancinoma|visium|Olympic|exprtcga', line)) %>% 
        mutate(url = gsub('.*=read.table\\("', '', line),
               url = gsub('", .*', '', url)) %>%
        select(url) %>%
        distinct()

    # save all the datasets to the inst/extdata directory
    for (url in dataUrls$url) {
        loc <- file(url, method = "libcurl")
        data <- readLines(loc)
        close(loc)

        filename <- gsub('.*/', '', url)
        gzcon <- gzfile(paste0("inst/extdata/", filename, ".gz"), "w")
        writeLines(data, gzcon)
        close(gzcon)
    }

    message("Package must be rebuilt and reloaded in order to realize any new data files for testing")
} else {
    message("Setup not run - only can be run interactively")
}
