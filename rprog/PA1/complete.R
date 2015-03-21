complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files

    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    files_list <- list.files(directory, full.names=TRUE)    #creates a list of files
    dat <- data.frame()                                     #creates an empty data frame
    for (i in id) {                                
        dat <- rbind(dat, c(i, sum(complete.cases(read.csv(files_list[i])))))
    }
    names(dat) <- c("id", "nobs")
    dat
}

