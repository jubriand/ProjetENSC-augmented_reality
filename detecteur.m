function [ Test ] = detecteur( I,sigma )
%DETECTEUR Summary of this function goes here
%   Detailed explanation goes here

lambda=0.05;

[X,Y]=meshgrid(floor(-(3*sigma)): ceil( 3*sigma));


G=1/(2*pi*sigma^2)*exp(-(X.^2+Y.^2)./(2*sigma^2));
Gx=-X./(2*pi*sigma^4)*exp(-(X.^2+Y.^2)./(2*sigma^2));
Gy=-Y./(2*pi*sigma^4)*exp(-(X.^2+Y.^2)./(2*sigma^2));

Ix=conv2(I,Gx);
Iy=conv2(I,Gy);


Cxy=conv2(Ix.*Iy,G);

Cxx=conv2((Ix.*Ix),G);
Cyy=conv2((Iy.*Iy),G);

Test=Cxx.*Cyy-Cxy.*Cxy-lambda*(Cxx+Cyy).^2;

end

