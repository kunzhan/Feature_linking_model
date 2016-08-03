%   The Wave demo code was written by Kun Zhan, Jicai Teng
%   $Revision: 1.0.0.0 $  $Date: 2014/03/09 $ 17:43:28 $

%   Reference:
%   K. Zhan, J. Shi, J. Teng, Q. Li and M. Wang,
%   Feature-linking model for image enhancement,
%   Neural Computation, vol. 28, no. 6, pp. 1072-1100, 2016.

close all;clc,clear
S = zeros(19);	Yv = S;
S(6:14,6:14) = [3 3 3 3 1 2 3 0 1;
                1 2 1 3 0 0 3 1 1;
                0 1 1 3 3 3 3 0 0;
                0 1 0 3 0 1 2 0 0;
                0 1 0 3 3 0 1 0 0;
                0 2 2 1 3 3 1 1 1;
                0 1 1 0 1 3 3 0 0;
                0 1 0 1 0 1 3 3 3;
                0 1 0 2 0 1 2 0 3;];
Yv(10,10) = 1;	Yu = Yv;
W = [0.1 1 0.1; 
     1   1  1; 
     0.1 1 0.1];
Theta = 0.05;
N = 8;
for n = 1:N
    U =  0.7.*conv2(Yu,W,'same');
    V =  0.0172*S.*conv2(Yv,W,'same');
    Yu = double(U > Theta); 
    Yv = double(V > Theta);
    subplot(2,N,n),imshow(Yu,[],'InitialMagnification','fit');
    subplot(2,N,n+N),imshow(Yv,[],'InitialMagnification','fit');
end