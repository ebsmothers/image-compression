function [ ErrorVec ] = L2Error( image, k )
%L2Error: Compute and plot relative L^2 error of reconstructions up to
%first k coefficients

% First part of JPEG algorithm (not dependent on number of terms kept)
[paddedimage,a,b] = PadImage( image );
[blocks, tempm, tempn] = ImageSplit( paddedimage );
[m,n,p,q] = size(blocks);
DCTCoefficients = DCTBlocks( blocks,m,n,p,q );

% Reshape image and recast as a vector of doubles (for norm calculations)
ImageVec = double(reshape(image,1,3*a*b));

% Vector representing relative L2 error for each index
ErrorVec = zeros(1,k);
for h = 1:k
    ReducedDCTCoefficients = TopCoefficients( DCTCoefficients, h,m,n,p,q );
    LargeReconstruction = InverseDCT( ReducedDCTCoefficients, tempm, tempn,m,n,p,q);
    Reconstruction = Shrink(LargeReconstruction,a,b);
    
    % Reshape and recast reconstruction as well
    ReconstructionVec = double(reshape(Reconstruction,1,3*a*b));
    
    % Compute difference between 
    Error = ImageVec - ReconstructionVec;
    
    % Populate ErrorVec with relative L2 error
    ErrorVec(h) = norm(Error)/norm(ImageVec);
end

% Plot results
image(1)
plot(ErrorVec)



end

