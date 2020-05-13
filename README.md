# text_prediction
What word will be typed next?

## Overview

This prediction model was built in R using the `ngram` package.  The model works by first reading the last four words typed, and then suggesting which word in the dataset most often follows that particular 4-gram.  If no good suggestion is found, either because that four word phrase is not common enough or because there are not yet four words typed, then it repeats the process using only the last three words typed instead, and so on.

This Shiny App was written by Rob Creel for the Data Science Capstone course taught through Coursera by faculty of the Biostatistics Department at the Johns Hopkins Bloomberg School of Public Health. 