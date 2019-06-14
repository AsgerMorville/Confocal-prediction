#simulate in 3d
## input: 
##  antal = number of synapses
##  maks = 3d vector of limits of window
## grid = 3d vector of grid (eg. c(120,120,15))
##  bw = bandwidth
##  r= radius
#number of synapses

#simulate in window: 6.84 x 6.84 x 2.10
checkfct <- function(point,dff,r){
  if ((nrow(dff)==0)) {return(TRUE)}
  tempdf <- t(t(dff)-point) 
  dist <- numeric(nrow(dff))
  dist <- apply(tempdf,c(1),function(x) sqrt(x[1]^2+x[2]^2+x[3]^2))
  viol <- (dist < r)
  s <- sum(viol)
  if ((s > 0)){return(FALSE)}
  return(TRUE)
}
smallSim3d <- function(antal,maks,grid,bw){
  points <- matrix(NA,nrow=0,ncol=3)
  points <- as.data.frame(points)
  #First point 
  point <- runif(3,max=maks)
  points[1,]<- point
  for (k in 2:antal){
    #Simulate point
    point <- runif(3,max=maks)
    #Simulate radius
    r <- rlnorm(1, meanlog = 5.828, sdlog = 0.446)/1000
    #Check if too close to other points
    while (checkfct(point,dff=points,r) == FALSE){
      point <- runif(3,max=maks)
      r <- rlnorm(1, meanlog = 5.828, sdlog = 0.446)/1000
    }
    points[k,] <- point
  }
  zz <- kde3d(points[,1], points[,2],  points[,3],
              h=bw, n = grid, lims = c(c(0,maks[1]), c(0,maks[2]),c(0,maks[3])))
  zz$d <- antal*zz$d
  return(list(points=points,z=zz))
}
