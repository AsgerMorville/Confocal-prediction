source("load/functions.R")
source("Simulation/dogBlur.R")
im2 <- dogBlur(image,sigm=1.6,k=sqrt(2))
hist(im2,breaks=30)
rim2 <- dogBlur(Img_max,sigm=1.6,k=sqrt(2))
hist(rim2,breaks=40)
image(im2,asp=1)
im22 <- im(mat=im2)
##Obtain params from train data
gridd <- 120
train_data <- readMat("Confocal/train_noise_1.mat")
maksi <- max(train_data$ar)
train_data$ar <- train_data$ar/maksi
image(im2[1:137,1:137],asp=1)
image <- apply(train_data$ar,c(1,2),max)
mean(image)
mean(Img_max)
hist(image)
hist(Img_max)
image(x=end$x,y=end$y, (im2),asp=1)
?image
image(image,asp=1)
points(coord[,1],coord[,2])
#Get params
Im <- im(mat=t(im2),xcol=end$x,yrow=end$y)

ps <- ppp(x= coord[,1], y = coord[,2],xrange=c(0,68.4),yrange=c(0,68.4))
model1 <- ppm(ps ~ Im, interaction = Poisson)
predict(model1,type="count")

int <- model1$coef[1]
s1 <- model1$coef[2]
p1 <- apply(Im$v,c(1,2),function(x){exp(int+s1*x)})
sum(p1*0.054*0.054)

p2 <- apply(rim2,c(1,2),function(x){exp(int+s1*x)})
sum(p2*0.057*0.057)
model1
plot(Im)
params <- matrix(NA,ncol=2,nrow=100)
count <- 0
for (j in 1:10){
  for (i in 1:10){
    ps <- ppp(x = coord[,1], y = coord[,2], xrange = c(((j-1)*6.84),(j*6.84)), yrange = c(((i-1)*6.84),(i*6.84)))
    model1 <- ppm(ps ~ Im, interaction = Poisson)
    count <- count+1
    params[count,] <- model1$coef
  }
}


plot(params[,1])


densityEst <-  apply(image, c(1,2), function(x){exp(int+0.0351*x)})
vgatpred[1,3] <- (sum(densityEst*0.057*0.057))