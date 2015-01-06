#' Plot Calendar Heat Map
#'
#'
#'
#' @import htmlwidgets
#'
#' @export
calheatmap <- function(x, y, data, domain, start, ...,
    width = NULL, height = NULL) {

  data[x] <- as.numeric(as.POSIXct(data[[x]]))
  dat <- setNames(as.list(data[[y]]), data[[x]])

  # forward options using x
  x = list(
    data = dat,
    domain = domain,
    start = start,
    ...
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'calheatmap',
    x,
    width = width,
    height = height,
    package = 'rChartsCalmap'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
calheatmapOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'calheatmap', width, height, package = 'rChartsCalmap')
}

#' Widget render function for use in Shiny
#'
#' @export
renderCalheatmap <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, calheatmapOutput, env, quoted = TRUE)
}
