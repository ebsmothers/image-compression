function [ RelativeL2Error ] = L2Error2( image, k, increment )
%L2Error2: Compute relative L2 error keeping up to first k terms with
%JPEGAlgorithm2 method

[m,n,p] = size(image);
j = k/increment;

% Reshape and recast image as double vector (for norm calculation)
ImageVec = double(reshape(image,1,m*n*p));

% Create relative L2 error vector
RelativeL2Error = zeros(1,j);
for h = 1:j
    Reconstruction = JPEGAlgorithm2(image,increment*h);
    
    % Reshape and recast reconstruction as well
    ReconstructionVec = double(reshape(Reconstruction,1,m*n*p));
    
    % Compute error
    ErrorVec = ReconstructionVec - ImageVec;
    
    % Compute relate L2 error and populate vector as appropriate
    RelativeL2Error(h) = norm(ErrorVec)/norm(ImageVec);
end

% Plot results
image(1)
plot(RelativeL2Error,'r');


end

