clear all; close all; clc;
A = imread('img.png','png');
size(A)
Abw = rgb2gray(A);
size(Abw)

imshow(Abw);

A2=double(Abw);
[nx,ny] = size(A2)

noise = 50;
An = A2 + noise * randn(nx,ny);
Ani = uint8(An);
imshow(Ani);
x = linspace(0,1,nx); 
y = linspace(0,1,ny); 
dx = x(2) - x(1);
dy = y(2) - y(1);

onex = ones(nx,1);
oney = ones(ny,1);
Dx = spdiags( [ onex -2*onex onex ],[ -1 0 1 ],nx,nx );
Dy = spdiags( [ oney -2*oney oney ],[ -1 0 1 ],ny,ny );
Ix = eye(nx); Iy = eye(ny);
L = kron(Iy,Dx)+kron(Dy,Ix);
tspan=[ 0 0.006 0.008 0.01];
An2 = reshape(An, nx*ny,1);
D=100;
[ t, usol ] = ode45( @zoo_rhs, tspan, An2, [], L, D);

for j=1:length(tspan)
  Atemp = uint8(reshape(usol(j,:),nx,ny));
  subplot(2,2,j), imshow(Atemp);
end


 



