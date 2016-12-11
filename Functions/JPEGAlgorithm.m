function [ Reconstruction ] = JPEGAlgorithm( image, k )
%JPEGAlgorithm: Run JPEG algorithm on a given image, then reconstruct image
%and display the result

[paddedimage,a,b] = PadImage( image );
[blocks, tempm, tempn] = ImageSplit( paddedimage );

% Find dimensions of array of 8x8 blocks
[m,n,p,q] = size(blocks);

DCTCoefficients = DCTBlocks( blocks,m,n,p,q );
ReducedDCTCoefficients = TopCoefficients( DCTCoefficients, k,m,n,p,q );

LargeReconstruction = InverseDCT( ReducedDCTCoefficients, tempm, tempn,m,n,p,q);
Reconstruction = uint8(Shrink(LargeReconstruction,a,b));

% Display image and reconstruction
image(1),subplot(1,2,1)
colormap(gray)
imagesc(image)
image(2),subplot(1,2,2)
colormap(gray)
imagesc(Reconstruction)

end