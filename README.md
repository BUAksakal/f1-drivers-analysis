# F1 Drivers Analysis

A simple R project that scrapes Formula One driver statistics from Wikipedia and visualizes the most successful drivers by world championships.

## What it does

- Scrapes the [List of Formula One drivers](https://en.wikipedia.org/wiki/List_of_Formula_One_drivers) table from Wikipedia using `rvest`
- Cleans and processes the data with `tidyverse`
- Plots the top 15 drivers by championship titles using `ggplot2`

## Requirements

```r
install.packages(c("tidyverse", "rvest"))
```

## Usage

Just run `f1_analysis.R` — no external data files needed, it pulls directly from Wikipedia.

## Output
![Uploading 0f9a3eeb-fe3a-4e5a-ba65-3a483bf94e3d.png…]()

A horizontal bar chart of the top 15 F1 drivers ranked by world championship titles, with race wins as a tiebreaker.

## Data Source

[Wikipedia — List of Formula One drivers](https://en.wikipedia.org/wiki/List_of_Formula_One_drivers)
