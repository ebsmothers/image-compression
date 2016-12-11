function [ ] = Plot( image, k )
% Display image, DCT, Haar, and DB9 reconstructions keeping k terms

[m,n,p] = size(PadImage(image));
q = m*n*p;

% Compress image using various methods (note the scaling)
DCT = JPEGAlgorithm(image,k);
DCT2 = JPEGAlgorithm2(image,q*k/64);
Haar = Wavelet2(image,q*k/64,2,'haar');
DB9 = Wavelet2(image,q*k/64,2,'db9');
Coif1 = Wavelet2(image,q*k/64,2,'coif1');

% Plot reconstructions with original image
figure(1)
image(1),subplot(2,3,1)
imagesc(image)
image(1),subplot(2,3,2)
imagesc(DCT)
image(1),subplot(2,3,3)
imagesc(DCT2)
image(1),subplot(2,3,4)
imagesc(Haar)
image(1),subplot(2,3,5)
imagesc(DB9)
image(1),subplot(2,3,6)
imagesc(Coif1)

% Plot residuals
figure(2)
image(2),subplot(2,3,1)
imagesc(image-image)
image(2),subplot(2,3,2)
imagesc(image-DCT)
image(2),subplot(2,3,3)
imagesc(image-DCT2)
image(2),subplot(2,3,4)
imagesc(image-Haar)
image(2),subplot(2,3,5)
imagesc(image-DB9)
image(2),subplot(2,3,6)
imagesc(image-Coif1)

end

