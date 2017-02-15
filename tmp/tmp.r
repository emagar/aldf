# PREPARES STATIC ESTIMATES FOR DESCRIPTION AND GRAPHING
attach.bugs(aldf.66)
## 45-DEGREE CLOCKWISE ROTATION OF COORDINATES (SO THAT PRIORS REMAIN n, s, e, w)
xR <- x*cos(pi/4) + y*sin(pi/4)
yR <- -x*sin(pi/4) + y*cos(pi/4)
x <- xR; y <- yR;

jotas <- data.frame(NA, nrow=J, ncol=6)
for (j in 1:J){
    jotas[j,1] <- quantile (x[,j], 0.025, names=F)
    jotas[j,2] <- quantile (x[,j], 0.50, names=F)
    jotas[j,3] <- quantile (x[,j], 0.975, names=F)
    jotas[j,4] <- quantile (y[,j], 0.025, names=F)
    jotas[j,5] <- quantile (y[,j], 0.50, names=F)
    jotas[j,6] <- quantile (y[,j], 0.975, names=F)
    }

a <- -beta / delta ## pendiente cutline
b <- alpha / delta ## constante cutline
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


### TO RESET GRAPH PARAMETERS SAY par(oldpar) ###
oldpar <- par(no.readonly=TRUE)

par(mfrow=c(3,3))
par("pin" = c(.63,.58)) #width and height of plot region in inches

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
t <- 1
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
