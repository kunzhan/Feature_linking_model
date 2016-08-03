function Iv = rgb2v(I)
%   The function was written by Jicai Teng, Jinhui Shi, Kun Zhan
%   $Revision: 1.0.0.0 $  $Date: 2014/12/11 $ 19:20:56 $

%   Reference:
%   K. Zhan, J. Shi, J. Teng, Q. Li and M. Wang,
%   "Feature-linking model for image enhancement," 
%   Neural Computation, vol. 28, no. 6, pp. 1072-1100, 2016.

I = uint8(I);
[~,~,hei] = size(I);
if hei == 1
    Iv = I;
else
    hsv = rgb2hsv(I);
    V = hsv(:,:,3);
    Iv = uint8(V .* 255);
end