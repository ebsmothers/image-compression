function [ DCTCoefficients ] = DCTBlocks( blocks,m,n,p,q )
%DCTBlocks Apply DCT to each 8x8 block

DCTCoefficients = zeros(m,n,p,q);
for h = 1:p
    for j = 1:q
            DCTCoefficients(:,:,h,j) = dct2(blocks(:,:,h,j));
    end
end

end

