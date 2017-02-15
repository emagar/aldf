#setwd("c:/data/rollcall/aldf")
setwd("d:/01/data/rollcall/aldf")
#setwd("c:/Documents and Settings/emagarm/Mis documentos/My Dropbox/data/rollcall/aldf")
rm(list = ls())
#
load(file="allRCs.RData")
#
# PARA TRABAJAR CON LOS VOTOS UNANIMES
RCs <- RCsU; rm(RCsU)
#

names.67 <- c("Ramón Jiménez López", "Antonio Lima", 
"Enrique Vargas Anaya", "Isaías Villa", "Balfre Vargas Cortés", 
"Juan Bustos", "Norberto Sánchez Nazario", "Edgar Torres Baltazar",
"Cristóbal Ramírez", "Tomás Pliego", "Esthela Damián", 
"Laura Piña", "Agustín Guerrero", "Margarita Martínez", 
"Daniel Ordóñez", "Benito Antonio León", "José Zepeda", 
"Ricardo García Hernández", "Elba Garfias", "Alfredo Vinalay", 
"Alejandro Ramírez Rodríguez", "Víctor Hugo Círigo", "Daniel Salazar",
"Sergio Cedillo", "Humberto Morgan", "Arturo Santana",
"Ezequiel Rétiz", "Juan Carlos Beltrán", "Samuel Hdz Abarca",
"Mauricio Toledo", "Miguel Sosa", "José Luis Morúa", 
"Leticia Quezada", "Sergio Avila Rojas", "Edy Ortiz Piña", 
"Nancy Cárdenas", "Hipólito Bravo", "Salvador Mtz della Rocca",
"Avelino Méndez Rangel", "Hernández Mirón", 
"López Rabadán Kenia", "Carmen Segura", "Jorge Triana", 
"Miguel Hernández Labastida", "Miguel Angel Errasti", "Celina Saavedra", 
"Agustín Castilla", "Elvira Murillo", "María Quiñónez", "Jorge Romero",
"Daniel Ramírez del Valle", "Paula Soto", "Jacobo Bonilla",
"Federico Schiaffino", "Carmen Peralta", "Carlos Olavarrieta",
"Leonardo Álvarez Romo", "Marco García Ayala", 
"Francisco Alvarado", "Tonatiuh González", "Isabel Cañizo", 
"Fernando Espino", "Xiuh Tenorio", "Rebeca Parada", "Jorge Díaz Cuervo",
"Carla Sánchez Armas", "Enrique Pérez Correa")
#
coords <- c("", "", "", "", "", "", "", "",
"", "", "", "", "Guerrero", "", "", "", "", "", "", "", "",
"Círigo", "", "", "", "", "", "", "", "", "", "", "", "", "",
"", "", "", "", "", "", "", "Triana", "", "", "", "", "", "",
"", "", "", "", "Schiaffino", "", "", "", "", "", "", "", "",
"Tenorio", "", "", "", "")
#
dCoord <- c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
1, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA, NA, NA, NA, NA,
NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA,
NA, NA, NA, NA, NA, NA, NA, NA, NA, 1, NA, NA, NA, NA, NA, NA,
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
# POSTERIOR PRD FACTIONS (from static estimate)
postNorthprd <- c(0,1,0,1,0,0,1,0,0,0,1,1,0,0,1,1,0,0,1,0,0,1,1,1,0,0,0,1,1,1,0,1,0,0,1,1,0,0,
0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
postSouthprd <- c(1,0,1,0,1,1,0,1,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,1,0,1,1,0,0,1,1,
1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)
#
data.frame(x=names.67,y=part.67,z=color.67)
#
for (n in 1:ncol(RCs)){
    RCs[,n]<-as.numeric(RCs[,n])
}
#
## Sorts by date
tmp<-RCs[order(RCs$yr, RCs$mo, RCs$dy, RCs$folio),]
RCs<-tmp
#
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
## IGNORES 9TH CUADRIMESTRE WITH SINGLE CONTESTED VOTE
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
    color[i] <- ifelse (party[i]=="panal", "cyan", ifelse(party[i]=="pan", "darkblue", ifelse(party[i]=="prd", "gold", 
    ifelse((party[i]=="pri" | party[i]=="pri-uc"), "green4", ifelse(party[i]=="psd", "darkorchid", 
    ifelse(party[i]=="pt", "red", NA))))))
    }
#
vot <- RCs[,9:ncol(RCs)]  ## votes only
tmp <- vot[,1]
for (n in 2:ncol(vot)){
    tmp2 <- vot[,n]
    tmp <- append(tmp,tmp2)
    }
