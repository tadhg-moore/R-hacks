#' Using "Jobs" in R
#' 
#' Author: Tadhg Moore
#' Date: 2021-04-21

# For loops ====
files <- list.files("data/surftemp/", full.names = TRUE)
files
length(files)

df <- read.csv(files[1])
head(df)
tail(df)

for( i in files) {
  # Reading in file ----
  message("Starting ", i)
  df <- read.csv(i)
  if(i == files[1]) {
    df2 <- df
  } else {
    df2 <- rbind(df2, df)
  }
  # Finished loop ----
}

# Finishing job ----
Sys.sleep(5)
