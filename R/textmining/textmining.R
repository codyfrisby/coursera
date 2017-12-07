# text mining in R
# read email text
# example from documentation
library(tm)
newsgroup <- system.file("mails", package = "tm.plugin.mail")
news <- VCorpus(DirSource(newsgroup), 
                readerControl = list(reader = readMail))
inspect(news)

# doing it on my own mail
m <- VCorpus(DirSource("messages"), 
             readerControl = list(reader = readMail))
inspect(m)
lapply(m, "[[", 1)
# this creates a huge string of text
test <- unlist(lapply(m, "[[", 1))

# example from https://www.springboard.com/blog/text-mining-in-r/
library(RSQLite)
db <- dbConnect(dbDriver("SQLite"), "~/Documents/mooc/textmining/hillary-clinton-emails/database.sqlite")
emailHillary <- dbGetQuery(db, "SELECT ExtractedBodyText EmailBody FROM Emails e INNER JOIN Persons p ON e.SenderPersonId=P.Id WHERE p.Name='Hillary Clinton'  AND e.ExtractedBodyText != '' ORDER BY RANDOM()")
emailRaw <- paste(emailHillary$EmailBody, collapse=" // ")
# Transform and clean the text
library(tm)
docs <- Corpus(VectorSource(emailRaw))
# Convert the text to lower case
docs <- tm_map(docs, content_transformer(tolower))
# Remove numbers
docs <- tm_map(docs, removeNumbers)
# Remove english common stopwords
docs <- tm_map(docs, removeWords, stopwords("english"))
# Remove punctuations
docs <- tm_map(docs, removePunctuation)
# Eliminate extra white spaces
docs <- tm_map(docs, stripWhitespace)
# Text stemming (reduces words to their root form)
library(SnowballC)
docs <- tm_map(docs, stemDocument)
# Remove additional stopwords
docs <- tm_map(docs, removeWords, c("clintonemailcom", "stategov", "hrod"))