table(tmp) ## No sé por qué quedan algunos #2=contra y #3=abstención
vot <- ifelse(vot==3,0,ifelse(vot==9,0,ifelse(vot==2,-1,ifelse(vot==1,1,ifelse(vot==-1,-1,ifelse(vot==0,0,99))))))
##############################################################################
#vot[vot==0] <- -1  # los 0s se vuelven -1s #  DEJA ABSTENCION COMO VOTO NAY  #
##############################################################################
tmp <- vot[,1]
for (n in 2:ncol(vot)){
    tmp2 <- vot[,n]
    tmp <- append(tmp,tmp2)
    }
table(tmp)

I <- length(vot[,1])
#
ayes <- vot
ayes[,] <- ifelse(vot[,]==1,1,0) ## IGNORA ABSTENCIONES Y AUSENCIAS (si aun quedaran)
nays <- vot
nays[,] <- ifelse(vot[,]==-1,1,0) ## IGNORA ABSTENCIONES Y AUSENCIAS (si aun quedaran)
present <- ayes+nays
#
tmp <- rep(NA, I)
ayespan <- tmp; ayespri <- tmp; ayesprd <- tmp; ayespanal <- tmp; ayespvem <- tmp
nayspan <- tmp; nayspri <- tmp; naysprd <- tmp; nayspanal <- tmp; nayspvem <- tmp
presentpan <- tmp; presentpri <- tmp; presentprd <- tmp; presentpanal <- tmp; presentpvem <- tmp; presentall <- tmp
for (i in 1:I){
    ayespan[i] <- sum(ayes[i,part.67=="pan"])
    ayespri[i] <- sum(ayes[i,part.67=="pri"])
    ayesprd[i] <- sum(ayes[i,part.67=="prd"])
    ayespanal[i] <- sum(ayes[i,part.67=="panal"])
    ayespvem[i] <- sum(ayes[i,part.67=="pvem"])
    nayspan[i] <- sum(nays[i,part.67=="pan"])
    nayspri[i] <- sum(nays[i,part.67=="pri"])
    naysprd[i] <- sum(nays[i,part.67=="prd"])
    nayspanal[i] <- sum(nays[i,part.67=="panal"])
    nayspvem[i] <- sum(nays[i,part.67=="pvem"])
    presentpan[i] <- sum(present[i,part.67=="pan"])
    presentpri[i] <- sum(present[i,part.67=="pri"])
    presentprd[i] <- sum(present[i,part.67=="prd"])
    presentpanal[i] <- sum(present[i,part.67=="panal"])
    presentpvem[i] <- sum(present[i,part.67=="pvem"])
    presentall[i] <- sum(present[i,])
    }
#
tmp <- data.frame(all=presentall, yr=RCs$yr, mo=RCs$mo, dy=RCs$dy, dunan=RCs$dunan)
tmp ## OJO PROBLEMAS QUE DEBO CORREGIR: INCLUYEN COMISION PERMANENTE
#    
#REPEAT ABOVE DROPPING VOTES WHERE ALL<20 (34 WOULD BE BETTER, BUT WOULD HAVE TO CONSIDER ABSTENTIONS IN ALL)
RCsBak <- RCs
dropComPermEtc <- ifelse(presentall>19,0,1)
RCs <- RCs[dropComPermEtc==0,]
vot <- RCs[,9:ncol(RCs)]  ## votes only
vot <- ifelse(vot==3,0,ifelse(vot==9,0,ifelse(vot==2,-1,ifelse(vot==1,1,ifelse(vot==-1,-1,ifelse(vot==0,0,99))))))
#
I <- length(vot[,1])
#
ayes <- vot
ayes[,] <- ifelse(vot[,]==1,1,0) ## IGNORA ABSTENCIONES Y AUSENCIAS (si aun quedaran)
nays <- vot
nays[,] <- ifelse(vot[,]==-1,1,0) ## IGNORA ABSTENCIONES Y AUSENCIAS (si aun quedaran)
present <- ayes+nays
#
tmp <- rep(NA, I)
ayespan <- tmp; ayespri <- tmp; ayesprd <- tmp; ayespanal <- tmp; ayespvem <- tmp
nayspan <- tmp; nayspri <- tmp; naysprd <- tmp; nayspanal <- tmp; nayspvem <- tmp
presentpan <- tmp; presentpri <- tmp; presentprd <- tmp; presentpanal <- tmp; presentpvem <- tmp; presentall <- tmp
for (i in 1:I){
    ayespan[i] <- sum(ayes[i,part.67=="pan"])
    ayespri[i] <- sum(ayes[i,part.67=="pri"])
    ayesprd[i] <- sum(ayes[i,part.67=="prd"])
    ayespanal[i] <- sum(ayes[i,part.67=="panal"])
    ayespvem[i] <- sum(ayes[i,part.67=="pvem"])
    nayspan[i] <- sum(nays[i,part.67=="pan"])
    nayspri[i] <- sum(nays[i,part.67=="pri"])
    naysprd[i] <- sum(nays[i,part.67=="prd"])
    nayspanal[i] <- sum(nays[i,part.67=="panal"])
    nayspvem[i] <- sum(nays[i,part.67=="pvem"])
    presentpan[i] <- sum(present[i,part.67=="pan"])
    presentpri[i] <- sum(present[i,part.67=="pri"])
    presentprd[i] <- sum(present[i,part.67=="prd"])
    presentpanal[i] <- sum(present[i,part.67=="panal"])
    presentpvem[i] <- sum(present[i,part.67=="pvem"])
    presentall[i] <- sum(present[i,])
    }

