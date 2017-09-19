
download.file(url = "http://www.sthda.com/upload/rquery_wordcloud.r",
              destfile = "rquery_wordcloud.R")

source("rquery_wordcloud.R")

words <- scan("words.txt", what = "character")

set.seed(1)

pdf("wordcloud.pdf")

rquery.wordcloud(sample(words, 1000, replace = TRUE),
                 min.freq = 0, colorPalette = adegenet::funky(10)[-10])

dev.off()
