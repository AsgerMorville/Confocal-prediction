# Confocal-prediction
Generate a ground truth image by running a_1_generate_train.R. Make sure all packages are properly loaded. The file will try to save the resulting ground truth-stack as a matlab-file. Add noise by first running startup inside confocal folder. Then run  train_noise_1, this will save the image as a matlab-file. The resulting matlab-file (which is a 3d array of points) can be loaded by R using the R.matlab package (readmat-function)


