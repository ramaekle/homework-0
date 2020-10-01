# annotation
a <- list(text = "Stock Split",
          x = '2017-06-11',
          y = 1.02,
          xref = 'x',
          yref = 'paper',
          xanchor = 'left',
          showarrow = FALSE
)

# use shapes to create a line
l <- list(type = line,
          x0 = '2017-06-11',
          x1 = '2017-06-11',
          y0 = 0,
          y1 = 1,
          xref = 'x',
          yref = 'paper',
          line = list(color = 'black',
                      width = 0.5)
)

p <- df %>%
  plot_ly(
    type = "scatter",        # all "scatter" attributes: https://plot.ly/r/reference/#scatter
    x = ~Date,               # more about scatter's "x": /r/reference/#scatter-x
    y = ~XLE.Close,            # more about scatter's "y": /r/reference/#scatter-y
    name = "Close",   # more about scatter's "name": /r/reference/#scatter-name
    mode = "lines",
    line = list(
      color = "#FFEE58"
      )  
    ) %>%
  
  add_trace(
    x = ~Date,                                         # scatter's "x": /r/reference/#scatter-x
    y = ~fitted(loess(XLE.Close ~ as.numeric(Date))),  # scatter's "y": /r/reference/#scatter-y
    name = 'Curve',
    mode = 'lines',                                    # scatter's "y": /r/reference/#scatter-mode
    line = list(                                       # line is a named list, valid keys: /r/reference/#scatter-line
      color = "#5E88FC",                               # line's "color": /r/reference/#scatter-line-color
      dash = "dashed"                                  # line's "dash" property: /r/reference/#scatter-line-dash
    )
  ) %>%
  
  add_trace(
    x = ~Date,                                         # scatter's "x": /r/reference/#scatter-x
    y = ~fitted(loess(XLE.High ~ as.numeric(Date))),  # scatter's "y": /r/reference/#scatter-y
    name = 'Curve',
    mode = 'lines',                                    # scatter's "y": /r/reference/#scatter-mode
    line = list(                                       # line is a named list, valid keys: /r/reference/#scatter-line
      color = "#5E88FC",                               # line's "color": /r/reference/#scatter-line-color
      dash = "dashed"                                  # line's "dash" property: /r/reference/#scatter-line-dash
    )
  ) %>%
  
  layout(
    title = "XLE Close", 
    xaxis = list(title = "Date"),
    yaxis = list(title = "XLE Closing Price"),
    annotations = a,
    shapes = l
    )
