# http://stackoverflow.com/questions/1975110/printing-stack-trace-and-continuing-after-error-occurs-in-r

options(keep.source = TRUE, error = quote({
  cat("Environment:\n", file=stderr())

  # TODO: setup option for dumping to a file (?)
  # Set `to.file` argument to write this to a file for post-mortem debugging
  dump.frames()  # writes to last.dump

  #
  # Debugging in R
  #   http://www.stats.uwo.ca/faculty/murdoch/software/debuggingR/index.shtml
  #
  # Post-mortem debugging
  #   http://www.stats.uwo.ca/faculty/murdoch/software/debuggingR/pmd.shtml
  #
  # Relation functions:
  #   dump.frames
  #   recover
  # >>limitedLabels  (formatting of the dump with source/line numbers)
  #   sys.frame (and associated)
  #   traceback
  #   geterrmessage
  #
  # Output based on the debugger function definition.

  n <- length(last.dump)
  calls <- names(last.dump)

  log_error(geterrmessage())
  log_error(paste("  ", 1L:n, ": ", calls, sep = ""))

}))
