
Total = 100;
load('testarr2');
A = A/maks;
A = A*256;
count = 0;
gridd = 120;
options.overwrite = true;
endmat = zeros(120,(Total*gridd),15);
for j=1:Total
    %Extract image
    im = A(1:gridd,(count*gridd+1):((count+1)*gridd),1:15);
    saveastiff(uint8(im),'A.tif',options);

    truth.img='A.tif';
    truth.pix=[57 57 140];

    %% Parameters for ConfocalGN
    conf.pix=[57 57 140];
    conf.psf=[78 78 294];
    sample='sampp.tif';
    [res,truth,sample]=confocal_generator(truth,conf,sample);
    endmat(1:gridd,(count*gridd+1):((count+1)*gridd),1:15) = res.stack;
    count = count+1;
    fprintf('%d ',j); 
end

endmat3 = mean(endmat,3);
