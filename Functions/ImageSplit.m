function [blocks,tempm,tempn] = ImageSplit(paddedimage)
%ImageSplit Break image up into 8x8 blocks

% Find size of padded image, return for later use
[tempm,tempn,p] = size(paddedimage);

blocks = reshape(paddedimage,8,8,p,tempm*tempn/64);

end