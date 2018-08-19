library(tidyverse)
#this script compares a list of emails you want to make sure are included in a campaign against an existing master list,
#creates a list of those that are missing in the master and tells you how many unique emails are missing.
#It assumes both lists are on separate csv files with the emails in a column named "EMAIL".

master <- read_csv("add_file_path_for_master_list.csv")
vips <- read_csv("add_file_path_for_vip_list.csv")

vips$EMAIL <- trimws(vips$EMAIL)
master$EMAIL <- trimws(master$EMAIL)

missing <- anti_join(vips, master, by = c("EMAIL" = "EMAIL"))

n_distinct(missing$EMAIL)
