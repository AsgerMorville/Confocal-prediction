source("load/functions.R")
total <- 10
gridd=120
kasser <- 10
coord <- matrix(NA,nrow=0,ncol=3)
coord <- as.data.frame(coord)
test <- array(NA,c(1200,1200,15))
count2 <- 0
count9 <- 1
nos <-seq(from=10,to=210,length.out=100)

for (j in 1:total){
  arr <- array(NA,dim=c(gridd,kasser*gridd,15))
  liste <- list()
  for (i in 1:kasser){
    no <- 
    liste[[i]] <- smallSim3d(antal =nos[count9] ,maks = c(6.84,6.84,2.10),grid = c(gridd,gridd,15),bw = 0.19)
    print(i)
    count9 <- count9+1
  }
  (print("ha"))
  for (i in 1:kasser){
    liste[[i]]$points$V2 <- liste[[i]]$points$V2 + 6.84*(i-1)
    liste[[i]]$points$V1 <- liste[[i]]$points$V1 + 6.84*(j-1)
  }
  for (i in 1:kasser){
    coord <- rbind(coord,liste[[i]]$points)
  }
  
  
  count <- 0
  for (i in 1:kasser){
    arr[1:gridd,(count*gridd+1):((count+1)*gridd),] <- liste[[i]]$z$d
    count <- count+1
  }
  test[(count2*gridd+1):((count2+1)*gridd),,] <- arr
  count2 <- count2 + 1
  print(j)
}

end <- kde3d(x=coord[,1],y=coord[,2],z=coord[,3],h = 0.19,n = c(1200,1200,15),lims=c(c(0,68.4),c(0,68.4),c(0,2.1)))
end$d <- nrow(coord)*end$d
writeMat("Confocal/a_trainpoints.mat",A=end$d)



