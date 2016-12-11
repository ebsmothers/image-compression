function [ LargeReconstruction ] = InverseDCT( ReducedDCTCoefficients, tempm, tempn,m,n,p,q )
%InverseDCT: Apply inverse DCT to reconstruct original image

BlockReconstruction = zeros(m,n,p,q);

for h = 1:p
    for j = 1:q
        BlockReconstruction(:,:,h,j) = idct2(ReducedDCTCoefficients(:,:,h,j));
    end
end
 

LargeReconstruction = reshape(BlockReconstruction,tempm,tempn,p);

end

