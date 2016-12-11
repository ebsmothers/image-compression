# image_compression
Image compression experiments in MATLAB

Functions: contains all MATLAB scripts necessary for image compression algorithms.  Functions require an image imported as a 3D array (pixels x RGB). 

Examples: Experiments on four test images.  Each image folder contains: original image,  compressed image and residuals for each choice of algorithm, and plots of relative L2 error for different algorithms as a function of number of modes eliminated.

Within functions:

#Basic Algorithms

  JPEGAlgorithm: Compresses image using 2D discrete cosine transform.  Compression performed on 8x8 blocks.  Calls functions: PadImage.m, ImageSplit.m, DCTBlocks.m, TopCoefficients.m, InverseDCT.m, Shrink.m.  Input: image array and number of elements to keep per 8x8 block (smaller k = greater compression ratio)
  
  JPEGAlgorithm2: Compresses image using 2D discrete cosine transform.  Compression performed by individual entries.  Function is self-contained.  Input: image array and number of elements to keep in each full 2D array.
  
  Wavelet2: Compresses image using wavelet transforms.  Compression performed by individual entries.  Input: same as JPEGAlgorithm2 plus number of levels and wavelet name. 
  
  NOTE: Due to the different methods of selective data retention, the k input to JPEGAlgorithm has a different meaning than the k input for JPEGAlgorithm2 and Wavelet2.  In particular, the input to the latter functions should be k' = (m*n*p/64) * k, where k is the number of coefficients per block in JPEGAlgorithm, and [m,n,p] = size(PadImage(image)).
  
#Error Plotting Functions

  L2Error: Plots relative L2 error for JPEGAlgorithm.  Calls functions from JPEGAlgorithm.  Input: same as JPEGAlgorithm.

  L2Error2: Plots relative L2 error for JPEGAlgorithm2.  Calls JPEGAlgorithm2.  Input: same as JPEGAlgorithm2 plus stepsize to increase k in each plotting iteration.
  
  WaveletL2Error: Plots relative L2 error for Wavelet2.  Calls Wavelet2.  Input: same as Wavelet2 plus stepsize (as in L2Error2).
  
#Image Reconstruction Plotting Functions

 Plot: display image with various compression reconstructions as well as residuals.  Calls functions: JPEGAlgorithm, JPEGAlgorithm2, Wavelet2.  Input: image array and choice of k
 
 PlotError: display L2 error as function of k for various image compression algorithms.  Calls functions: L2Error2, WaveletL2Error.  Input: same as L2Error2.