rice <- RCs[,1:8]
rice$pan <- abs(abs(ayespan-nayspan)/presentpan - .5)/.5
rice$pri <- abs(abs(ayespri-nayspri)/presentpri - .5)/.5
rice$prd <- abs(abs(ayesprd-naysprd)/presentprd - .5)/.5
rice$panal <- abs(abs(ayespanal-nayspanal)/presentpanal - .5)/.5
rice$pvem <- abs(abs(ayespvem-nayspvem)/presentpvem - .5)/.5
rice$ILpanprd <- 1-abs(ayespan/presentpan-ayesprd/presentprd)
rice$ILpanpri <- 1-abs(ayespan/presentpan-ayespri/presentpri)
rice$ILpriprd <- 1-abs(ayespri/presentpri-ayesprd/presentprd)
#
rolls <- RCs[,1:8]
winside <- RCs[,1:8]
fortyplus <- RCs[,1:8]
#

win <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    win[v] <- ifelse (sum(vot[v,])>0,1,-1)
    }
winprd <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    winprd[v] <- ifelse (sum(vot[v,part.67=="prd"])>0,1,-1)
    }
winpan <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    winpan[v] <- ifelse (sum(vot[v,part.67=="pan"])>0,1,-1)
    }
winpri <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    winpri[v] <- ifelse (sum(vot[v,part.67=="pri"])>0,1,-1)
    }
winpvem <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    winpvem[v] <- ifelse (sum(vot[v,part.67=="pvem"])>0,1,-1)
    }
winpanal <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    winpanal[v] <- ifelse (sum(vot[v,part.67=="panal"])>0,1,-1)
    }
winpsd <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    winpsd[v] <- ifelse (sum(vot[v,part.67=="psd"])>0,1,-1)
    }
winNprd <- rep(NA, nrow(vot)); winSprd <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    winNprd[v] <- ifelse (sum(vot[v,postNorthprd==1])>0,1,-1)
    winSprd[v] <- ifelse (sum(vot[v,postSouthprd==1])>0,1,-1)
    }
#
fortyplusnaypan  <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    tmp <- sum(vot[v,part.67=="pan"]==-1) / sum(abs(vot[v,part.67=="pan"]))
    tmp <- ifelse (is.na(tmp)=="TRUE",0,tmp) 
    fortyplusnaypan[v] <- ifelse (tmp>=.4,1,0)
    }
fortyplusnayprd  <- rep(NA, nrow(vot))
for (v in 1:nrow(vot)){
    tmp <- sum(vot[v,part.67=="prd"]==-1) / sum(abs(vot[v,part.67=="prd"]))
    tmp <- ifelse (is.na(tmp)=="TRUE",0,tmp) 
    fortyplusnayprd[v] <- ifelse (tmp>=.4,1,0)
    }
