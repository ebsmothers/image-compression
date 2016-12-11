function [ Reconstruction ] = Shrink( LargeReconstruction, a, b )
%Shrink: Removes padding originally added to image to perform DCT on 8x8
%blocks and convert to proper format for plotting

% a and b are the dimensions of the original image
Reconstruction = zeros(a,b,3);
for h = 1:a
    for j = 1:b    
        Reconstruction(h,j,:) = LargeReconstruction(h,j,:);
    end
end

end

