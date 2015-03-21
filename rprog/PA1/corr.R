corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0

    ## Return a numeric vector of correlations
    files_list <- list.files(directory, full.names=TRUE)

    vec <- vector(mode="numeric")
    for (file in files_list) {
        df <- read.csv(file)
        b <- complete.cases(df)
        if (sum(b) > threshold) {
            vec <- c(vec, cor(df[b, 2], df[b, 3]))
        }
    }
    vec
}

