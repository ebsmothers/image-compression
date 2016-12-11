function [ Reconstruction ] = Wavelet2( image, k, N, WaveletType )
%Wavelet: Apply 2D DWT using WaveletType wavelet with N levels, keeping highest k
%coefficients, then apply inverse 2D DWT

[m,n,p] = size(image);
q = m*n*p;
% Compute N-level wavelet decomposition of image using WaveletType
[CoefficientsVec,Bookkeeping] = wavedec2(image,N,WaveletType);

% Call function to keep highest k coefficients
ReducedCoefficientsVec = Reduce2(CoefficientsVec,k);

% Reconstruct image from simplified coefficients
LargeReconstructionVec = waverec2(ReducedCoefficientsVec,Bookkeeping,WaveletType);

ReconstructionVec = zeros(1,q);

% Shrink reconstruction vector as appropriate
ReconstructionVec(1:q) = LargeReconstructionVec(1:q);

% Reshape and recast vector to display image
Reconstruction = uint8(reshape(ReconstructionVec,m,n,p));

% Plot results
image(1),subplot(2,1,1)
colormap(gray)
imagesc(image)
image(1),subplot(2,1,2)
colormap(gray)
imagesc(Reconstruction)

end

