{\rtf1\ansi\ansicpg1252\cocoartf2868
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 library(tidyverse)\
library(rvest)\
tv <- read_html('https://tidyverse.org/')\
\
link <- 'https://en.wikipedia.org/wiki/List_of_Formula_One_drivers'\
\
drivers_raw <- read_html(link)\
\
drivers_F1 <- html_element(drivers_raw, 'table.sortable') %>%\
  html_table()\
clean_names()\
\
drivers_sort <- drivers_tmp %>%\
  arrange(\
    by = desc(drivers_championships)\
  )\
\
\
# STEP 1: Prepare the Top 5 Data\
top_5_drivers <- drivers_F1 %>%\
  \
  # THE FIX: Grab ONLY the very 1st character of the string to avoid the "72008" squish bug\
  mutate(`Drivers' Championships` = as.numeric(str_sub(`Drivers' Championships`, 1, 1))) %>%\
  \
  # Remove rows with NA\
  filter(!is.na(`Drivers' Championships`)) %>%\
  \
  # Sort from highest to lowest\
  arrange(desc(`Drivers' Championships`)) %>%\
  \
  # Keep only the top 5 drivers\
  slice_head(n = 5)\
\
# Check the console to make sure it says 7, 7, 5, 4, 4 now!\
print(top_5_drivers)\
\
\
# STEP 2: Draw the Bar Plot\
ggplot(top_5_drivers, aes(x = `Drivers' Championships`, y = reorder(`Driver name`, `Drivers' Championships`))) +\
  \
  geom_col(fill = "steelblue") +\
  \
  # Make the text labels white and inside the bars\
  geom_text(aes(label = `Drivers' Championships`), hjust = 1.5, color = "white", size = 5, fontface = "bold") +\
  \
  labs(\
    title = "Top 5 Most Successful F1 Drivers",\
    x = "World Championships",\
    y = "Driver Name"\
  ) +\
  \
  theme_minimal()\
\
}