#
rolls$win <- win
rolls$rollpan <- ifelse (win==1 & winpan==-1, 1, 0)  ## bill passed despite majority i party voted against
rolls$rollpri <- ifelse (win==1 & winpri==-1, 1, 0)
rolls$rollprd <- ifelse (win==1 & winprd==-1, 1, 0)
rolls$rollpvem <- ifelse (win==1 & winpvem==-1, 1, 0)
rolls$rollpanal <- ifelse (win==1 & winpanal==-1, 1, 0)
rolls$rollpsd <- ifelse (win==1 & winpsd==-1, 1, 0)
rolls$rollNprd <- ifelse (win==1 & winNprd==-1, 1, 0)
rolls$rollSprd <- ifelse (win==1 & winSprd==-1, 1, 0)
#
winside$win <- win
winside$rollpan <- ifelse (win==winpan, 1, 0)  ## majority of party on winning side
winside$rollpri <- ifelse (win==winpri, 1, 0)
winside$rollprd <- ifelse (win==winprd, 1, 0)
winside$rollpvem <- ifelse (win==winpvem, 1, 0)
winside$rollpanal <- ifelse (win==winpanal, 1, 0)
winside$rollpsd <- ifelse (win==winpsd, 1, 0)
#
fortyplus$win <- win
fortyplus$pan <- ifelse(win==1 & fortyplusnaypan==1, 1, 0) ## 40% or more voted nay, yet bill passed (large faction rolled)
fortyplus$prd <- ifelse(win==1 & fortyplusnayprd==1, 1, 0)
#
tmp <- rep(NA, nrow(rolls))
tmp2 <- tmp
for (i in 1:nrow(rolls)){
    tmp[i] <- min(rolls$favor[i], rolls$contra[i])
    }
for (i in 1:nrow(rolls)){
    tmp2[i] <- rolls$favor[i]+rolls$contra[i]
    }
tmp3<-tmp/tmp2
tmp3[rolls$dunan==0]
#
thrsh <- 0.1  ## SET THRESHOLD FOR VOTE TO BE "CONTESTED"
rolls$contested <- ifelse (rolls$dunan==1, 0, ifelse(tmp3<thrsh, 0, 1))
rice$contested <- ifelse (rice$dunan==1, 0, ifelse(tmp3<thrsh, 0, 1))
winside$contested <- ifelse (winside$dunan==1, 0, ifelse(tmp3<thrsh, 0, 1))
fortyplus$contested <- ifelse (fortyplus$dunan==1, 0, ifelse(tmp3<thrsh, 0, 1))

## RICE SCORES

mean(rice$prd[is.nan(rice$prd)=="FALSE"])
mean(rice$pan[is.nan(rice$pan)=="FALSE"])
mean(rice$pri[is.nan(rice$pri)=="FALSE"])
mean(rice$panal[is.nan(rice$panal)=="FALSE"])
mean(rice$pvem[is.nan(rice$pvem)=="FALSE"])

mean(rice$prd[is.nan(rice$prd)=="FALSE" & rice$dunan==0])
mean(rice$pan[is.nan(rice$pan)=="FALSE" & rice$dunan==0])
mean(rice$pri[is.nan(rice$pri)=="FALSE" & rice$dunan==0])
mean(rice$panal[is.nan(rice$panal)=="FALSE" & rice$dunan==0])
mean(rice$pvem[is.nan(rice$pvem)=="FALSE" & rice$dunan==0])

mean(rice$prd[is.nan(rice$prd)=="FALSE" & rice$dunan==0 & rice$contested==1])
mean(rice$pan[is.nan(rice$pan)=="FALSE" & rice$dunan==0 & rice$contested==1])
mean(rice$pri[is.nan(rice$pri)=="FALSE" & rice$dunan==0 & rice$contested==1])
mean(rice$panal[is.nan(rice$panal)=="FALSE" & rice$dunan==0 & rice$contested==1])
mean(rice$pvem[is.nan(rice$pvem)=="FALSE" & rice$dunan==0 & rice$contested==1])

## ROLL RATES

sum(rolls$rollprd)/length(rolls$folio)
sum(rolls$rollpan)/length(rolls$folio)
sum(rolls$rollpri)/length(rolls$folio)
sum(rolls$rollpanal)/length(rolls$folio)
sum(rolls$rollpvem)/length(rolls$folio)
sum(rolls$rollNprd)/length(rolls$folio)
sum(rolls$rollSprd)/length(rolls$folio)

sum(rolls$rollprd[rolls$dunan==0])/length(rolls$folio[rolls$dunan==0])
sum(rolls$rollpan[rolls$dunan==0])/length(rolls$folio[rolls$dunan==0])
sum(rolls$rollpri[rolls$dunan==0])/length(rolls$folio[rolls$dunan==0])
sum(rolls$rollpanal[rolls$dunan==0])/length(rolls$folio[rolls$dunan==0])
sum(rolls$rollpvem[rolls$dunan==0])/length(rolls$folio[rolls$dunan==0])
sum(rolls$rollNprd[rolls$dunan==0])/length(rolls$folio[rolls$dunan==0])
sum(rolls$rollSprd[rolls$dunan==0])/length(rolls$folio[rolls$dunan==0])

