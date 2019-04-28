library(ngram)

load("data/phrasetable2.rda")
load("data/phrasetable3.rda")
load("data/phrasetable4.rda")
load("data/phrasetable5.rda")

get_last_n_words <- function(input_string, n){
    words <- unlist(strsplit(input_string, " "))
    if(n > length(words)){return(input_string)}
    paste(c(words[(length(words) - n + 1):(length(words))], ""), collapse = " ")
}

get_punch <- function(input_pt, input_string){
    punch_of_setup <- input_pt[input_pt$setup == input_string, ]$punch[1]
    return(c(punch_of_setup))
}


# A refactor (modified)
get_prediction <- function(input_string) {
    
    df <- data.frame(current_string = "no1", 
                     suggestion = "no2", 
                     stringsAsFactors = FALSE)

    df$current_string <- preprocess(input_string,
                                 remove.numbers = TRUE,
                                 remove.punct = TRUE)
    df$suggestion <- "the "

    if (df$current_string == ""){
        # df$current_string <- " "
        return(df)
    }

    df$current_string <- get_last_n_words(df$current_string, 4)
    better_suggestion <- get_punch(phrasetable5, df$current_string)
    if (!is.na(better_suggestion)){
        df$suggestion <- better_suggestion
        return(df)
    }

    df$current_string <- get_last_n_words(df$current_string, 3)
    better_suggestion <- get_punch(phrasetable4, df$current_string)
    if (!is.na(better_suggestion)){
        df$suggestion <- better_suggestion
        return(df)
    }

    df$current_string <- get_last_n_words(df$current_string, 2)
    better_suggestion <- get_punch(phrasetable3, df$current_string)
    if (!is.na(better_suggestion)){
        df$suggestion <- better_suggestion
        return(df)
    }

    df$current_string <- get_last_n_words(df$current_string, 1)
    better_suggestion <- get_punch(phrasetable2, df$current_string)
    if (!is.na(better_suggestion)){
        df$suggestion <- better_suggestion
        return(df)
    }
    
    return(df)

}

