otsu <- function(img){
  #img <- img/max(img)  # assuming img is a numeric matrix or vector
  
  range = c(0, 1)  # assuming values in the matrix range from 0 to 1
  levels = 256L
  breaks = seq(range[1], range[2], length.out = levels + 1)
  
  h = hist.default(img, plot = FALSE)
  counts = as.double(h$counts)
  mids = as.double(h$mids)
  len = length(counts)
  w1 = cumsum(counts)
  w2 = w1[len] + counts - w1
  cm = counts * mids
  m1 = cumsum(cm)
  m2 = m1[len] + cm - m1
  var = w1 * w2 * (m2/w2 - m1/w1)^2
  maxi = which(var == max(var, na.rm = TRUE))
  thresh<-(mids[maxi[1]] + mids[maxi[length(maxi)]])/2
  
  
  M3 <- img 
  M3[img < thresh] <- 0 
  return(M3)
}
