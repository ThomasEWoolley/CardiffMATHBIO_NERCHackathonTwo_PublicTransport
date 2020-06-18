pass <- 1:76


pass_dist <- 10
pass_shield <- 20




plot(pass,emission_per_pass_bus(pass),'k')
yline(130.4,'--r','linewidth',2)
yline(215.3,'--b','linewidth',2)


#install.packages("latex2exp")
library(latex2exp)
