#' Get data for given filename.
#'
#' @param file_name the file_name
#'
#' @return File content.
#'
#' @export
get_data <- function(file_name) {
    system.file("extdata", file_name, package = "canvasXpress.data")
}
