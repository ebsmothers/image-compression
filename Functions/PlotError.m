function [ ] = PlotError( image, k, increment )
%PlotError: Plot relative L2 error of DCT, Haar, db9, and coif1 approximations keeping up to
%k coefficients, where increment gives the stepsize.

% Find relative L2 error vectors for different methods of compression 
DCTError2 = L2Error2(image,k,increment);
HaarError = WaveletL2Error(image,k,increment,2,'haar');
db9Error = WaveletL2Error(image,k,increment,2,'db9');
coif1Error = WaveletL2Error(image,k,increment,2,'coif1');

% Plot results in the same window
figure(3),
plot(DCTError2)
hold on
plot(HaarError,'r')
hold on
plot(db9Error,'g')
hold on
plot(coif1Error,'k')
legend('DCT','Haar Wavelet', 'DB9 Wavelet','Coif1 Wavelet')

end

