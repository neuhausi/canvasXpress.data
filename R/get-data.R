#' Get the file handle for given file in the package
#'
#' @param file_name the file name to retrieve (from the extdata folder)
#'
#' @return File handle to the given file or "" if it does not exist
#'
#' @examples
#' 
#' sannot_file <- get_data("network_compact.tsv")
#' 
#' # then read the file, for example:
#' # data <- read.delim(sannot_file)
#' # head(data)
#'
#' @export
get_data <- function(file_name) {
    system.file("extdata", file_name, package = "canvasXpress.data")
}
