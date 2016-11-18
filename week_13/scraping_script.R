library(tidyverse)
library(rvest)

# search for articles on nitrogen
base_url <- "http://www.mdpi.com"
url <- paste0(base_url, "/search?q=nitrogen&authors=&article_type=&journal=agronomy&section=&special_issue=&search=Search")

# A. get all links in the page
nitrogen_data <-read_html(url)
html_nodes(nitrogen_data, "a")

# B. versus how class got all links
read_html(url) %>%
    html_nodes("a") -> all_links

# filter out only HTML full text links
html_text(all_links, trim = TRUE) -> links_text

all_links[links_text == "HTML Full-text"] %>%
  html_attr(name = "href") -> paper_urls

# follow first link and scrape for title, author, dates, and tables 
first_url <- paper_urls[1]


# make it a function


# apply function to every url
