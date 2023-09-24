library(flexdashboard)
library(htmlwidgets)
library(jsonlite)
library(gridExtra)
library(readr)
library(ggthemes)
library(scales)
library(zoo)
library(knitr)
library(kableExtra)
library(RColorBrewer)
library(shiny)
library(DT)
library(rsconnect)
library(httr)
library(tidyverse)
library(writexl)

## Data Path
file_path <- "C:/Users/riese/Desktop/Liars Dice/Text Files"
file_vector <- list.files(file_path)
path_vector <- str_c(file_path ,"/" ,file_vector)

## Reading in the text files
data <- NULL

for (i in 1:length(path_vector)) {
  temp <- read_tsv(path_vector[i] ,show_col_types = FALSE) %>% 
    mutate(source    = file_vector[i]
           ,game_num = str_extract(source ,pattern = "[0-9]{5,6}")
    )
  colnames(temp)[1] <- c("info")
  data <- bind_rows(data ,temp)
}

data %>% 
  write_csv("text data.csv")
