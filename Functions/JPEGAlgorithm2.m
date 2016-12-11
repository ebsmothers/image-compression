function [ Reconstruction ] = JPEGAlgorithm2( image,k )
%JPEGAlgorithm2: Alternative way of compressing image using DCT

% Reshape image into a single long vector
[m,n,p] = size(image);
imagevec = reshape(image,1,m*n*p);

% Pad vector so its length is divisible by 64
if rem(m*n*p,64) ~= 0
    paddedimagevec = padarray(imagevec,[0 64-rem(m*n*p,64)],'post');
else
    paddedimagevec = imagevec;
end

q = length(paddedimagevec);
r = q/64;

% Apply 2D DCT to each subvector of length 64, by reshaping to an 8x8
% matrix, then reshaping the result to a vector again
dctcoefficients = zeros(1,q);
for h = 1:r
    dctcoefficients(64*(h-1)+1:64*h) = reshape(dct2(reshape(paddedimagevec(64*(h-1)+1:64*h),8,8)),1,64);
end

% Find indices of elements sorted by absolute value
[~,SortIndices] = sort(abs(dctcoefficients));

reduceddctcoefficients = zeros(1,q);

% Fill zero vector with k largest magnitude coefficients using SortIndices
% vector
reduceddctcoefficients(SortIndices(q+1-k:q)) = dctcoefficients(SortIndices(q+1-k:q));

% Apply inverse DCT to each subvector of length 64, again reshaping as
% appropriate.
largereconstructionvec = zeros(1,q);
for c = 1:r
    largereconstructionvec(64*(c-1)+1:64*c) = reshape(idct2(reshape(reduceddctcoefficients(64*(c-1)+1:64*c),8,8)),1,64);
end

% Shrink vector back to its original size
reconstructionvec = zeros(1,m*n*p);
reconstructionvec(1:m*n*p) = largereconstructionvec(1:m*n*p);

Reconstruction = uint8(reshape(reconstructionvec,m,n,p));

% Display reconstruction
image(1)
imagesc(Reconstruction)     


end

