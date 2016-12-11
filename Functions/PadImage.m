function [ paddedimage, a , b ] = PadImage( image )
%PadImage Add white space to image so it can be divided into 8x8 blocks

% Save dimensions of original image for future use
[a,b,~] = size( image );

% Check to see if number rows, columns, or both are divisible by 8.  If
% not, pad appropriately.
if rem(a,8) == 0 && rem(b,8) == 0
   paddedimage = image;
elseif rem(a,8) == 0
   padvec = [0, 8 - rem(b,8), 0];
   paddedimage = padarray(image,padvec,'post');
elseif rem(b,8) == 0
   padvec = [8 - rem(a,8), 0, 0];
   paddedimage = padarray(image,padvec,'post');
else 
   padvec = [8 - rem(a,8), 8 - rem(b,8), 0];
   paddedimage = padarray(image,padvec,'post');
end
end