sum(rolls$rollprd[rolls$contested==1])/length(rolls$folio[rolls$contested==1])
sum(rolls$rollpan[rolls$contested==1])/length(rolls$folio[rolls$contested==1])
sum(rolls$rollpri[rolls$contested==1])/length(rolls$folio[rolls$contested==1])
sum(rolls$rollpanal[rolls$contested==1])/length(rolls$folio[rolls$contested==1])
sum(rolls$rollpvem[rolls$contested==1])/length(rolls$folio[rolls$contested==1])
sum(rolls$rollNprd[rolls$contested==1])/length(rolls$folio[rolls$contested==1])
sum(rolls$rollSprd[rolls$contested==1])/length(rolls$folio[rolls$contested==1])

## WIN SIDE

sum(winside$rollprd)/length(winside$folio)
sum(winside$rollpan)/length(winside$folio)
sum(winside$rollpri)/length(winside$folio)
sum(winside$rollpanal)/length(winside$folio)
sum(winside$rollpvem)/length(winside$folio)

sum(winside$rollprd[winside$dunan==0])/length(winside$folio[winside$dunan==0])
sum(winside$rollpan[winside$dunan==0])/length(winside$folio[winside$dunan==0])
sum(winside$rollpri[winside$dunan==0])/length(winside$folio[winside$dunan==0])
sum(winside$rollpanal[winside$dunan==0])/length(winside$folio[winside$dunan==0])
sum(winside$rollpvem[winside$dunan==0])/length(winside$folio[winside$dunan==0])

sum(winside$rollprd[winside$contested==1])/length(winside$folio[winside$contested==1])
sum(winside$rollpan[winside$contested==1])/length(winside$folio[winside$contested==1])
sum(winside$rollpri[winside$contested==1])/length(winside$folio[winside$contested==1])
sum(winside$rollpanal[winside$contested==1])/length(winside$folio[winside$contested==1])
sum(winside$rollpvem[winside$contested==1])/length(winside$folio[winside$contested==1])


## BIG FACTION ROLLED

sum(fortyplus$prd)/length(fortyplus$folio)
sum(fortyplus$pan)/length(fortyplus$folio)

sum(fortyplus$prd[fortyplus$dunan==0])/length(fortyplus$folio[fortyplus$dunan==0])
sum(fortyplus$pan[fortyplus$dunan==0])/length(fortyplus$folio[fortyplus$dunan==0])

sum(fortyplus$prd[fortyplus$contested==1])/length(fortyplus$folio[fortyplus$contested==1])
sum(fortyplus$pan[fortyplus$contested==1])/length(fortyplus$folio[fortyplus$contested==1])




##ESTIMATE DIMENSIONALITY (POOLE) (seems to require turning abstentions into nays... not sure this is dome correctly above because no distinction made of absences vs abstentions)
## STEP 1: AGREEMENT MATRIX
J <- 67
ag <- matrix(NA, nrow=J, ncol=J)
for (j in 1:J){
    for (jj in 1:J){
        one <- vot[,j]; two <- vot[,jj]
        tmp <- ifelse(one==two,1,0)
        ag[j,jj] <- sum(tmp)/length(tmp)
        }}
## STEP 2: SQUARED DISTANCES
sqd <- (1-ag)^2
## STEP 3: DOUBLE-CENTER THE MATRIX OF SQUARED DISTANCES
dc <- matrix(NA, nrow=J, ncol=J)
mm <- mean(sqd) ## matrix mean
for (r in 1:J){
    rm <- mean(sqd[r,]) ## row mean
    for (c in 1:J){
        cm <- mean(sqd[,c]) ## column mean
        dc[r,c] <- (sqd[r,c]-rm-cm+mm)/(-2)
        }}
#
ei <- eigen(dc, symmetric = TRUE, only.values = TRUE)[[1]]
#ei <- ei/sum(ei^2) ## Normalize eigenvalues
#
par(mar = c(5, 4.2, 2.1, 2.1) )
plot(ei[1:10], xlab="Dimension", ylab="Eigenvalue", main=c(""), axes=FALSE, ylim=c(0,max(ei)))
lines(ei[1:10])
box()
axis(side=1, at=c(1:10))
axis(side=2)
