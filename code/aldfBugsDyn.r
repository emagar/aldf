# Invoca WinBugs desde R

library("arm")
library ("MCMCpack")

rm(list = ls())
#workdir <- c("~/Dropbox/data/rollcall/aldf")
#setwd("C:/Documents and Settings/emm/Mis documentos/My Dropbox/data/rollcall/aldf")
workdir <- c("d:/01/Dropbox/data/rollcall/aldf")
#setwd("c:/Documents and Settings/emagarm/Mis documentos/My Dropbox/data/rollcall/aldf")
setwd(workdir)

################# ESTO EVITA TENER QUE SALVAR COMO scjn.bug ####################################
#
###################################################################
### dynamic model for 66 members in Two Dimensions WITH CUTLINE ESTIMATES
###################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #y.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling, cf. Jackman
      mu[j,i] <- delta[i]*a[i]*(xOne[j]*d1[i] + xTwo[j]*d2[i] + xThree[j]*d3[i] + xFour[j]*d4[i] + xFive[j]*d5[i] + xSix[j]*d6[i] + xSeven[j]*d7[i] + xEight[j]*d8[i])
                + delta[i]*b[i] - delta[i]*(yOne[j]*d1[i] + yTwo[j]*d2[i] + yThree[j]*d3[i] + yFour[j]*d4[i] + yFive[j]*d5[i] + ySix[j]*d6[i] + ySeven[j]*d7[i] + yEight[j]*d8[i])  ## utility differential
                  }
      xOne[j] ~   dnorm (xZero[j],15);  ## en 2do intento slack era 20, 3ro 10
      xTwo[j] ~   dnorm (xOne[j],15);
      xThree[j] ~ dnorm (xTwo[j],15);
      xFour[j] ~  dnorm (xThree[j],15);
      xFive[j] ~  dnorm (xFour[j],15);
      xSix[j] ~   dnorm (xFive[j],15);
      xSeven[j] ~ dnorm (xSix[j],15);
      xEight[j] ~ dnorm (xSeven[j],15);
      yOne[j] ~   dnorm (yZero[j],15);
      yTwo[j] ~   dnorm (yOne[j],15);
      yThree[j] ~ dnorm (yTwo[j],15);
      yFour[j] ~  dnorm (yThree[j],15);
      yFive[j] ~  dnorm (yFour[j],15);
      ySix[j] ~   dnorm (yFive[j],15);
      ySeven[j] ~ dnorm (ySix[j],15);
      yEight[j] ~ dnorm (ySeven[j],15);
                }
  for (i in 1:I){
  a[i] <- sin(angle[i]) / sqrt(1-sin(angle[i])*sin(angle[i]))
  }
  ################
  ## priors
  ################
for (j in 1:(N-1)){
    xZero[j] ~  dnorm(0, 1)
    yZero[j] ~  dnorm(0, 1)
    }
    xZero[N] ~  dnorm(0, 4)    # Mrs. NORTH Pi�a Olmedo Laura (PRD)
    yZero[N] ~  dnorm(2, 4)
#    xZero[N] <- 0
#    yZero[N] <- 2
for (j in (N+1):(W-1)){
    xZero[j] ~  dnorm(0, 1)
    yZero[j] ~  dnorm(0, 1)
    }
    xZero[W] ~  dnorm(-2, 4)   # Mr. WEST M�ndez Rangel Avelino (PRD)
    yZero[W] ~  dnorm(0, 4)
#    xZero[W] <- -2
#    yZero[W] <- 0
for (j in (W+1):(E-1)){
    xZero[j] ~  dnorm(0, 1)
    yZero[j] ~  dnorm(0, 1)
    }
    xZero[E] ~  dnorm(2, 4)    # Mrs. EAST Paula Adriana Soto Maldonado (PAN)
    yZero[E] ~  dnorm(0, 4)
#    xZero[E] <- 2
#    yZero[E] <- 0
for (j in (E+1):(S-1)){
    xZero[j] ~  dnorm(0, 1)
    yZero[j] ~  dnorm(0, 1)
    }
    xZero[S] ~  dnorm(0, 4)    # Mr. SOUTH Tenorio Antiga Xiuh (PANAL)
    yZero[S] ~  dnorm(-2, 4)
#    xZero[S] <- 0
#    yZero[S] <- -2
for (j in (S+1):J){
    xZero[j] ~  dnorm(0, 1)
    yZero[j] ~  dnorm(0, 1)
    }
    for(i in 1:I){
        delta[i] ~ dnorm( 0, 0.01)
        angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
        b[i] ~ dnorm( 0, .01)
                 }
}
", file="model66Dyn2Dj.txt")
#
#
###################################################################
### static model for 66 members in Two Dimensions WITH CUTLINE ESTIMATES
###################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #y.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling
      mu[j,i] <- delta[i]*a[i]*x[j] + delta[i]*b[i] - delta[i]*y[j] ## utility differential
                  }
                }
  for (i in 1:I){
  a[i] <- sin(angle[i]) / sqrt(1-sin(angle[i])*sin(angle[i]))
  }
  ## priors ################
for (j in 1:(N-1)){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
    x[N] ~  dnorm(0, 4)    # Mrs. NORTH Pi�a Olmedo Laura (PRD)
    y[N] ~  dnorm(2, 4)
#    x[N] <- 0
#    y[N] <- 2
for (j in (N+1):(W-1)){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
    x[W] ~  dnorm(-2, 4)   # Mr. WEST M�ndez Rangel Avelino (PRD)
    y[W] ~  dnorm(0, 4)
#    x[W] <- -2
#    y[W] <- 0
for (j in (W+1):(E-1)){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
    x[E] ~  dnorm(2, 4)    # Mrs. EAST Paula Adriana Soto Maldonado (PAN)
    y[E] ~  dnorm(0, 4)
#    x[E] <- 2
#    y[E] <- 0
for (j in (E+1):(S-1)){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
    x[S] ~  dnorm(0, 4)    # Mr. SOUTH Tenorio Antiga Xiuh (PANAL)
    y[S] ~  dnorm(-2, 4)
#    x[S] <- 0
#    y[S] <- -2
for (j in (S+1):J){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
    for(i in 1:I){
        delta[i] ~ dnorm( 0, 0.1)
        angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
        b[i] ~ dnorm( 0, .1)
                 }
}
", file="model66Sta2Dj.txt")
#
###################################################################
### static model for 66 members in Two Dimensions, four ITEM anchors WITH CUTLINE ESTIMATES
###################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #y.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling
      mu[j,i] <- delta[i]*a[i]*x[j] + delta[i]*b[i] - delta[i]*y[j] ## utility differential
                  }
                }
  for (i in 1:I){
  a[i] <- sin(angle[i]) / sqrt(1-sin(angle[i])*sin(angle[i]))
  }
  ## priors ################
for (j in 1:J){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
for(i in 1:(V1-1)){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
delta[V1] ~ dnorm( -4, 4)
angle[V1] ~ dunif(1.37,1.77) # (7pi/16,9pi/16) ---- VERTICAL
b[V1] ~ dnorm( 0, 4)
for(i in (V1+1):(H1-1)){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
delta[H1] ~ dnorm( -4, 4)
angle[H1] ~ dunif(-0.2,0.2) # (-pi/16,pi/16) ------ HORIZONTAL
b[H1] ~ dnorm( 0, 4)
for(i in (H1+1):(V2-1)){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
delta[V2] ~ dnorm( 4, 4)
angle[V2] ~ dunif(1.37,1.77) # (7pi/16,9pi/16) ---- VERTICAL
b[V2] ~ dnorm( 0, 4)
for(i in (V2+1):(H2-1)){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
delta[H2] ~ dnorm( -4, 4)
angle[H2] ~ dunif(-0.2,0.2) # (-pi/16,pi/16) ------ HORIZONTAL
b[H2] ~ dnorm( 0, 4)
for(i in (H2+1):I){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
}
", file="model66Sta2Di4.txt")
#
###################################################################
### static model for 66 members in Two Dimensions, two ITEM anchors WITH CUTLINE ESTIMATES
###################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #y.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling
      mu[j,i] <- delta[i]*a[i]*x[j] + delta[i]*b[i] - delta[i]*y[j] ## utility differential
                  }
                }
  for (i in 1:I){
  a[i] <- sin(angle[i]) / sqrt(1-sin(angle[i])*sin(angle[i]))
  }
  ## priors ################
for (j in 1:J){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
for(i in 1:(V1-1)){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
delta[V1] ~ dnorm( -4, 4)
angle[V1] ~ dunif(1.37,1.77) # (7pi/16,9pi/16) ---- VERTICAL
b[V1] ~ dnorm( 0, 4)
for(i in (V1+1):(H1-1)){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
delta[H1] ~ dnorm( -4, 4)
angle[H1] ~ dunif(-0.2,0.2) # (-pi/16,pi/16) ------ HORIZONTAL
b[H1] ~ dnorm( 0, 4)
for(i in (H1+1):I){
    delta[i] ~ dnorm( 0, 0.25)
#    angle[i] ~ dunif(-1.57,1.57) # (-pi/2,pi/2)
    angle[i] ~ dunif(.392,1.178) # (pi/8,3pi/8)
    b[i] ~ dnorm( 0, .25)
    }
}
", file="model66Sta2Di2.txt")
#
###################################################################
### dynamic model for 66 members in Two Dimensions -- IRT PARAMETERIZATION
###################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #v.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling
      mu[j,i] <- beta[i]*(xOne[j]*d1[i] + xTwo[j]*d2[i] + xThree[j]*d3[i] + xFour[j]*d4[i] + xFive[j]*d5[i] + xSix[j]*d6[i] + xSeven[j]*d7[i] + xEight[j]*d8[i])
                - alpha[i] + delta[i]*(yOne[j]*d1[i] + yTwo[j]*d2[i] + yThree[j]*d3[i] + yFour[j]*d4[i] + yFive[j]*d5[i] + ySix[j]*d6[i] + ySeven[j]*d7[i] + yEight[j]*d8[i])  ## utility differential
                  }
      xOne[j] ~   dnorm (xZero[j],15);  ## en 2do intento slack era 20, 3ro 10
      xTwo[j] ~   dnorm (xOne[j],15);
      xThree[j] ~ dnorm (xTwo[j],15);
      xFour[j] ~  dnorm (xThree[j],15);
      xFive[j] ~  dnorm (xFour[j],15);
      xSix[j] ~   dnorm (xFive[j],15);
      xSeven[j] ~ dnorm (xSix[j],15);
      xEight[j] ~ dnorm (xSeven[j],15);
      yOne[j] ~   dnorm (yZero[j],15);
      yTwo[j] ~   dnorm (yOne[j],15);
      yThree[j] ~ dnorm (yTwo[j],15);
      yFour[j] ~  dnorm (yThree[j],15);
      yFive[j] ~  dnorm (yFour[j],15);
      ySix[j] ~   dnorm (yFive[j],15);
      ySeven[j] ~ dnorm (ySix[j],15);
      yEight[j] ~ dnorm (ySeven[j],15);
                }
## ESTO LO PUEDO SACAR POST ESTIMACION
##  for (i in 1:I){
##  a[i] <- beta[i] / delta[i]  ## pendiente de cutline
##  b[i] <- alpha[i] / delta[i] ## constante de cutline
##  }
  ################
  ## priors
  ################
## 1a dim ############
for (j in 1:(N-1)){
    xZero[j] ~  dnorm(0, 1)
    }
    xZero[N] ~  dnorm(0, 4)    # Mrs. NORTH Pi�a Olmedo Laura (PRD)
#    xZero[N] <- 0
for (j in (N+1):(W-1)){
    xZero[j] ~  dnorm(0, 1)
    }
    xZero[W] ~  dnorm(-2, 4)    # Mr. WEST M�ndez Rangel Avelino (PRD)
#    xZero[W] <- -2
for (j in (W+1):(E-1)){
    xZero[j] ~  dnorm(0, 1)
    }
    xZero[E] ~  dnorm(2, 4)    # Mrs. EAST Paula Adriana Soto Maldonado (PAN)
#    xZero[E] <- 2
for (j in (E+1):(S-1)){
    xZero[j] ~  dnorm(0, 1)
    }
    xZero[S] ~  dnorm(0, 4)    # Mr. SOUTH Tenorio Antiga Xiuh (PANAL)
#    xZero[S] <- 0
for (j in (S+1):J){
    xZero[j] ~  dnorm(0, 1)
    }
## 2a dim  ############
for (j in 1:(N-1)){
    yZero[j] ~  dnorm(0, 1)
    }
    yZero[N] ~  dnorm(2, 4)    # Mrs. NORTH
#    yZero[N] <- 2
for (j in (N+1):(W-1)){
    yZero[j] ~  dnorm(0, 1)
    }
    yZero[W] ~  dnorm(0, 4)    # Mr. WEST
#    yZero[W] <- 0
for (j in (W+1):(E-1)){
    yZero[j] ~  dnorm(0, 1)
    }
    yZero[E] ~  dnorm(0, 4)    # Mrs. EAST
#    yZero[E] <- 0
for (j in (E+1):(S-1)){
    yZero[j] ~  dnorm(0, 1)
    }
    yZero[S] ~  dnorm(-2, 4)    # Mr. SOUTH
#    yZero[S] <- -2
for (j in (S+1):J){
    yZero[j] ~  dnorm(0, 1)
    }
    for(i in 1:I){
        alpha[i] ~ dnorm( 0, 1)
        beta[i]  ~ dnorm( 0, 1)
        delta[i] ~ dnorm( 0, 1)
                 }
}
", file="model66Dyn2Dj.irt.txt")
#
#
###################################################################
### static model for 66 members in Two Dimensions -- IRT PARAMETERIZATION
###################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #v.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling
      mu[j,i] <- beta[i]*x[j] - alpha[i] + delta[i]*y[j] ## utility differential
                  }
                }
## ESTO LO PUEDO SACAR POST ESTIMACION
##  for (i in 1:I){
##  a[i] <- beta[i] / delta[i]  ## pendiente de cutline
##  b[i] <- alpha[i] / delta[i] ## constante de cutline
##  }
  ## priors ################
## 1a dim ############
for (j in 1:(N-1)){
    x[j] ~  dnorm(0, .1)
    }
    x[N] ~  dnorm(0, 4)    # Mrs. NORTH Pi�a Olmedo Laura (PRD)
#    x[N] <- 0
for (j in (N+1):(W-1)){
    x[j] ~  dnorm(0, .1)
    }
    x[W] ~  dnorm(-2, 4)    # Mr. WEST M�ndez Rangel Avelino (PRD)
#    x[W] <- -2
for (j in (W+1):(E-1)){
    x[j] ~  dnorm(0, .1)
    }
    x[E] ~  dnorm(2, 4)    # Mrs. EAST Paula Adriana Soto Maldonado (PAN)
#    x[E] <- 2
for (j in (E+1):(S-1)){
    x[j] ~  dnorm(0, .1)
    }
    x[S] ~  dnorm(0, 4)    # Mr. SOUTH Tenorio Antiga Xiuh (PANAL)
#    x[S] <- 0
for (j in (S+1):J){
    x[j] ~  dnorm(0, .1)
    }
## 2a dim  ############
for (j in 1:(N-1)){
    y[j] ~  dnorm(0, .1)
    }
    y[N] ~  dnorm(2, 4)    # Mrs. NORTH
#    y[N] <- 2
for (j in (N+1):(W-1)){
    y[j] ~  dnorm(0, .1)
    }
    y[W] ~  dnorm(0, 4)    # Mr. WEST
#    y[W] <- 0
for (j in (W+1):(E-1)){
    y[j] ~  dnorm(0, .1)
    }
    y[E] ~  dnorm(0, 4)    # Mrs. EAST
#    y[E] <- 0
for (j in (E+1):(S-1)){
    y[j] ~  dnorm(0, .1)
    }
    y[S] ~  dnorm(-2, 4)    # Mr. SOUTH
#    y[S] <- -2
for (j in (S+1):J){
    y[j] ~  dnorm(0, .1)
    }
    for(i in 1:I){
        alpha[i] ~ dnorm( 0, 1)
        beta[i]  ~ dnorm( 0, 1)
        delta[i] ~ dnorm( 0, 1)
                 }
}
", file="model66Sta2Dj.irt.txt")
#
###################################################################
### static model for 66 members in Two Dimensions, four ITEM anchors -- IRT PARAMETERIZATION
###################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #v.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling
      mu[j,i] <- beta[i]*x[j] - alpha[i] + delta[i]*y[j] ## utility differential
                  }
                }
