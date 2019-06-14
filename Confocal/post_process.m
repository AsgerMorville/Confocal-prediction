%post process

endd = max(stacks,[],3);
write(B, '.tif');
obj = Tiff('hej.tiff','w')