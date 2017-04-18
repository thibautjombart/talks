
########################
## preliminary things ##
########################


## install packages

install.packages("outbreaks")
install.packages("incidence")
devtools::install_github("reconhub/epicontacts")


## for the GUI

deps <- c("Depends", "Imports", "Suggests")
install.packages("shinyjs")
install.packages("DT")
install.packages("plotly")
devtools::install_github("reconhub/shinyHelpers", dependencies = deps)
devtools::install_github("reconhub/RECON.ui", dependencies = deps)
devtools::install_github("reconhub/incidence.ui", dependencies = deps)





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






#######################
## epicontacts example ##
#######################

library("epicontacts")


## check inputs

head(mers_korea_2015$linelist)
dim(mers_korea_2015$linelist)

head(mers_korea_2015$contacts)
dim(mers_korea_2015$contacts)



## make object and plot

x <- make_epicontacts(mers_korea_2015$linelist,
                      mers_korea_2015$contacts,
                      directed = TRUE)

plot(x, "sex")



## extract serial interval distribution

SI <- get_pairwise(x, "dt_onset")
SI

summary(SI)

hist(SI, col = "grey", border = "white",
     main = "Serial interval distribution",
     nclass = 20)
