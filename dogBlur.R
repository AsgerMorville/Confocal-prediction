#Blur function
dogBlur <- function(img,sigm,k){
  gridd1 <- dim(img)[1]
  gridd2 <- dim(img)[2]
  imgg <- im(as.matrix(img),1:gridd2,1:gridd1)
  #sigm <- 1.6
  #k <- sqrt(2)
  blur1 <- blur(imgg,sigma=0.7*sigm)
  blur2 <- blur(imgg,sigma=sigm)
  blur3 <- blur(imgg,sigma=k*sigm)
  blur4 <-  blur(imgg,sigma=k^2*sigm)
  blur5 <- blur(imgg,sigma=k^3*sigm)
  blur6 <- blur(imgg,sigma=k^4*sigm)
  blur7 <- blur(imgg,sigma=k^5*sigm)
  blur8 <- blur(imgg,sigma=k^6*sigm)
  pics <- array(NA,dim=c(gridd1,gridd2,8))
  pics[,,1] <- blur1$v
  pics[,,2] <- blur2$v
  pics[,,3] <- blur3$v
  pics[,,4] <- blur4$v
  pics[,,5] <- blur5$v
  pics[,,6] <- blur6$v
  pics[,,7] <- blur7$v
  pics[,,8] <- blur8$v
  
  pyr <- array(NA,dim=c(gridd1,gridd2,7))
  
  
  for (i in 1:7){
    pyr[,,i] <- pics[,,i+1]-pics[,,i]
  }
  
  end <- apply(-pyr,c(1,2),max)
  return(end)
}