## ESTO LO PUEDO SACAR POST ESTIMACION
##  for (i in 1:I){
##  a[i] <- beta[i] / delta[i]  ## pendiente de cutline
##  b[i] <- alpha[i] / delta[i] ## constante de cutline
##  }
  ## priors ################
for (j in 1:J){
    x[j] ~  dnorm(0, 1)
    y[j] ~  dnorm(0, 1)
    }
for(i in 1:(V1-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[V1] ~ dnorm( 0, 1)
beta[V1]  ~ dnorm(-4, 20)
delta[V1] ~ dnorm(-4, 20)
for(i in (V1+1):(H1-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[H1] ~ dnorm( 0, 1)
beta[H1]  ~ dnorm( 4, 20)
delta[H1] ~ dnorm(-4, 20)
for(i in (H1+1):(V2-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[V2] ~ dnorm( 0, 1)
beta[V2]  ~ dnorm( 4, 20)
delta[V2] ~ dnorm( 4, 20)
for(i in (V2+1):(H2-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[H2] ~ dnorm( 0, 1)
beta[H2]  ~ dnorm( 4, 20)
delta[H2] ~ dnorm(-4, 20)
for(i in (H2+1):I){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
}
", file="model66Sta2Di4.irt.txt")
#
#######################################################################################
### dynamic model for 66 members in Two Dimensions Four Item anchors-- IRT PARAMETERIZATION
#######################################################################################
cat("
model {
  for (j in 1:J){                ## loop over diputados
    for (i in 1:I){              ## loop over items
      #v.hat[j,i] ~ dbern(p[j,i]);                                  ## voting rule
      #p[j,i] <- phi(v.star[j,i]);                                  ## sets 0<p<1
      v.star[j,i] ~ dnorm(mu[j,i],1)I(lo.v[j,i],hi.v[j,i]);   ## truncated normal sampling
      mu[j,i] <- beta[i]*(xOne[j]*d1[i] + xTwo[j]*d2[i] + xThree[j]*d3[i]
                 + xFour[j]*d4[i] + xFive[j]*d5[i] + xSix[j]*d6[i] + xSeven[j]*d7[i]
                 + xEight[j]*d8[i])
                 - alpha[i] + delta[i]*(yOne[j]*d1[i] + yTwo[j]*d2[i] + yThree[j]*d3[i]
                 + yFour[j]*d4[i] + yFive[j]*d5[i] + ySix[j]*d6[i] + ySeven[j]*d7[i]
                 + yEight[j]*d8[i])  ## utility differential
                  }
      xOne[j] ~   dnorm (xZero[j],15);  ## en 2do intento slack era 20, 3ro 10
      xTwo[j] ~   dnorm (xOne[j],15);
      xThree[j] ~ dnorm (xTwo[j],15);
      xFour[j] ~  dnorm (xThree[j],15);
      xFive[j] ~  dnorm (xFour[j],15);
      xSix[j] ~   dnorm (xFive[j],15);
      xSeven[j] ~ dnorm (xSix[j],15);
      xEight[j] ~ dnorm (xSeven[j],15);
      yOne[j] ~   dnorm (yZero[j],15);
      yTwo[j] ~   dnorm (yOne[j],15);
      yThree[j] ~ dnorm (yTwo[j],15);
      yFour[j] ~  dnorm (yThree[j],15);
      yFive[j] ~  dnorm (yFour[j],15);
      ySix[j] ~   dnorm (yFive[j],15);
      ySeven[j] ~ dnorm (ySix[j],15);
      yEight[j] ~ dnorm (ySeven[j],15);
                }
## ESTO LO PUEDO SACAR POST ESTIMACION
##  for (i in 1:I){
##  a[i] <- beta[i] / delta[i]  ## pendiente de cutline
##  b[i] <- alpha[i] / delta[i] ## constante de cutline
##  }
  ################
  ## priors
  ################
## 1a dim ############
for (j in 1:(N-1)){
    xZero[j] ~  dnorm(0, 1)
    yZero[j] ~  dnorm(0, 1)
    }
    xZero[N] ~  dnorm(-2, 4)    # Mrs. NORTH Pi�a Olmedo Laura (PRD)
    yZero[N] ~  dnorm(2, 4)
#    xZero[N] <- 0
#    yZero[N] <- 2
for (j in (N+1):J){
    xZero[j] ~  dnorm(0, 1)
    yZero[j] ~  dnorm(0, 1)
    }
for(i in 1:(V1-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[V1] ~ dnorm( 0, 1)
beta[V1]  ~ dnorm(-4, 20)
delta[V1] ~ dnorm(-4, 20)
for(i in (V1+1):(H1-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[H1] ~ dnorm( 0, 1)
beta[H1]  ~ dnorm( 4, 20)
delta[H1] ~ dnorm(-4, 20)
for(i in (H1+1):(V2-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[V2] ~ dnorm( 0, 1)
beta[V2]  ~ dnorm( 4, 20)
delta[V2] ~ dnorm( 4, 20)
for(i in (V2+1):(H2-1)){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
alpha[H2] ~ dnorm( 0, 1)
beta[H2]  ~ dnorm( 4, 20)
delta[H2] ~ dnorm(-4, 20)
for(i in (H2+1):I){
    alpha[i] ~ dnorm( 0, 1)
    beta[i]  ~ dnorm( 0, 1)
    delta[i] ~ dnorm( 0, 1)
    }
}
", file="model66Dyn2Di4.irt.txt")
#
#########################################################################################

load(file="allRCs.RData")
#
names.67 <- c("Ram�n Jim�nez L�pez", "Antonio Lima",
"Enrique Vargas Anaya", "Isa�as Villa", "Balfre Vargas Cort�s",
"Juan Bustos", "Norberto S�nchez Nazario", "Edgar Torres Baltazar",
"Crist�bal Ram�rez", "Tom�s Pliego", "Esthela Dami�n",
"Laura Pi�a", "Agust�n Guerrero", "Margarita Mart�nez",
"Daniel Ord��ez", "Benito Antonio Le�n", "Jos� Zepeda",
"Ricardo Garc�a Hern�ndez", "Elba Garfias", "Alfredo Vinalay",
"Alejandro Ram�rez Rodr�guez", "V�ctor Hugo C�rigo", "Daniel Salazar",
"Sergio Cedillo", "Humberto Morgan", "Arturo Santana",
"Ezequiel R�tiz", "Juan Carlos Beltr�n", "Samuel Hdz Abarca",
"Mauricio Toledo", "Miguel Sosa", "Jos� Luis Mor�a",
"Leticia Quezada", "Sergio Avila Rojas", "Edy Ortiz Pi�a",
"Nancy C�rdenas", "Hip�lito Bravo", "Salvador Mtz della Rocca",
"Avelino M�ndez Rangel", "Hern�ndez Mir�n",
"L�pez Rabad�n Kenia", "Carmen Segura", "Jorge Triana",
"Miguel Hern�ndez Labastida", "Miguel Angel Errasti", "Celina Saavedra",
"Agust�n Castilla", "Elvira Murillo", "Mar�a Qui��nez", "Jorge Romero",
"Daniel Ram�rez del Valle", "Paula Soto", "Jacobo Bonilla",
"Federico Schiaffino", "Carmen Peralta", "Carlos Olavarrieta",
"Leonardo �lvarez Romo", "Marco Garc�a Ayala",
"Francisco Alvarado", "Tonatiuh Gonz�lez", "Isabel Ca�izo",
"Fernando Espino", "Xiuh Tenorio", "Rebeca Parada", "Jorge D�az Cuervo",
"Carla S�nchez Armas", "Enrique P�rez Correa")
#
### INCLUYEN AL PEJISTA GUERRERO
##coords <- c("", "", "", "", "", "", "", "",
##"", "", "", "", "Guerrero", "", "", "", "", "", "", "", "",
##"C�rigo", "", "", "", "", "", "", "", "", "", "", "", "", "",
##"", "", "", "", "", "", "", "Triana", "", "", "", "", "", "",
##"", "", "", "", "Schiaffino", "", "", "Alvarez Romo", "", "", "", "", "",
##"Tenorio", "", "", "", "")
###
##dCoord <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
##1, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA, NA, NA, NA, NA,
##NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA,
##NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA, 1, NA, NA, NA,
##NA, NA, 1, NA, NA, NA, NA)
#
coords <- c("", "", "", "", "", "", "", "",
"", "", "", "", "", "", "", "", "", "", "", "", "",
"C�rigo", "", "", "", "", "", "", "", "", "", "", "", "", "",
"", "", "", "", "", "", "", "Triana", "", "", "", "", "", "",
"", "", "", "", "Schiaffino", "", "", "Alvarez Romo", "", "", "", "", "",
"Tenorio", "", "", "", "")
#
dCoord <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA, NA, NA, NA, NA,
NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA,
NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA, 1, NA, NA, NA,
NA, NA, 1, NA, NA, NA, NA)
#
part.67 <- c("prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "prd", "prd", "prd", "prd", "prd", "pan", "prd", "prd",
"pan", "pt", "prd", "pan", "conve", "prd", "prd", "prd", "prd",
"prd", "pan", "prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "prd", "prd", "prd", "prd", "prd", "pan", "pan", "pan",
"pan", "pan", "pan", "pan", "pan", "pan", "pan", "pan", "pan",
"pan", "pri", "pvem", "pri", "pvem", "pri", "pvem", "pri",
"panal", "panal", "panal", "panal", "psd", "psd", "psd")
#
color.67 <- c("gold", "gold", "gold", "gold", "gold", "gold",
"gold", "gold", "gold", "gold", "gold", "gold", "gold",
"darkblue", "gold", "gold", "darkblue", "red", "gold",
"darkblue", "orange", "gold", "gold", "gold", "gold", "gold",
"darkblue", "gold", "gold", "gold", "gold", "gold", "gold",
"gold", "gold", "gold", "gold", "gold", "gold", "gold",
"darkblue", "darkblue", "darkblue", "darkblue", "darkblue",
"darkblue", "darkblue", "darkblue", "darkblue", "darkblue",
"darkblue", "darkblue", "darkblue", "forestgreen",
"darkolivegreen2", "forestgreen", "darkolivegreen2",
"forestgreen", "darkolivegreen2", "forestgreen", "cyan",
"cyan", "cyan", "cyan", "darkorchid", "darkorchid",
"darkorchid")
#
part.list <- c("PAN", "PRI", "PRD", "PT", "PVEM", "Conv.", "PANAL", "PASD")
color.list <- c("darkblue", "forestgreen", "gold", "red", "darkolivegreen2", "orange", "cyan", "darkorchid")
#
data.frame(x=names.67,y=part.67,z=color.67)
#
for (n in 1:ncol(RCs)){
    RCs[,n]<-as.numeric(paste(RCs[,n]))
}
#
## Sorts by date
tmp<-RCs[order(RCs$yr, RCs$mo, RCs$dy, RCs$folio),]
RCs<-tmp


## SAVE VOTES FOR WEB (re-do if data changes)
tmp <- rep(NA, times = 132)
dipdat <- data.frame(id=tmp, nom=tmp, part=tmp, drop=tmp)
dipdat$id <- c( sort (paste( c( paste("mr0",1:9, sep=""), paste("mr", 10:40, sep="")), c("p","s"), sep="" ) ), sort (paste( c( paste("rp0",1:9, sep=""), paste("rp", 10:26, sep="")), c("p","s"), sep="" ) ) )
dipdat$part <- c("prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","pan","pan","prd","prd","prd","prd","pan","pan","pt","pt","prd","prd","pan","pan","conve","conve","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","pan","pan","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","prd","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pan","pri","pri","pvem","pvem","pri","pri","pvem","pvem","pri","pri","pvem","pvem","pri","pri","panal","panal","panal","panal","panal","panal","panal","panal","psd","psd","psd","psd")
dipdat$nom <- c("Ram�n Jim�nez L�pez", "RUBIO ALDARAN ELEAZAR", "Antonio Lima", "ZU�IGA ORTIZ ROCIO AIME", "Enrique Vargas Anaya", "ROMERO LOPEZ OSCAR", "Isa�as Villa", "ROMERO MALDONADO AARON", "Balfre Vargas Cort�s", "CERON MARTINEZ MAXIMO JUSTINO", "Juan Bustos", "AVILA LUNA JOAQUIN PATRICIO", "Norberto S�nchez Nazario", "MARTINEZ SOLANO JAVIER", "MENDOZA ROMERO IMELDA", "Edgar Torres Baltazar", "Crist�bal Ram�rez", "UGARTE MOLINA JOSE RODRIGO", "Tom�s Pliego", "ZAMORA FLORES ARTURO", "Esthela Dami�n", "SANCHEZ CABRERA MARICELA", "Laura Pi�a", "HERNANDEZ CASTILLA MARIA LYDIA", "Agust�n Guerrero", "GONZALEZ DEL ANGEL RICARDO", "Margarita Mart�nez", "Aus Den Ruten Arne", "Daniel Ord��ez", "OROZCO CARMONA JUAN MANUEL", "Benito Antonio Le�n", "RESENDIZ MARTINEZ ARTURO", "Jos� Zepeda", "Rebollo Aguilar Carolina", "Ricardo Garc�a Hern�ndez", "CORONADO ORTIZ CARLOS", "Elba Garfias", "NOLASCO OCHOA HILARIO", "Alfredo Vinalay", "Arronte Holgu�n Mar�a de los Angeles", "Alejandro Ram�rez Rodr�guez", "ORTEGA GONZALEZ ANDREA", "V�ctor Hugo C�rigo", "ZAMORA GRANADOS MARIBEL", "Daniel Salazar", "TRUJILLO VAZQUEZ ABRIL JANNETTE", "Sergio Cedillo", "JIMENEZ BURGOS JAIME", "Humberto Morgan", "ROCHA CRUZ LUIS EDUARDO", "Arturo Santana", "RAZO VAZQUEZ MARIA NATIVIDAD PATRICIA", "Ezequiel R�tiz", "Mart�nez Capaceta Emma Cecilia", "Juan Carlos Beltr�n", "MENDEZ GALVAN MARIA DE LOURDES", "Samuel Hdz Abarca", "REYES AGUIRRE MARGARITO", "Mauricio Toledo", "HERNANDEZ HERNANDEZ MIGUEL ANGEL", "Miguel Sosa", "TRILLO DOMINGUEZ JUAN CARLOS", "Jos� Luis Mor�a", "HERNANDEZ LEAL JOSE ALFREDO", "Leticia Quezada", "ARAIZA MOTA ILIANA", "Sergio Avila Rojas", "GOMEZ VALENZUELA MIRIAM ROSARIO", "Edy Ortiz Pi�a", "MENDEZ ALVAREZ ANGELINA", "Nancy C�rdenas", "HERNANDEZ VALENTIN JUAN CARLOS", "Hip�lito Bravo", "MEGCHUN GONZALEZ JOSE LUIS", "Salvador Mart�nez della Rocca", "MU�OZ SANTINI INTI", "Avelino M�ndez Rangel", "ROSALES ROMERO MARTIN", "Hern�ndez Mir�n", "ESQUIVEL CARRILLO JESUS", "L�pez Rabad�n Kenia", "Anaya Gonz�lez Orlando", "Carmen Segura Rangel", "Herrera Espinoza Ra�l", "Jorge Triana", "Villaluz Alba Yesenia", "Miguel Hern�ndez Labastida", "Alvarez Escudero Jos� Hiram", "Miguel Angel Errasti", "Mendoza Bautista Cecilia", "Celina Saavedra Ortega", "Santib��ez Calzadilla Francisco", "Agust�n Castilla Marroqu�n", "Riviera Hern�ndez Mara del Socorro", "Armas Pluma Aldo Daniel", "Elvira Murillo Mendoza", "Mar�a Qui��nez", "Torres Quiroz Guillermo de Jes�s", "Jorge Romero", "Verderi Mu�uzuri Fernanda", "Daniel Ram�rez del Valle", "Ruiz Aguilar Brenda Faviola", "Paula Soto", "Cuevas Moranchel Fernando", "Jacobo Bonilla", "N��ez L�pez Lorena", "Federico Schiaffino", "T�llez S�nchez Alicia Virginia", "Carmen Peralta", "Arzate Flores Jos� Antonio", "Carlos Olavarrieta", "Jim�nez Barrios Sergio", "Leonardo �lvarez Romo", "Pe�a Garavito Jos� Fernando", "Marco Garc�a Ayala", "Gasc�n L�pez Cano Sylvia Elena", "Alvarado Villaz�n Ana Luisa", "Francisco Alvarado Villaz�n", "Tonatiuh Gonz�lez", "Valdez Medina Diego", "Gloria Isabel Ca�izo Cuevas", "Kuri Lorenzo Mar�a", "Fernando Espino", "Garc�a Villarreal Mar�a Enriqueta", "Xiuh Tenorio", "Hern�ndez Salgado Oscar", "Rebeca Parada", "Macareno Mej�a Leonardo", "Jorge D�az Cuervo", "Carla S�nchez Armas", "Enrique P�rez Correa", "G�mez G�mez Carlos Mauricio")
dipdat$drop <- c(0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 1,0, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 1,0, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 0,1, 1,0, 0,1, 0,1, 0,1, 0,1, 0,1, 0,0, 0,1)
votdat <- RCsU[,1:8]
rc <- RCsU[,9:140]
#
setwd( paste(workdir, "votForWeb", sep="/") )
require("gdata")
keep(dipdat, votdat, rc, sure = TRUE)
## ADD A ROLL CALL COUNTER
votdat$vnum <- 1:nrow(votdat)
save(dipdat, votdat, rc, file = "rc4.RData" )
## export csv versions
write.csv(dipdat, file = "dipdat.csv", row.names=FALSE)
write.csv(votdat, file = "votdat.csv", row.names=FALSE)
write.csv(rc, file = "rc.csv", row.names=FALSE)

trim <- RCs$mo
trim[trim==1 | trim==2 | trim==3]<- 1
trim[trim==4 | trim==5 | trim==6]<- 2
trim[trim==7 | trim==8 | trim==9]<- 3
trim[trim==10 | trim==11 | trim==12]<- 4
#
cuad <- RCs$mo
cuad[cuad==1 | cuad==2 | cuad==3 | cuad==4]<- 1
cuad[cuad==5 | cuad==6 | cuad==7 | cuad==8]<- 2
cuad[cuad==9 | cuad==10 | cuad==11 | cuad==12]<- 3
#
titCuad <- cuad
titCuad[cuad==1]<-"2006-3"
titCuad[cuad==2]<-"2007-1"
titCuad[cuad==3]<-"2007-2"
titCuad[cuad==4]<-"2007-3"
titCuad[cuad==5]<-"2008-1"
titCuad[cuad==6]<-"2008-2"
titCuad[cuad==7]<-"2008-3"
titCuad[cuad==8]<-"2009-1"
#
sem <- RCs$mo
sem[sem>0 & sem<7]<- 1
sem[sem>6 & sem<13]<- 2
#
# unstar appropriate
#tmp<-(RCs$yr-2006)*4 ## to work with trimestres
tmp<-(RCs$yr-2006)*3 ## to work with cuadrimestres
#tmp<-(RCs$yr-2006)*2 ## to work with semestres
#trim<-trim+tmp
#trim<-trim-min(trim)+1
cuad<-cuad+tmp
cuad<-cuad-min(cuad)+1
#sem<-sem+tmp
#sem<-sem-min(sem)+1
#
## IGNORES 9TH CUADRIMESTRE WITH SINGLE CONTESTED VOTE (CAN BE KEPT FOR STATIC ESTIM)
drop <- ifelse(cuad==9,1,0)
tmp<-RCs[drop==0,]
RCs<-tmp
sem<-sem[drop==0]; cuad<-cuad[drop==0]; trim<-trim[drop==0]
#
#T<-max(trim)
T<-max(cuad)
#T<-max(sem)
#
##COLUMNS (DIPUS) THAT HAVE ONLY ZEROES NEED TO BE DROPPED
dropCol<-c( rep(0,times=8), rep(NA, times=(ncol(RCs)-8)) )
for (i in 9:ncol(RCs)){
    dropCol[i]<- ifelse ( sum(RCs[,i])==0, 1, 0 )
    }
tmp<-RCs[,dropCol==0]
RCs<-tmp
tmp<-dropCol[9:length(dropCol)]
idAll<-id
id<-id[tmp==0]
namesL<-longNames[tmp==0]
namesS<-shortNames[tmp==0]
party<-part[tmp==0]
color<-rep(NA, times=length(party))
for (i in 1:length(party)){
    color[i] <- ifelse (party[i]=="panal", "cyan", ifelse(party[i]=="pan", "darkblue", ifelse(party[i]=="prd", "gold", ifelse((party[i]=="pri" | party[i]=="pri-uc"), "green4", ifelse(party[i]=="psd", "darkorchid", ifelse(party[i]=="pt", "red", NA))))))
    }
N<-grep("mr12p", id); W<-grep("mr39p", id); E<-grep("rp12p", id); S<-grep("rp23p", id)
tmp<-ifelse( (RCs$folio==2  & RCs$yr==2006 & RCs$mo==11 & RCs$dy==9 ),1,0 ); V1<-grep(1,tmp) # Vertical 8
tmp<-ifelse( (RCs$folio==6  & RCs$yr==2006 & RCs$mo==12 & RCs$dy==28),1,0 ); V2<-grep(1,tmp) # Vertical 66
tmp<-ifelse( (RCs$folio==10 & RCs$yr==2006 & RCs$mo==12 & RCs$dy==26),1,0 ); H1<-grep(1,tmp) # Horizontal 57
#tmp<-ifelse( (RCs$folio==3  & RCs$yr==2008 & RCs$mo==4  & RCs$dy==29),1,0 ); H2<-grep(1,tmp) # Horizontal 460
tmp<-ifelse( (RCs$folio==2  & RCs$yr==2008 & RCs$mo==5  & RCs$dy==29),1,0 ); H2<-grep(1,tmp) # Horizontal 481
#
## Recodifica los votos para Bugs
#tmp<-RCs
#tmp[,9:ncol(tmp)]<- ifelse(tmp[,9:ncol(tmp)]==3,0,ifelse(tmp[,9:ncol(tmp)]==9,0,ifelse(tmp[,9:ncol(tmp)]==2,-1,ifelse(tmp[,9:ncol(tmp)]==1,1,99))))
#
tmp <- RCs[,9:ncol(RCs)]; tmp <- t(tmp); table(tmp) ## No s� por qu� quedan algunos #2=contra y #3=abstenci�n
vot <- RCs[,9:ncol(RCs)]
vot <- ifelse(vot==3,0,ifelse(vot==9,0,ifelse(vot==2,-1,ifelse(vot==1,1,ifelse(vot==-1,-1,ifelse(vot==0,0,99))))))
table(vot)
RCs[,9:ncol(RCs)] <- vot
rm(vot,tmp)

###############################################################
### all periods 66 members 2Dimensions DYNAMIC item anchors ###
###############################################################

votes <- RCs[,9:ncol(RCs)]
#votes[votes==-1] <- 0  # los -1s se vuelven 0s # DEJA ABSTENCION COMO VOTO NAY
votes <- t(votes)
J <- nrow(votes); I <- ncol(votes)
d1 <- ifelse(cuad==1,1,0) ##
d2 <- ifelse(cuad==2,1,0) ##
d3 <- ifelse(cuad==3,1,0) ##
d4 <- ifelse(cuad==4,1,0) ##
d5 <- ifelse(cuad==5,1,0) ##
d6 <- ifelse(cuad==6,1,0) ##
d7 <- ifelse(cuad==7,1,0) ##
d8 <- ifelse(cuad==8,1,0) ##
v <- votes
lo.v <- ifelse(is.na(v)==TRUE | v== 1, 0, -5)
hi.v <- ifelse(is.na(v)==TRUE | v==-1,  0, 5)
vstar <- matrix (NA, nrow=J, ncol=I)
for (j in 1:J){
for (i in 1:I){
  vstar[j,i] <- ifelse(v[j,i]==0, 0, ifelse(v[j,i]==1, runif(1), -1*runif(1)))}}
aldf.data <- list ("d1", "d2", "d3", "d4", "d5", "d6", "d7", "d8", "J", "I", "lo.v", "hi.v", "V1", "H1", "V2", "H2", "N")
##zero1<-rnorm(J); zero1[9]<-rnorm(1,-2); zero1[52]<-rnorm(1,2)  ## toma en cuenta priors j
##zero2<-rnorm(J); zero2[35]<-rnorm(1,2); zero2[64]<-rnorm(1,-2)
aldf.inits <- function (){
    list (
    v.star=vstar,
    alpha=rnorm(I),
    beta=rnorm(I),
    delta=rnorm(I),
#    xZero=zero1,
#    yZero=zero2,
    xOne=rnorm(J),
    yOne=rnorm(J),
    xTwo=rnorm(J),
    yTwo=rnorm(J),
    xThree=rnorm(J),
    yThree=rnorm(J),
    xFour=rnorm(J),
    yFour=rnorm(J),
    xFive=rnorm(J),
    yFive=rnorm(J),
    xSix=rnorm(J),
    ySix=rnorm(J),
    xSeven=rnorm(J),
    ySeven=rnorm(J),
    xEight=rnorm(J),
    yEight=rnorm(J)
    )
    }
aldf.parameters <- c("delta", "xOne", "xTwo", "xThree", "xFour", "xFive", "xSix", "xSeven", "xEight",
                              "yOne", "yTwo", "yThree", "yFour", "yFive", "ySix", "ySeven", "yEight",
                              "alpha", "beta", "delta")

#test ride to see program works
aldf.66 <- bugs (aldf.data, aldf.inits, aldf.parameters,
                "model66Dyn2Di4.irt.txt", n.chains=3,
                n.iter=20, n.thin=2, debug=T,
                bugs.directory = "c:/Archivos de programa/WinBUGS14/",
#                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
                program = c("WinBUGS"))

plot(aldf.66)
print(aldf.66)

#longer run
aldf.66 <- bugs (aldf.data, aldf.inits, aldf.parameters,
                "model66Dyn2Di4.irt.txt", n.chains=3,
                n.iter=10000, n.thin=20, debug=T,
                bugs.directory = "c:/Archivos de programa/WinBUGS14/",
#                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
                program = c("WinBUGS"))

#to continue running
tmp1<-list (
    v.star=vstar,
    alpha=aldf.66$last.values[[1]]$alpha,
    beta=aldf.66$last.values[[1]]$beta,
    delta=aldf.66$last.values[[1]]$delta,
#    xZero=aldf.66$last.values[[1]]$xZero,
#    yZero=aldf.66$last.values[[1]]$yZero,
    xOne=aldf.66$last.values[[1]]$xOne,
    yOne=aldf.66$last.values[[1]]$yOne,
    xTwo=aldf.66$last.values[[1]]$xTwo,
    yTwo=aldf.66$last.values[[1]]$yTwo,
    xThree=aldf.66$last.values[[1]]$xThree,
    yThree=aldf.66$last.values[[1]]$yThree,
    xFour=aldf.66$last.values[[1]]$xFour,
    yFour=aldf.66$last.values[[1]]$yFour,
    xFive=aldf.66$last.values[[1]]$xFive,
    yFive=aldf.66$last.values[[1]]$yFive,
    xSix=aldf.66$last.values[[1]]$xSix,
    ySix=aldf.66$last.values[[1]]$ySix,
    xSeven=aldf.66$last.values[[1]]$xSeven,
    ySeven=aldf.66$last.values[[1]]$ySeven,
    xEight=aldf.66$last.values[[1]]$xEight,
    yEight=aldf.66$last.values[[1]]$yEight
    )
tmp2<-list (
    v.star=vstar,
    alpha=aldf.66$last.values[[2]]$alpha,
    beta=aldf.66$last.values[[2]]$beta,
    delta=aldf.66$last.values[[2]]$delta,
#    xZero=aldf.66$last.values[[2]]$xZero,
#    yZero=aldf.66$last.values[[2]]$yZero,
    xOne=aldf.66$last.values[[2]]$xOne,
    yOne=aldf.66$last.values[[2]]$yOne,
    xTwo=aldf.66$last.values[[2]]$xTwo,
    yTwo=aldf.66$last.values[[2]]$yTwo,
    xThree=aldf.66$last.values[[2]]$xThree,
    yThree=aldf.66$last.values[[2]]$yThree,
    xFour=aldf.66$last.values[[2]]$xFour,
    yFour=aldf.66$last.values[[2]]$yFour,
    xFive=aldf.66$last.values[[2]]$xFive,
    yFive=aldf.66$last.values[[2]]$yFive,
    xSix=aldf.66$last.values[[2]]$xSix,
    ySix=aldf.66$last.values[[2]]$ySix,
    xSeven=aldf.66$last.values[[2]]$xSeven,
    ySeven=aldf.66$last.values[[2]]$ySeven,
    xEight=aldf.66$last.values[[2]]$xEight,
    yEight=aldf.66$last.values[[2]]$yEight
    )
tmp3<-list (
    v.star=vstar,
    alpha=aldf.66$last.values[[3]]$alpha,
    beta=aldf.66$last.values[[3]]$beta,
    delta=aldf.66$last.values[[3]]$delta,
#    xZero=aldf.66$last.values[[3]]$xZero,
#    yZero=aldf.66$last.values[[3]]$yZero,
    xOne=aldf.66$last.values[[3]]$xOne,
    yOne=aldf.66$last.values[[3]]$yOne,
    xTwo=aldf.66$last.values[[3]]$xTwo,
    yTwo=aldf.66$last.values[[3]]$yTwo,
    xThree=aldf.66$last.values[[3]]$xThree,
    yThree=aldf.66$last.values[[3]]$yThree,
    xFour=aldf.66$last.values[[3]]$xFour,
    yFour=aldf.66$last.values[[3]]$yFour,
    xFive=aldf.66$last.values[[3]]$xFive,
    yFive=aldf.66$last.values[[3]]$yFive,
    xSix=aldf.66$last.values[[3]]$xSix,
    ySix=aldf.66$last.values[[3]]$ySix,
    xSeven=aldf.66$last.values[[3]]$xSeven,
    ySeven=aldf.66$last.values[[3]]$ySeven,
    xEight=aldf.66$last.values[[3]]$xEight,
    yEight=aldf.66$last.values[[3]]$yEight
    )
### for (chain in 1:3){aldf.66$last.values[[chain]]$v.star <- vstar}
aldf.66.2 <- bugs (aldf.data,
                inits=list(tmp1,tmp2,tmp3),
                aldf.parameters,
                "model66Dyn2Di4.irt.txt", n.chains=3,
                n.iter=10000, n.thin=20, debug=T,
                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
                program = c("WinBUGS"))

aldf.66 <- aldf.66.2
rm(aldf.66.2)

plot(aldf.66)
print(aldf.66)

attach.bugs(aldf.66)
a <- -beta / delta ## pendiente cutline
b <- alpha / delta ## constante cutline
## 45-DEGREE CLOCKWISE ROTATION OF COORDINATES (SO THAT PRIORS REMAIN n, s, e, w)
xOneR <- xOne*cos(pi/4) + yOne*sin(pi/4)
yOneR <- -xOne*sin(pi/4) + yOne*cos(pi/4)
xTwoR <- xTwo*cos(pi/4) + yTwo*sin(pi/4)
yTwoR <- -xTwo*sin(pi/4) + yTwo*cos(pi/4)
xThreeR <- xThree*cos(pi/4) + yThree*sin(pi/4)
yThreeR <- -xThree*sin(pi/4) + yThree*cos(pi/4)
xFourR <- xFour*cos(pi/4) + yFour*sin(pi/4)
yFourR <- -xFour*sin(pi/4) + yFour*cos(pi/4)
xFiveR <- xFive*cos(pi/4) + yFive*sin(pi/4)
yFiveR <- -xFive*sin(pi/4) + yFive*cos(pi/4)
xSixR <- xSix*cos(pi/4) + ySix*sin(pi/4)
ySixR <- -xSix*sin(pi/4) + ySix*cos(pi/4)
xSevenR <- xSeven*cos(pi/4) + ySeven*sin(pi/4)
ySevenR <- -xSeven*sin(pi/4) + ySeven*cos(pi/4)
xEightR <- xEight*cos(pi/4) + yEight*sin(pi/4)
yEightR <- -xEight*sin(pi/4) + yEight*cos(pi/4)
xOne <- xOneR; yOne <- yOneR; xTwo <- xTwoR; yTwo <- yTwoR; xThree <- xThreeR; yThree <- yThreeR;
xFour <- xFourR; yFour <- yFourR; xFive <- xFiveR; yFive <- yFiveR; xSix <- xSixR; ySix <- ySixR;
xSeven <- xSevenR; ySeven <- ySevenR; xEight <- xEightR; yEight <- yEightR;
## 45-DEGREE CLOCKWISE ROTATION OF CUTLINES
xA <- -b/a; yA <- rep(0, length(a)); xO <- rep(0, length(a)); yO <- b  ## coords de Abscisa al origen y Ordenada al origan de c/cutline
xAR <- xA*cos(pi/4) + yA*sin(pi/4)
yAR <- -xA*sin(pi/4) + yA*cos(pi/4)
xOR <- xO*cos(pi/4) + yO*sin(pi/4)
yOR <- -xO*sin(pi/4) + yO*cos(pi/4)
X <- xAR; Y <- yAR; XX <- xOR; YY <- yOR ## simplifica notaci�n
aR <- (YY-Y)/(XX-X)           ## pendiente del cutline rotado
bR <- YY -((YY-Y)/(XX-X))*XX  ## constante del cutline rotado
rm(X,Y,XX,YY)
a <- aR; b <- bR

jotas <- array(NA, dim=c(T,6,J))
for (j in 1:J){
    jotas[1,1,j] <- quantile (xOne[,j], 0.025, names=F)
    jotas[1,2,j] <- quantile (xOne[,j], 0.50, names=F)
    jotas[1,3,j] <- quantile (xOne[,j], 0.975, names=F)
    jotas[2,1,j] <- quantile (xTwo[,j], 0.025, names=F)
    jotas[2,2,j] <- quantile (xTwo[,j], 0.50, names=F)
    jotas[2,3,j] <- quantile (xTwo[,j], 0.975, names=F)
    jotas[3,1,j] <- quantile (xThree[,j], 0.025, names=F)
    jotas[3,2,j] <- quantile (xThree[,j], 0.50, names=F)
    jotas[3,3,j] <- quantile (xThree[,j], 0.975, names=F)
    jotas[4,1,j] <- quantile (xFour[,j], 0.025, names=F)
    jotas[4,2,j] <- quantile (xFour[,j], 0.50, names=F)
    jotas[4,3,j] <- quantile (xFour[,j], 0.975, names=F)
    jotas[5,1,j] <- quantile (xFive[,j], 0.025, names=F)
    jotas[5,2,j] <- quantile (xFive[,j], 0.50, names=F)
    jotas[5,3,j] <- quantile (xFive[,j], 0.975, names=F)
    jotas[6,1,j] <- quantile (xSix[,j], 0.025, names=F)
    jotas[6,2,j] <- quantile (xSix[,j], 0.50, names=F)
    jotas[6,3,j] <- quantile (xSix[,j], 0.975, names=F)
    jotas[7,1,j] <- quantile (xSeven[,j], 0.025, names=F)
    jotas[7,2,j] <- quantile (xSeven[,j], 0.50, names=F)
    jotas[7,3,j] <- quantile (xSeven[,j], 0.975, names=F)
    jotas[8,1,j] <- quantile (xEight[,j], 0.025, names=F)
    jotas[8,2,j] <- quantile (xEight[,j], 0.50, names=F)
    jotas[8,3,j] <- quantile (xEight[,j], 0.975, names=F)
    jotas[1,4,j] <- quantile (yOne[,j], 0.025, names=F)
    jotas[1,5,j] <- quantile (yOne[,j], 0.50, names=F)
    jotas[1,6,j] <- quantile (yOne[,j], 0.975, names=F)
    jotas[2,4,j] <- quantile (yTwo[,j], 0.025, names=F)
    jotas[2,5,j] <- quantile (yTwo[,j], 0.50, names=F)
    jotas[2,6,j] <- quantile (yTwo[,j], 0.975, names=F)
    jotas[3,4,j] <- quantile (yThree[,j], 0.025, names=F)
    jotas[3,5,j] <- quantile (yThree[,j], 0.50, names=F)
    jotas[3,6,j] <- quantile (yThree[,j], 0.975, names=F)
    jotas[4,4,j] <- quantile (yFour[,j], 0.025, names=F)
    jotas[4,5,j] <- quantile (yFour[,j], 0.50, names=F)
    jotas[4,6,j] <- quantile (yFour[,j], 0.975, names=F)
    jotas[5,4,j] <- quantile (yFive[,j], 0.025, names=F)
    jotas[5,5,j] <- quantile (yFive[,j], 0.50, names=F)
    jotas[5,6,j] <- quantile (yFive[,j], 0.975, names=F)
    jotas[6,4,j] <- quantile (ySix[,j], 0.025, names=F)
    jotas[6,5,j] <- quantile (ySix[,j], 0.50, names=F)
    jotas[6,6,j] <- quantile (ySix[,j], 0.975, names=F)
    jotas[7,4,j] <- quantile (ySeven[,j], 0.025, names=F)
    jotas[7,5,j] <- quantile (ySeven[,j], 0.50, names=F)
    jotas[7,6,j] <- quantile (ySeven[,j], 0.975, names=F)
    jotas[8,4,j] <- quantile (yEight[,j], 0.025, names=F)
    jotas[8,5,j] <- quantile (yEight[,j], 0.50, names=F)
    jotas[8,6,j] <- quantile (yEight[,j], 0.975, names=F)
    }
###Quita retiros y sustituciones
for (t in 8) jotas[t,,65] <- rep(NA,6) ## Jorge D�az Cuervo pide licencia 23/9/2008=inicio cuad 7
for (t in 1:6) jotas[t,,66] <- rep(NA,6) ## Carla S�nchez Armas, la suplente

amed <- rep(NA,times=I)
bmed <- rep(NA,times=I)
for (i in 1:I){
    amed[i] <- quantile (a[,i], 0.50, names=F)
    bmed[i] <- quantile (b[,i], 0.50, names=F)  }

### Exporta coordenadas de todos los diputados
tmp <- matrix(NA, nrow=67, ncol=18)
tmp[,17] <- names.67
tmp[,18] <- part.67
for (j in 1:67){
    for (t in 1:8){
        tmp[j,t] <- jotas[t,2,j]
        tmp[j,t+8] <- jotas[t,5,j]
        }}
tmp<-data.matrix(tmp)
for (n in 1:16){tmp[,n] <- as.numeric(tmp[,n])}
write.table(tmp, file="aldfIdPts.xls", sep=",")
### Exporta
tmp <- data.frame(cbind(yr=RCs$yr, mo=RCs$mo, dy=RCs$dy ,a=amed, b=bmed))
write.table(tmp, file="aldfCutlines.xls", sep=",")

### TO RESET GRAPH PARAMETERS SAY par(oldpar) ###
oldpar <- par(no.readonly=TRUE)

#par(mfrow=c(3,3))
#par("pin" = c(.63,.58)) #width and height of plot region in inches

## FUNCTION TO DRAW ELLIPSES OVOIDS
ellipsePoints <- function(a,b, alpha = 0, loc = c(0,0), n = 201)
{
    ## Purpose: ellipse points,radially equispaced, given geometric par.s
    ## -------------------------------------------------------------------------
    ## Arguments: a, b : length of half axes in (x,y) direction
    ##            alpha: angle (in degrees) for rotation
    ##            loc  : center of ellipse
    ##            n    : number of points
    ## -------------------------------------------------------------------------
    ## Author: Martin Maechler, Date: 19 Mar 2002, 16:26
    B <- min(a,b)
    A <- max(a,b)
    ## B <= A
    d2 <- (A-B)*(A+B)                   #= A^2 - B^2
    phi <- 2*pi*seq(0,1, len = n)
    sp <- sin(phi)
    cp <- cos(phi)
    r <- a*b / sqrt(B^2 + d2 * sp^2)
    xy <- r * cbind(cp, sp)
    ## xy are the ellipse points for alpha = 0 and loc = (0,0)
    al <- alpha * pi/180
    ca <- cos(al)
    sa <- sin(al)
    xy %*% rbind(c(ca, sa), c(-sa, ca)) + cbind(rep(loc[1],n),
                                                rep(loc[2],n))
}


tmp <- c(jotas[,1,1],jotas[,4,1],jotas[,1,2],jotas[,4,2],jotas[,1,3],jotas[,4,3],jotas[,1,4],jotas[,4,4],
        jotas[,1,5],jotas[,4,5],jotas[,1,6],jotas[,4,6],jotas[,1,7],jotas[,4,7],jotas[,1,8],jotas[,4,8],
        jotas[,1,9],jotas[,4,9],jotas[,1,10],jotas[,4,10],jotas[,1,11],jotas[,4,11],jotas[,1,12],jotas[,4,12],
        jotas[,1,13],jotas[,4,13],jotas[,1,14],jotas[,4,14],jotas[,1,15],jotas[,4,15],jotas[,1,16],jotas[,4,16],
        jotas[,1,17],jotas[,4,17],jotas[,1,18],jotas[,4,18],jotas[,1,19],jotas[,4,19],jotas[,1,20],jotas[,4,20],
        jotas[,1,21],jotas[,4,21],jotas[,1,22],jotas[,4,22],jotas[,1,23],jotas[,4,23],jotas[,1,24],jotas[,4,24],
        jotas[,1,25],jotas[,4,25],jotas[,1,26],jotas[,4,26],jotas[,1,27],jotas[,4,27],jotas[,1,28],jotas[,4,28],
        jotas[,1,29],jotas[,4,29],jotas[,1,30],jotas[,4,30],jotas[,1,31],jotas[,4,31],jotas[,1,32],jotas[,4,32],
        jotas[,1,33],jotas[,4,33],jotas[,1,34],jotas[,4,34],jotas[,1,35],jotas[,4,35],jotas[,1,36],jotas[,4,36],
        jotas[,1,37],jotas[,4,37],jotas[,1,38],jotas[,4,38],jotas[,1,39],jotas[,4,39],jotas[,1,40],jotas[,4,40],
        jotas[,1,41],jotas[,4,41],jotas[,1,42],jotas[,4,42],jotas[,1,43],jotas[,4,43],jotas[,1,44],jotas[,4,44],
        jotas[,1,45],jotas[,4,45],jotas[,1,46],jotas[,4,46],jotas[,1,47],jotas[,4,47],jotas[,1,48],jotas[,4,48],
        jotas[,1,49],jotas[,4,49],jotas[,1,50],jotas[,4,50],jotas[,1,51],jotas[,4,51],jotas[,1,52],jotas[,4,52],
        jotas[,1,53],jotas[,4,53],jotas[,1,54],jotas[,4,54],jotas[,1,55],jotas[,4,55],jotas[,1,56],jotas[,4,56],
        jotas[,1,57],jotas[,4,57],jotas[,1,58],jotas[,4,58],jotas[,1,59],jotas[,4,59],jotas[,1,60],jotas[,4,60],
        jotas[,1,61],jotas[,4,61],jotas[,1,62],jotas[,4,62],jotas[,1,63],jotas[,4,63],jotas[,1,64],jotas[,4,64],
        jotas[,1,65],jotas[,4,65],jotas[,1,66],jotas[,4,66],jotas[,1,67],jotas[,4,67])
for (i in 1:length(tmp)) { tmp[i] <- ifelse(is.na(tmp[i])==TRUE,0,tmp[i]) }
min <- min( tmp )
tmp <- c(jotas[,3,1],jotas[,6,1],jotas[,3,2],jotas[,6,2],jotas[,3,3],jotas[,6,3],jotas[,3,4],jotas[,6,4],
        jotas[,3,5],jotas[,6,5],jotas[,3,6],jotas[,6,6],jotas[,3,7],jotas[,6,7],jotas[,3,8],jotas[,6,8],
        jotas[,3,9],jotas[,6,9],jotas[,3,10],jotas[,6,10],jotas[,3,11],jotas[,6,11],jotas[,3,12],jotas[,6,12],
        jotas[,3,13],jotas[,6,13],jotas[,3,14],jotas[,6,14],jotas[,3,15],jotas[,6,15],jotas[,3,16],jotas[,6,16],
        jotas[,3,17],jotas[,6,17],jotas[,3,18],jotas[,6,18],jotas[,3,19],jotas[,6,19],jotas[,3,20],jotas[,6,20],
        jotas[,3,21],jotas[,6,21],jotas[,3,22],jotas[,6,22],jotas[,3,23],jotas[,6,23],jotas[,3,24],jotas[,6,24],
        jotas[,3,25],jotas[,6,25],jotas[,3,26],jotas[,6,26],jotas[,3,27],jotas[,6,27],jotas[,3,28],jotas[,6,28],
        jotas[,3,29],jotas[,6,29],jotas[,3,30],jotas[,6,30],jotas[,3,31],jotas[,6,31],jotas[,3,32],jotas[,6,32],
        jotas[,3,33],jotas[,6,33],jotas[,3,34],jotas[,6,34],jotas[,3,35],jotas[,6,35],jotas[,3,36],jotas[,6,36],
        jotas[,3,37],jotas[,6,37],jotas[,3,38],jotas[,6,38],jotas[,3,39],jotas[,6,39],jotas[,3,40],jotas[,6,40],
        jotas[,3,41],jotas[,6,41],jotas[,3,42],jotas[,6,42],jotas[,3,43],jotas[,6,43],jotas[,3,44],jotas[,6,44],
        jotas[,3,45],jotas[,6,45],jotas[,3,46],jotas[,6,46],jotas[,3,47],jotas[,6,47],jotas[,3,48],jotas[,6,48],
        jotas[,3,49],jotas[,6,49],jotas[,3,50],jotas[,6,50],jotas[,3,51],jotas[,6,51],jotas[,3,52],jotas[,6,52],
        jotas[,3,53],jotas[,6,53],jotas[,3,54],jotas[,6,54],jotas[,3,55],jotas[,6,55],jotas[,3,56],jotas[,6,56],
        jotas[,3,57],jotas[,6,57],jotas[,3,58],jotas[,6,58],jotas[,3,59],jotas[,6,59],jotas[,3,60],jotas[,6,60],
        jotas[,3,61],jotas[,6,61],jotas[,3,62],jotas[,6,62],jotas[,3,63],jotas[,6,63],jotas[,3,64],jotas[,6,64],
        jotas[,3,65],jotas[,6,65],jotas[,3,66],jotas[,6,66],jotas[,3,67],jotas[,6,67])
for (i in 1:length(tmp)) { tmp[i] <- ifelse(is.na(tmp[i])==TRUE,0,tmp[i]) }
max <- max( tmp )
lims <- c(NA,NA)
lims[1] <- ifelse(abs(min)>max, min, -max)
lims[2] <- ifelse(abs(min)>max, abs(min), max)

#### FOR USE IF ELLIPSES WILL BE GRAPHED
##eps <- array(NA, dim=c(201,2,67))
##eps[,,1] <- ellipsePoints(a=jotas[t,2,1]-jotas[t,1,1],b=jotas[t,5,1]-jotas[t,4,1],alpha=0,loc=c(jotas[t,2,1],jotas[t,5,1]),n=201)
##eps[,,2] <- ellipsePoints(a=jotas[t,2,2]-jotas[t,1,2],b=jotas[t,5,2]-jotas[t,4,2],alpha=0,loc=c(jotas[t,2,2],jotas[t,5,2]),n=201)
##eps[,,3] <- ellipsePoints(a=jotas[t,2,3]-jotas[t,1,3],b=jotas[t,5,3]-jotas[t,4,3],alpha=0,loc=c(jotas[t,2,3],jotas[t,5,3]),n=201)
##eps[,,4] <- ellipsePoints(a=jotas[t,2,4]-jotas[t,1,4],b=jotas[t,5,4]-jotas[t,4,4],alpha=0,loc=c(jotas[t,2,4],jotas[t,5,4]),n=201)
##eps[,,5] <- ellipsePoints(a=jotas[t,2,5]-jotas[t,1,5],b=jotas[t,5,5]-jotas[t,4,5],alpha=0,loc=c(jotas[t,2,5],jotas[t,5,5]),n=201)
##eps[,,6] <- ellipsePoints(a=jotas[t,2,6]-jotas[t,1,6],b=jotas[t,5,6]-jotas[t,4,6],alpha=0,loc=c(jotas[t,2,6],jotas[t,5,6]),n=201)
##eps[,,7] <- ellipsePoints(a=jotas[t,2,7]-jotas[t,1,7],b=jotas[t,5,7]-jotas[t,4,7],alpha=0,loc=c(jotas[t,2,7],jotas[t,5,7]),n=201)
##eps[,,8] <- ellipsePoints(a=jotas[t,2,8]-jotas[t,1,8],b=jotas[t,5,8]-jotas[t,4,8],alpha=0,loc=c(jotas[t,2,8],jotas[t,5,8]),n=201)
##eps[,,9] <- ellipsePoints(a=jotas[t,2,9]-jotas[t,1,9],b=jotas[t,5,9]-jotas[t,4,9],alpha=0,loc=c(jotas[t,2,9],jotas[t,5,9]),n=201)
##eps[,,10] <- ellipsePoints(a=jotas[t,2,10]-jotas[t,1,10],b=jotas[t,5,10]-jotas[t,4,10],alpha=0,loc=c(jotas[t,2,10],jotas[t,5,10]),n=201)
##eps[,,11] <- ellipsePoints(a=jotas[t,2,11]-jotas[t,1,11],b=jotas[t,5,11]-jotas[t,4,11],alpha=0,loc=c(jotas[t,2,11],jotas[t,5,11]),n=201)
##eps[,,12] <- ellipsePoints(a=jotas[t,2,12]-jotas[t,1,12],b=jotas[t,5,12]-jotas[t,4,12],alpha=0,loc=c(jotas[t,2,12],jotas[t,5,12]),n=201)
##eps[,,13] <- ellipsePoints(a=jotas[t,2,13]-jotas[t,1,13],b=jotas[t,5,13]-jotas[t,4,13],alpha=0,loc=c(jotas[t,2,13],jotas[t,5,13]),n=201)
##eps[,,14] <- ellipsePoints(a=jotas[t,2,14]-jotas[t,1,14],b=jotas[t,5,14]-jotas[t,4,14],alpha=0,loc=c(jotas[t,2,14],jotas[t,5,14]),n=201)
##eps[,,15] <- ellipsePoints(a=jotas[t,2,15]-jotas[t,1,15],b=jotas[t,5,15]-jotas[t,4,15],alpha=0,loc=c(jotas[t,2,15],jotas[t,5,15]),n=201)
##eps[,,16] <- ellipsePoints(a=jotas[t,2,16]-jotas[t,1,16],b=jotas[t,5,16]-jotas[t,4,16],alpha=0,loc=c(jotas[t,2,16],jotas[t,5,16]),n=201)
##eps[,,17] <- ellipsePoints(a=jotas[t,2,17]-jotas[t,1,17],b=jotas[t,5,17]-jotas[t,4,17],alpha=0,loc=c(jotas[t,2,17],jotas[t,5,17]),n=201)
##eps[,,18] <- ellipsePoints(a=jotas[t,2,18]-jotas[t,1,18],b=jotas[t,5,18]-jotas[t,4,18],alpha=0,loc=c(jotas[t,2,18],jotas[t,5,18]),n=201)
##eps[,,19] <- ellipsePoints(a=jotas[t,2,19]-jotas[t,1,19],b=jotas[t,5,19]-jotas[t,4,19],alpha=0,loc=c(jotas[t,2,19],jotas[t,5,19]),n=201)
##eps[,,20] <- ellipsePoints(a=jotas[t,2,20]-jotas[t,1,20],b=jotas[t,5,20]-jotas[t,4,20],alpha=0,loc=c(jotas[t,2,20],jotas[t,5,20]),n=201)
##eps[,,21] <- ellipsePoints(a=jotas[t,2,21]-jotas[t,1,21],b=jotas[t,5,21]-jotas[t,4,21],alpha=0,loc=c(jotas[t,2,21],jotas[t,5,21]),n=201)
##eps[,,22] <- ellipsePoints(a=jotas[t,2,22]-jotas[t,1,22],b=jotas[t,5,22]-jotas[t,4,22],alpha=0,loc=c(jotas[t,2,22],jotas[t,5,22]),n=201)
##eps[,,23] <- ellipsePoints(a=jotas[t,2,23]-jotas[t,1,23],b=jotas[t,5,23]-jotas[t,4,23],alpha=0,loc=c(jotas[t,2,23],jotas[t,5,23]),n=201)
##eps[,,24] <- ellipsePoints(a=jotas[t,2,24]-jotas[t,1,24],b=jotas[t,5,24]-jotas[t,4,24],alpha=0,loc=c(jotas[t,2,24],jotas[t,5,24]),n=201)
##eps[,,25] <- ellipsePoints(a=jotas[t,2,25]-jotas[t,1,25],b=jotas[t,5,25]-jotas[t,4,25],alpha=0,loc=c(jotas[t,2,25],jotas[t,5,25]),n=201)
##eps[,,26] <- ellipsePoints(a=jotas[t,2,26]-jotas[t,1,26],b=jotas[t,5,26]-jotas[t,4,26],alpha=0,loc=c(jotas[t,2,26],jotas[t,5,26]),n=201)
##eps[,,27] <- ellipsePoints(a=jotas[t,2,27]-jotas[t,1,27],b=jotas[t,5,27]-jotas[t,4,27],alpha=0,loc=c(jotas[t,2,27],jotas[t,5,27]),n=201)
##eps[,,28] <- ellipsePoints(a=jotas[t,2,28]-jotas[t,1,28],b=jotas[t,5,28]-jotas[t,4,28],alpha=0,loc=c(jotas[t,2,28],jotas[t,5,28]),n=201)
##eps[,,29] <- ellipsePoints(a=jotas[t,2,29]-jotas[t,1,29],b=jotas[t,5,29]-jotas[t,4,29],alpha=0,loc=c(jotas[t,2,29],jotas[t,5,29]),n=201)
##eps[,,30] <- ellipsePoints(a=jotas[t,2,30]-jotas[t,1,30],b=jotas[t,5,30]-jotas[t,4,30],alpha=0,loc=c(jotas[t,2,30],jotas[t,5,30]),n=201)
##eps[,,31] <- ellipsePoints(a=jotas[t,2,31]-jotas[t,1,31],b=jotas[t,5,31]-jotas[t,4,31],alpha=0,loc=c(jotas[t,2,31],jotas[t,5,31]),n=201)
##eps[,,32] <- ellipsePoints(a=jotas[t,2,32]-jotas[t,1,32],b=jotas[t,5,32]-jotas[t,4,32],alpha=0,loc=c(jotas[t,2,32],jotas[t,5,32]),n=201)
##eps[,,33] <- ellipsePoints(a=jotas[t,2,33]-jotas[t,1,33],b=jotas[t,5,33]-jotas[t,4,33],alpha=0,loc=c(jotas[t,2,33],jotas[t,5,33]),n=201)
##eps[,,34] <- ellipsePoints(a=jotas[t,2,34]-jotas[t,1,34],b=jotas[t,5,34]-jotas[t,4,34],alpha=0,loc=c(jotas[t,2,34],jotas[t,5,34]),n=201)
##eps[,,35] <- ellipsePoints(a=jotas[t,2,35]-jotas[t,1,35],b=jotas[t,5,35]-jotas[t,4,35],alpha=0,loc=c(jotas[t,2,35],jotas[t,5,35]),n=201)
##eps[,,36] <- ellipsePoints(a=jotas[t,2,36]-jotas[t,1,36],b=jotas[t,5,36]-jotas[t,4,36],alpha=0,loc=c(jotas[t,2,36],jotas[t,5,36]),n=201)
##eps[,,37] <- ellipsePoints(a=jotas[t,2,37]-jotas[t,1,37],b=jotas[t,5,37]-jotas[t,4,37],alpha=0,loc=c(jotas[t,2,37],jotas[t,5,37]),n=201)
##eps[,,38] <- ellipsePoints(a=jotas[t,2,38]-jotas[t,1,38],b=jotas[t,5,38]-jotas[t,4,38],alpha=0,loc=c(jotas[t,2,38],jotas[t,5,38]),n=201)
##eps[,,39] <- ellipsePoints(a=jotas[t,2,39]-jotas[t,1,39],b=jotas[t,5,39]-jotas[t,4,39],alpha=0,loc=c(jotas[t,2,39],jotas[t,5,39]),n=201)
##eps[,,40] <- ellipsePoints(a=jotas[t,2,40]-jotas[t,1,40],b=jotas[t,5,40]-jotas[t,4,40],alpha=0,loc=c(jotas[t,2,40],jotas[t,5,40]),n=201)
##eps[,,41] <- ellipsePoints(a=jotas[t,2,41]-jotas[t,1,41],b=jotas[t,5,41]-jotas[t,4,41],alpha=0,loc=c(jotas[t,2,41],jotas[t,5,41]),n=201)
##eps[,,42] <- ellipsePoints(a=jotas[t,2,42]-jotas[t,1,42],b=jotas[t,5,42]-jotas[t,4,42],alpha=0,loc=c(jotas[t,2,42],jotas[t,5,42]),n=201)
##eps[,,43] <- ellipsePoints(a=jotas[t,2,43]-jotas[t,1,43],b=jotas[t,5,43]-jotas[t,4,43],alpha=0,loc=c(jotas[t,2,43],jotas[t,5,43]),n=201)
##eps[,,44] <- ellipsePoints(a=jotas[t,2,44]-jotas[t,1,44],b=jotas[t,5,44]-jotas[t,4,44],alpha=0,loc=c(jotas[t,2,44],jotas[t,5,44]),n=201)
##eps[,,45] <- ellipsePoints(a=jotas[t,2,45]-jotas[t,1,45],b=jotas[t,5,45]-jotas[t,4,45],alpha=0,loc=c(jotas[t,2,45],jotas[t,5,45]),n=201)
##eps[,,46] <- ellipsePoints(a=jotas[t,2,46]-jotas[t,1,46],b=jotas[t,5,46]-jotas[t,4,46],alpha=0,loc=c(jotas[t,2,46],jotas[t,5,46]),n=201)
##eps[,,47] <- ellipsePoints(a=jotas[t,2,47]-jotas[t,1,47],b=jotas[t,5,47]-jotas[t,4,47],alpha=0,loc=c(jotas[t,2,47],jotas[t,5,47]),n=201)
##eps[,,48] <- ellipsePoints(a=jotas[t,2,48]-jotas[t,1,48],b=jotas[t,5,48]-jotas[t,4,48],alpha=0,loc=c(jotas[t,2,48],jotas[t,5,48]),n=201)
##eps[,,49] <- ellipsePoints(a=jotas[t,2,49]-jotas[t,1,49],b=jotas[t,5,49]-jotas[t,4,49],alpha=0,loc=c(jotas[t,2,49],jotas[t,5,49]),n=201)
##eps[,,50] <- ellipsePoints(a=jotas[t,2,50]-jotas[t,1,50],b=jotas[t,5,50]-jotas[t,4,50],alpha=0,loc=c(jotas[t,2,50],jotas[t,5,50]),n=201)
##eps[,,51] <- ellipsePoints(a=jotas[t,2,51]-jotas[t,1,51],b=jotas[t,5,51]-jotas[t,4,51],alpha=0,loc=c(jotas[t,2,51],jotas[t,5,51]),n=201)
##eps[,,52] <- ellipsePoints(a=jotas[t,2,52]-jotas[t,1,52],b=jotas[t,5,52]-jotas[t,4,52],alpha=0,loc=c(jotas[t,2,52],jotas[t,5,52]),n=201)
##eps[,,53] <- ellipsePoints(a=jotas[t,2,53]-jotas[t,1,53],b=jotas[t,5,53]-jotas[t,4,53],alpha=0,loc=c(jotas[t,2,53],jotas[t,5,53]),n=201)
##eps[,,54] <- ellipsePoints(a=jotas[t,2,54]-jotas[t,1,54],b=jotas[t,5,54]-jotas[t,4,54],alpha=0,loc=c(jotas[t,2,54],jotas[t,5,54]),n=201)
##eps[,,55] <- ellipsePoints(a=jotas[t,2,55]-jotas[t,1,55],b=jotas[t,5,55]-jotas[t,4,55],alpha=0,loc=c(jotas[t,2,55],jotas[t,5,55]),n=201)
##eps[,,56] <- ellipsePoints(a=jotas[t,2,56]-jotas[t,1,56],b=jotas[t,5,56]-jotas[t,4,56],alpha=0,loc=c(jotas[t,2,56],jotas[t,5,56]),n=201)
##eps[,,57] <- ellipsePoints(a=jotas[t,2,57]-jotas[t,1,57],b=jotas[t,5,57]-jotas[t,4,57],alpha=0,loc=c(jotas[t,2,57],jotas[t,5,57]),n=201)
##eps[,,58] <- ellipsePoints(a=jotas[t,2,58]-jotas[t,1,58],b=jotas[t,5,58]-jotas[t,4,58],alpha=0,loc=c(jotas[t,2,58],jotas[t,5,58]),n=201)
##eps[,,59] <- ellipsePoints(a=jotas[t,2,59]-jotas[t,1,59],b=jotas[t,5,59]-jotas[t,4,59],alpha=0,loc=c(jotas[t,2,59],jotas[t,5,59]),n=201)
##eps[,,60] <- ellipsePoints(a=jotas[t,2,60]-jotas[t,1,60],b=jotas[t,5,60]-jotas[t,4,60],alpha=0,loc=c(jotas[t,2,60],jotas[t,5,60]),n=201)
##eps[,,61] <- ellipsePoints(a=jotas[t,2,61]-jotas[t,1,61],b=jotas[t,5,61]-jotas[t,4,61],alpha=0,loc=c(jotas[t,2,61],jotas[t,5,61]),n=201)
##eps[,,62] <- ellipsePoints(a=jotas[t,2,62]-jotas[t,1,62],b=jotas[t,5,62]-jotas[t,4,62],alpha=0,loc=c(jotas[t,2,62],jotas[t,5,62]),n=201)
##eps[,,63] <- ellipsePoints(a=jotas[t,2,63]-jotas[t,1,63],b=jotas[t,5,63]-jotas[t,4,63],alpha=0,loc=c(jotas[t,2,63],jotas[t,5,63]),n=201)
##eps[,,64] <- ellipsePoints(a=jotas[t,2,64]-jotas[t,1,64],b=jotas[t,5,64]-jotas[t,4,64],alpha=0,loc=c(jotas[t,2,64],jotas[t,5,64]),n=201)
##eps[,,65] <- ellipsePoints(a=jotas[t,2,65]-jotas[t,1,65],b=jotas[t,5,65]-jotas[t,4,65],alpha=0,loc=c(jotas[t,2,65],jotas[t,5,65]),n=201)
##eps[,,66] <- ellipsePoints(a=jotas[t,2,66]-jotas[t,1,66],b=jotas[t,5,66]-jotas[t,4,66],alpha=0,loc=c(jotas[t,2,66],jotas[t,5,66]),n=201)
##eps[,,67] <- ellipsePoints(a=jotas[t,2,67]-jotas[t,1,67],b=jotas[t,5,67]-jotas[t,4,67],alpha=0,loc=c(jotas[t,2,67],jotas[t,5,67]),n=201)

### SET t
t <- 5
for (t in 1:T){
par(mar = c(3.1, 3.1, 2.1, 2.1) )
##plot(c(-1.5,1.5),c(-1.5,1.5),xlim = lims,ylim = lims,type="n",
##       xlab=c(""), ##xlab=c("pro-SQ                                         pro-change"),
##       ylab=c(""), ##ylab=c("interpretivist                                            literalist"),
##       main=c("")) ##main=paste("Acc+Con (ancla j) time=",t,I,"obs"))
plot(c(-1.5,1.5),c(-1.5,1.5),type="n",
       xlab=c(""), ##xlab=c("pro-SQ                                         pro-change"),
       ylab=c(""), ##ylab=c("interpretivist                                            literalist"),
       main=c("")) ##main=paste("Acc+Con (ancla j) time=",t,I,"obs"))
abline(-1.5,0,col="grey",lty=3); abline(-1,0,col="grey",lty=3); abline(-.5,0,col="grey",lty=3);
       abline(0,0,col="grey",lty=3); abline(.5,0,col="grey",lty=3); abline(1,0,col="grey",lty=3);
       abline(1.5,0,col="grey",lty=3);
abline(v=-1.5,col="grey",lty=3); abline(v=-1,col="grey",lty=3); abline(v=-.5,col="grey",lty=3);
       abline(v=0,col="grey",lty=3); abline(v=.5,col="grey",lty=3); abline(v=1,col="grey",lty=3);
       abline(v=1.5,col="grey",lty=3);
legend(1.1,-.65, legend=part.list, cex=.75, pch=20, pt.cex=1.25, col=color.list, bg="white")
##for (j in 1:J){
##    segments(jotas[t,1,j],jotas[t,5,j],jotas[t,3,j],jotas[t,5,j],col="gray")
##    segments(jotas[t,2,j],jotas[t,4,j],jotas[t,2,j],jotas[t,6,j],col="gray")
##    }
##for (j in 1:J){
##    lines(eps[,,j],col=color.67[j])
##    }
for (j in 1:J){
    points(jotas[t,2,j],jotas[t,5,j],pch=20,col=color.67[j])
    }
for (j in 1:J){
    points(jotas[t,2,j],jotas[t,5,j], col=dCoord[j]); ## pone coordinadores
    }
##for (j in 1:J){
##    text(jotas[t,2,j],jotas[t,5,j],labels=coords[j])
##    }
tmp <- c("2006-3","2007-1","2007-2","2007-3","2008-1","2008-2","2008-3","2009-1")
setwd("d:/01/data/rollcall/aldf/graphs")
savePlot(filename = paste(tmp[t], sep=""), type = "pdf")
#setwd("c:/data")
setwd("d:/01/data/rollcall/aldf")
}

## cutlines
cuad <- 1*d1+2*d2+3*d3+4*d4+5*d5+6*d6+7*d7+8*d8
t <- 5
for (t in 1:8){
    plot(c(-1.5,1.5),c(-1.5,1.5),type="n",
           xlab=c(""), ##xlab=c("pro-SQ                                         pro-change"),
           ylab=c(""), ##ylab=c("interpretivist                                            literalist"),
           main=c("")) ##main=paste("Acc+Con (ancla j) time=",t,I,"obs"))
    atmp <- amed[cuad==t]; btmp <- bmed[cuad==t];
    N <- length(atmp)
    for (n in 1:N){
        abline(a=btmp[n],b=atmp[n]) } ## OJO: a en mi modelo es slope, en R es constant
    for (j in 1:J){
        points(jotas[t,2,j],jotas[t,5,j],pch=20,col=color.67[j])
        }
    tmp <- c("2006-3","2007-1","2007-2","2007-3","2008-1","2008-2","2008-3","2009-1")
    setwd("d:/01/data/rollcall/aldf/graphs")
    savePlot(filename = paste(tmp[t], "cutlines", sep=""), type = "pdf")
    setwd("d:/01/data/rollcall/aldf")
              }





# Prob of being median
attach.bugs(trife.edos.1)
is.median <- matrix(NA, nrow=3000, ncol=7)
med <- rep(NA, times=3000)
for (i in 1:3000){
    med[i]<-median(x[i,1:7])}
for (i in 1:3000){
    for (j in 1:7){
        is.median[i,j] <- ifelse(x[i,j]==med[i],1,0)}}
pr.median <- rep(NA, times=7, names=names.1)
for (j in 1:7){
    pr.median[j] <- sum(is.median[,j]/3000)}
names.1
pr.median


#HISTOGRAM OF POSTERIOR m
oldpar <- par(no.readonly=TRUE)

attach.bugs(trife.all.1)

#par(mfrow=c(2,1))
#par(oldpar)

eme <- c(m[,1],m[,2],m[,3],m[,4],m[,5],m[,6],m[,7])
#equis <- c(-400:400)/100
hist(eme[abs(eme)<=3], col="gray", xlim=c(-3,3), ylim=c(-.04,.55),freq=FALSE, main="m_i's prior and posterior densities", xlab=NULL)
points(all.1.80[,2],rep(0,times=7), pch=20)
curve(dnorm, from=-3, to=3, add=TRUE)
text(all.1.80[1,2],-.03,label="Reyes")
text(all.1.80[7,2],-.03,label="Fuentes")
#densityplot(eme[abs(eme)<=4])

#######################################################
### Static 66 members 2Dimensions extremist anchors ###
#######################################################

### ALLOWS TO DROP CASES FROM ANALYSIS
#year1 <- ifelse( (cuad==1 | cuad==2 | cuad==3), 1, 0 ) ## FALTA QUITAR A UN DIPUTADO (M�S?) QUE NO ENTR� HASTA DESPU�S
#drop <- ifelse(year1==0,1,0)
#tmp<-RCs[drop==0,]
#RCs<-tmp
#sem<-sem[drop==0]; cuad<-cuad[drop==0]; trim<-trim[drop==0]

votes <- RCs[,9:ncol(RCs)]
#votes[votes==-1] <- 0  # los -1s se vuelven 0s # DEJA ABSTENCION COMO VOTO NAY
votes <- t(votes)
J <- nrow(votes); I <- ncol(votes)
v <- votes
lo.v <- ifelse(is.na(v)==TRUE | v== 1, 0, -5)
hi.v <- ifelse(is.na(v)==TRUE | v==-1,  0, 5)
vstar <- matrix (NA, nrow=J, ncol=I)
for (j in 1:J){
for (i in 1:I){
  vstar[j,i] <- ifelse(v[j,i]==0, 0, ifelse(v[j,i]==1, runif(1), -1*runif(1)))}}
aldf.data <- list ("J", "I", "lo.v", "hi.v", "N", "W", "E", "S")
aldf.inits <- function (){
    list (
    v.star=vstar,
    delta=rnorm(I),
    angle=runif(I),
    b=rnorm(I)
#    x=rnorm(J),
#    y=rnorm(J)
    )
    }
aldf.parameters <- c("delta", "x", "y", "a", "b", "angle")

#test ride to see program works
aldf.66 <- bugs (aldf.data, aldf.inits, aldf.parameters,
                "model66Sta2Dj.txt", n.chains=3,
                n.iter=20, n.thin=2, debug=T,
                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
                program = c("WinBUGS"))

plot(aldf.66)
print(aldf.66)

#longer run
aldf.66 <- bugs (aldf.data, aldf.inits, aldf.parameters,
                "model66Sta2Dj.txt", n.chains=3,
                n.iter=10000, n.thin=25, debug=T,
                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
                program = c("WinBUGS"))

#to continue running
tmp1<-list (
    v.star=vstar,
    delta=aldf.66$last.values[[1]]$delta,
    angle=aldf.66$last.values[[1]]$angle,
    b=aldf.66$last.values[[1]]$b,
    x=aldf.66$last.values[[1]]$x,
    y=aldf.66$last.values[[1]]$y
    )
tmp2<-list (
    v.star=vstar,
    delta=aldf.66$last.values[[2]]$delta,
    angle=aldf.66$last.values[[2]]$angle,
    b=aldf.66$last.values[[2]]$b,
    x=aldf.66$last.values[[2]]$x,
    y=aldf.66$last.values[[2]]$y
    )
tmp3<-list (
    v.star=vstar,
    delta=aldf.66$last.values[[3]]$delta,
    angle=aldf.66$last.values[[3]]$angle,
    b=aldf.66$last.values[[3]]$b,
    x=aldf.66$last.values[[3]]$x,
    y=aldf.66$last.values[[3]]$y
    )
### for (chain in 1:3){aldf.66$last.values[[chain]]$v.star <- vstar}
aldf.66.2 <- bugs (aldf.data,
                inits=list(tmp1,tmp2,tmp3),
                aldf.parameters,
                "model66Sta2Dj.txt", n.chains=3,
                n.iter=25000, n.thin=60, debug=T,
                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
                program = c("WinBUGS"))

aldf.66 <- aldf.66.2
rm(aldf.66.2)

eric  #######################################################
### Static 66 members 2Dimensions four ITEM anchors ###
#######################################################

### ALLOWS TO DROP CASES FROM ANALYSIS
#year1 <- ifelse( (cuad==1 | cuad==2 | cuad==3), 1, 0 ) ## FALTA QUITAR A UN DIPUTADO (M�S?) QUE NO ENTR� HASTA DESPU�S
#drop <- ifelse(year1==0,1,0)
#tmp<-RCs[drop==0,]
#RCs<-tmp
#sem<-sem[drop==0]; cuad<-cuad[drop==0]; trim<-trim[drop==0]

votes <- RCs[,9:ncol(RCs)]
#votes[votes==-1] <- 0  # los -1s se vuelven 0s # DEJA ABSTENCION COMO VOTO NAY
votes <- t(votes)
J <- nrow(votes); I <- ncol(votes)
v <- votes
lo.v <- ifelse(is.na(v)==TRUE | v== 1, 0, -5)
hi.v <- ifelse(is.na(v)==TRUE | v==-1,  0, 5)
vstar <- matrix (NA, nrow=J, ncol=I)
for (j in 1:J){
for (i in 1:I){
  vstar[j,i] <- ifelse(v[j,i]==0, 0, ifelse(v[j,i]==1, runif(1), -1*runif(1)))}}
aldf.data <- list ("J", "I", "lo.v", "hi.v", "V1", "V2", "H1", "H2")
aldf.inits <- function (){
    list (
    v.star=vstar,
    alpha=rnorm(I),
    beta=rnorm(I),
    delta=rnorm(I),
    x=rnorm(J),
    y=rnorm(J)
    )
    }
aldf.parameters <- c("alpha","beta", "delta", "x", "y")

#test ride to see program works
aldf.67 <- bugs (aldf.data, aldf.inits, aldf.parameters,
                "model66Sta2Di4.irt.txt", n.chains=3,
                n.iter=10, n.thin=1, debug=T,
                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
#                bugs.directory = "c:/Archivos de programa/WinBUGS14/",
                program = c("WinBUGS"))

plot(aldf.67)
print(aldf.67)

#longer run
aldf.67 <- bugs (aldf.data, aldf.inits, aldf.parameters,
                "model66Sta2Di4.irt.txt", n.chains=3,
                n.iter=5000, n.thin=10, debug=T,
                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
#                bugs.directory = "c:/Archivos de programa/WinBUGS14/",
                program = c("WinBUGS"))

#to continue running
tmp1<-list (
    v.star=vstar,
    delta=aldf.67$last.values[[1]]$delta,
    angle=aldf.67$last.values[[1]]$angle,
    b=aldf.67$last.values[[1]]$b,
    x=aldf.67$last.values[[1]]$x,
    y=aldf.67$last.values[[1]]$y
    )
tmp2<-list (
    v.star=vstar,
    delta=aldf.67$last.values[[2]]$delta,
    angle=aldf.67$last.values[[2]]$angle,
    b=aldf.67$last.values[[2]]$b,
    x=aldf.67$last.values[[2]]$x,
    y=aldf.67$last.values[[2]]$y
    )
tmp3<-list (
    v.star=vstar,
    delta=aldf.67$last.values[[3]]$delta,
    angle=aldf.67$last.values[[3]]$angle,
    b=aldf.67$last.values[[3]]$b,
    x=aldf.67$last.values[[3]]$x,
    y=aldf.67$last.values[[3]]$y
    )
### for (chain in 1:3){aldf.67$last.values[[chain]]$v.star <- vstar}
aldf.67.2 <- bugs (aldf.data,
                inits=list(tmp1,tmp2,tmp3),
                aldf.parameters,
                "model66Sta2Di4.irt.txt", n.chains=3,
                n.iter=30000, n.thin=100, debug=T,
                bugs.directory = "c:/Program Files (x86)/WinBUGS14/",
#                bugs.directory = "c:/Archivos de programa/WinBUGS14/",
                program = c("WinBUGS"))

aldf.67 <- aldf.67.2
rm(aldf.67.2)

attach.bugs(aldf.67)
a <- -beta / delta ## pendiente cutline
b <- alpha / delta ## constante cutline
## 45-DEGREE CLOCKWISE ROTATION OF COORDINATES (SO THAT PRIORS REMAIN n, s, e, w)
xR <- x*cos(pi/4) + y*sin(pi/4)
yR <- -x*sin(pi/4) + y*cos(pi/4)
x <- xR; y <- yR;
## 45-DEGREE CLOCKWISE ROTATION OF CUTLINES
xA <- -b/a; yA <- rep(0, length(a)); xO <- rep(0, length(a)); yO <- b  ## coords de Abscisa al origen y Ordenada al origan de c/cutline
xAR <- xA*cos(pi/4) + yA*sin(pi/4)
yAR <- -xA*sin(pi/4) + yA*cos(pi/4)
xOR <- xO*cos(pi/4) + yO*sin(pi/4)
yOR <- -xO*sin(pi/4) + yO*cos(pi/4)
X <- xAR; Y <- yAR; XX <- xOR; YY <- yOR ## simplifica notaci�n
aR <- (YY-Y)/(XX-X)           ## pendiente del cutline rotado
bR <- YY -((YY-Y)/(XX-X))*XX  ## constante del cutline rotado
rm(X,Y,XX,YY)
a <- aR; b <- bR


jotas <- matrix(NA, nrow=J, ncol=6)
for (j in 1:J){
    jotas[j,1] <- quantile (x[,j], 0.025, names=F)
    jotas[j,2] <- quantile (x[,j], 0.50, names=F)
    jotas[j,3] <- quantile (x[,j], 0.975, names=F)
    jotas[j,4] <- quantile (y[,j], 0.025, names=F)
    jotas[j,5] <- quantile (y[,j], 0.50, names=F)
    jotas[j,6] <- quantile (y[,j], 0.975, names=F)
    }

# For use in rollrates analysis
postNorthprd <- rep(0,67)
postSouthprd <- rep(0,67)
for (j in 1:67){
    postNorthprd[j] <- ifelse (jotas[j,5]>=0 & part.67[j]=="prd", 1, 0)
    postSouthprd[j] <- ifelse (jotas[j,5]<0 & part.67[j]=="prd", 1, 0)
    }

amed <- rep(NA,times=I)
bmed <- rep(NA,times=I)
for (i in 1:I){
    amed[i] <- quantile (a[,i], 0.50, names=F)
    bmed[i] <- quantile (b[,i], 0.50, names=F)  }

### Exporta coordenadas de todos los diputados
tmp <- matrix(NA, nrow=67, ncol=4)
tmp[,1] <- as.numeric(jotas[,2])
tmp[,2] <- jotas[,5]
tmp[,3] <- names.67
tmp[,4] <- part.67
tmp<-data.matrix(tmp)
tmp[,1:2] <- as.numeric(tmp[,1:2])
write.table(tmp, file="aldfStaticIdPts.xls", sep=",")


### TO RESET GRAPH PARAMETERS SAY par(oldpar) ###
oldpar <- par(no.readonly=TRUE)

#par(mfrow=c(3,3))
#par("pin" = c(.63,.58)) #width and height of plot region in inches

## FUNCTION TO DRAW ELLIPSES OVOIDS
ellipsePoints <- function(a,b, alpha = 0, loc = c(0,0), n = 201)
{
    ## Purpose: ellipse points,radially equispaced, given geometric par.s
    ## -------------------------------------------------------------------------
    ## Arguments: a, b : length of half axes in (x,y) direction
    ##            alpha: angle (in degrees) for rotation
    ##            loc  : center of ellipse
    ##            n    : number of points
    ## -------------------------------------------------------------------------
    ## Author: Martin Maechler, Date: 19 Mar 2002, 16:26
    B <- min(a,b)
    A <- max(a,b)
    ## B <= A
    d2 <- (A-B)*(A+B)                   #= A^2 - B^2
    phi <- 2*pi*seq(0,1, len = n)
    sp <- sin(phi)
    cp <- cos(phi)
    r <- a*b / sqrt(B^2 + d2 * sp^2)
    xy <- r * cbind(cp, sp)
    ## xy are the ellipse points for alpha = 0 and loc = (0,0)
    al <- alpha * pi/180
    ca <- cos(al)
    sa <- sin(al)
    xy %*% rbind(c(ca, sa), c(-sa, ca)) + cbind(rep(loc[1],n),
                                                rep(loc[2],n))
}

tmp <- c(jotas[,1],jotas[,4])
for (i in 1:length(tmp)) { tmp[i] <- ifelse(is.na(tmp[i])==TRUE,0,tmp[i]) }
min <- min( tmp )
tmp <- c(jotas[,3],jotas[,6])
for (i in 1:length(tmp)) { tmp[i] <- ifelse(is.na(tmp[i])==TRUE,0,tmp[i]) }
max <- max( tmp )
lims <- c(NA,NA)
lims[1] <- ifelse(abs(min)>max, min, -max)
lims[2] <- ifelse(abs(min)>max, abs(min), max)

#### FOR USE IF ELLIPSES WILL BE GRAPHED
##eps <- array(NA, dim=c(201,2,67))
##eps[,,1] <- ellipsePoints(a=jotas[t,2,1]-jotas[t,1,1],b=jotas[t,5,1]-jotas[t,4,1],alpha=0,loc=c(jotas[t,2,1],jotas[t,5,1]),n=201)
##eps[,,2] <- ellipsePoints(a=jotas[t,2,2]-jotas[t,1,2],b=jotas[t,5,2]-jotas[t,4,2],alpha=0,loc=c(jotas[t,2,2],jotas[t,5,2]),n=201)
##etcetera

par(mar = c(3.1, 3.1, 2.1, 2.1) )
plot(c(-1.5,1.5),c(-1.5,1.5),type="n",
       xlab=c(""), ##xlab=c("pro-SQ                                         pro-change"),
       ylab=c(""), ##ylab=c("interpretivist                                            literalist"),
       main=c("")) ##main=paste("Acc+Con (ancla j) time=",t,I,"obs"))
abline(-1.5,0,col="grey",lty=3); abline(-1,0,col="grey",lty=3); abline(-.5,0,col="grey",lty=3);
       abline(0,0,col="grey",lty=3); abline(.5,0,col="grey",lty=3); abline(1,0,col="grey",lty=3);
       abline(1.5,0,col="grey",lty=3);
abline(v=-1.5,col="grey",lty=3); abline(v=-1,col="grey",lty=3); abline(v=-.5,col="grey",lty=3);
       abline(v=0,col="grey",lty=3); abline(v=.5,col="grey",lty=3); abline(v=1,col="grey",lty=3);
       abline(v=1.5,col="grey",lty=3);
legend(1.1,-.65, legend=part.list, cex=.75, pch=20, pt.cex=1.25, col=color.list, bg="white")
##for (j in 1:J){
##    segments(jotas[t,1,j],jotas[t,5,j],jotas[t,3,j],jotas[t,5,j],col="gray")
##    segments(jotas[t,2,j],jotas[t,4,j],jotas[t,2,j],jotas[t,6,j],col="gray")
##    }
##for (j in 1:J){
##    lines(eps[,,j],col=color.67[j])
##    }
for (j in 1:J){
    points(jotas[j,2],jotas[j,5],pch=20,col=color.67[j])
    }
for (j in 1:J){
    points(jotas[j,2],jotas[j,5], col=dCoord[j]); ## pone coordinadores
    }
##for (j in 1:J){
##    text(jotas[j,2],jotas[j,5],labels=coords[j])
##    }


## cutlines
#cuad <- 1*d1+2*d2+3*d3+4*d4+5*d5+6*d6+7*d7+8*d8 ## could be handy to draw cutlines for some t in static map
    plot(c(-1.5,1.5),c(-1.5,1.5),type="n",
           xlab=c(""),
           ylab=c(""),
           main=c(""))
#    atmp <- amed[cuad==t]; btmp <- bmed[cuad==t];
    atmp <- amed; btmp <- bmed;
    N <- length(atmp)
    for (n in 1:N){
        abline(a=btmp[n], b=atmp[n], col="grey") } ## OJO: a en mi modelo es slope, en R es constant
    for (j in 1:J){
        points(jotas[j,2],jotas[j,5],pch=20,col=color.67[j])
        }

## cutlines one-by-one
setwd("d:/01/data/rollcall/aldf/graphs/cutlinesOnebyOne")
    atmp <- amed; btmp <- bmed;
    N <- length(atmp)
#    n <- 12
    for (n in 1:N){
        plot(c(-2,2),c(-2,2),type="n",
           xlab=c(""),
           ylab=c(""),
           main=paste(RCs$yr[n],"-",RCs$mo[n],"-",RCs$dy[n],"#",RCs$folio[n],"  (",RCs$favor[n],"/",RCs$contra[n],"/",RCs$absten[n],")",sep=""))
        abline(a=btmp[n], b=atmp[n], col="black")
            for (j in 1:J){
                points(jotas[j,2],jotas[j,5],pch=20,col=color.67[j])
                }
        savePlot(filename = paste("cutline",n, sep=""), type = "pdf")
    }
setwd("d:/01/data/rollcall/aldf")


##################################################
### FACTOR ANALYSIS TO ESTIMATE DIMENSIONALITY ###
##################################################

### ALLOWS TO DROP CASES FROM ANALYSIS
#year1 <- ifelse( (cuad==1 | cuad==2 | cuad==3), 1, 0 ) ## FALTA QUITAR A UN DIPUTADO (M�S?) QUE NO ENTR� HASTA DESPU�S
#drop <- ifelse(year1==0,1,0)
#tmp<-RCs[drop==0,]
#RCs<-tmp
#sem<-sem[drop==0]; cuad<-cuad[drop==0]; trim<-trim[drop==0]

votes <- RCs[,9:ncol(RCs)]
votes[votes==-1] <- 0  # los -1s se vuelven 0s # DEJA ABSTENCION COMO VOTO NAY
votes <- t(votes)
votes <- votes[,1:50] ## subset to test
cor(votes)
factanal(votes, factors=4) # varimax is the default

factanal(votes, factors=5, rotation="promax")



# A little demonstration, v2 is just v1 with noise,
# and same for v4 vs. v3 and v6 vs. v5
# Last four cases are there to add noise
# and introduce a positive manifold (g factor)
v1 <- c(1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,4,5,6)
v2 <- c(1,2,1,1,1,1,2,1,2,1,3,4,3,3,3,4,6,5)
v3 <- c(3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,5,4,6)
v4 <- c(3,3,4,3,3,1,1,2,1,1,1,1,2,1,1,5,6,4)
v5 <- c(1,1,1,1,1,3,3,3,3,3,1,1,1,1,1,6,4,5)
v6 <- c(1,1,1,2,1,3,3,3,4,3,1,1,1,2,1,6,5,4)
m1 <- cbind(v1,v2,v3,v4,v5,v6)
cor(m1)
factanal(m1, factors=3) # varimax is the default
factanal(m1, factors=3, rotation="promax")
# The following shows the g factor as PC1
prcomp(m1)

## formula interface
factanal(~v1+v2+v3+v4+v5+v6, factors = 3,
        scores = "Bartlett")$scores

## a realistic example from Barthlomew (1987, pp. 61-65)
example(ability.cov)
