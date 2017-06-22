#
#
# read_learning_log.R
#
# Matthew Soldner
# American Institutes for Research
#
#

library(tm)
library(quanteda)
library(RColorBrewer)

# Set working directory and load all PDFs
setwd("C:/Users/msoldner/Documents/GitHub/fsnlp/_sources")
files <- list.files(pattern = "pdf$")

# Create function to read in PDF files
Rpdf <- readPDF(control = list(text = "-layout"))

# Read in logs
learning.logs <- Corpus(URISource(files), readerControl = list(reader = Rpdf))
learning.logs <- tm_map(learning.logs, removePunctuation)
ll.corpus <- corpus(learning.logs)
summary(ll.corpus)

specific_stopwords <- c("communityâ-termsâ-andâ-conditions", " monthlyâ�current", "dctdecode")
specific_stopwords <- c(specific_stopwords, "eduâ", "s", "ï", "http", "bmgf.force.com", "error")
specific_stopwords <- c(specific_stopwords, "log", "filter", "â-")

myStemMat <- dfm(ll.corpus, 
  remove = c(stopwords("english"), specific_stopwords), 
  remove_punct = TRUE,
  remove_numbers = TRUE,
  verbose = TRUE,
  stem=TRUE)

textplot_wordcloud(myStemMat, min.freq = 25)


