%write tiff
t = Tiff('hej.tif','w');
tagstruct.ImageLength = size(Y,1); 
tagstruct.ImageWidth = size(Y,2);
tagstruct.Compression = 1;

%tagstruct.Photometric = Tiff.Photometric.Y;
tagstruct.BitsPerSample = 8;
tagstruct.SamplesPerPixel = 1;
tagstruct.PlanarConfiguration = Tiff.PlanarConfiguration.Chunky; 
tagstruct.RowsPerStrip = 1;
tagstruct.Software = 'MATLAB';
setTag(t,tagstruct)
write(t,A2);