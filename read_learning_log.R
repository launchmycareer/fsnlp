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

# Set working directory and load all PDFs
setwd("C:/Users/msoldner/Documents/GitHub/fsnlp/_sources")
files <- list.files(pattern = "pdf$")

# Create function to read in PDF files
Rpdf <- readPDF(control = list(text = "-layout"))

# Read in logs
learning.logs <- Corpus(URISource(files), readerControl = list(reader = Rpdf))
ll.corpus <- corpus(learning.logs)
summary(ll.corpus)
