
########################
## preliminary things ##
########################


## install packages

install.packages("outbreaks")
install.packages("incidence")
devtools::install_github("reconhub/epicontacts")


## for the GUI

install.packages("shinyjs")
devtools::install_github("reconhub/shinyHelpers")
devtools::install_github("reconhub/RECON.ui")
devtools::install_github("reconhub/incidence.ui")





#######################
## incidence example ##
#######################

library("outbreaks")
library("incidence")


## check input

head(ebola_sim$linelist)
dim(ebola_sim$linelist)


## build incidence objects and plot them

onset <- ebola_sim$linelist$date.of.onset
gender <- ebola_sim$linelist$gender

x <- incidence(onset)
plot(x)

x <- incidence(onset, 7, groups = gender)
plot(x)


## add fitting - first 20 weeks

plot(x[1:20])
f <- fit(x[1:20])

plot(f)
plot(x[1:30], fit = f)


## incidence GUI

library(incidence.ui)
incidence_ui()
