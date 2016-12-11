function [ RelativeL2Error ] = WaveletL2Error( image, k, increment, N, WaveletType )
%Compute and plot relative L2 Error of a particular image using dwt2 with
%WaveletType wavelet keeping up to the first k terms

[m,n,p] = size(image);

% Determine how many iterations are necessary
j = k/increment;

% Reshape and recast image (for norm calculations)
ImageVec = double(reshape(image,1,m*n*p));

% Create vector to store relative L2 error data
RelativeL2Error = zeros(1,j);
for h = 1:j
    Reconstruction = Wavelet2(image,increment*h,N,WaveletType);
    
    % Reshape and recast reconstruction as well
    ReconstructionVec = double(reshape(Reconstruction,1,m*n*p));
    
    % Compute difference
    ErrorVec = ReconstructionVec - ImageVec;
    
    % Find relative L2 error, populate vector
    RelativeL2Error(h) = norm(ErrorVec)/norm(ImageVec);
end

% Plot results
image(1)
plot(RelativeL2Error);
    

end

