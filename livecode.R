library("dataMaid")
data(bigPresidentData)
bpd <- bigPresidentData


makeDataReport(bpd, replace=TRUE)




makeDataReport(bpd,
               output = "html",  # Or "pdf" or "word"
               onlyProblematic = TRUE, # only list problems
               mode = c("check", "visualize"), # Tasks to perform
               replace = TRUE, # Overwrite existing output
               visuals = setVisuals(all = "basicVisual"),
               # Checks for numeric
               checks = setChecks(numeric = "identifyOutliers"), 
               reportTitle = "Very nice report",
               maxProbVals = Inf, # How many problematic values to show
               # Use numeric checks for complex class/variables
               treatXasY = list(complex = "numeric"))


check(bpd$stateOfBirth)



allSummaryFunctions()


refCat <- function(v, ...) {
    val <- levels(v)[1]
    summaryResult(list(feature = "Reference category",
                       result = val,
                       value = val))
}


makeDataReport(bpd, output = "html", replace=TRUE, 
               summaries=setSummaries(factor = defaultFactorSummaries(add = "refCat")))



makeCodebook(bpd, replace=TRUE)
