clear all; close all; clc;
configurations();

%==================================================
% Take the CUBE cut
%==================================================
%cd(foldOutName);
tmpName     = 'CUBECut.mat';
enviroment  = load(tmpName);
X           = enviroment.CUBE;
clear('enviroment');
%cd('../../');

%==================================================
% Noise estimation algorithm
%==================================================
%Z           = X';
Z=transpose(X);
clear('X', 'imgOutput', 'imgInput');
Rg          = (Z'*Z);
Rp          = inv(Rg);
[N,L]       = size(Z);
E           = zeros(N,L);
for i=1:1:L
    %Obtaine the R matrix segments A, b, c an b'
    Ac      = [ Rp(:,1:(i-1)), Rp(:,(i+1):L) ];
    A       = [ Ac(1:(i-1),:) ; Ac((i+1):L,:) ];
    b       = [ Rp(1:(i-1),i) ; Rp((i+1):L,i) ];    
    bg      = [ Rg(1:(i-1),i) ; Rg((i+1):L,i) ];    
    c       = Rp(i,i);
    Bi      = ( (A-(b*b'))/c ) * bg;
    Zp      = [Z(:,1:i-1), Z(:,(i+1):L)];
    zi      = Z(:,i);
    E(:,i)  = zi - (Zp*Bi);
end

%==================================================
% Save Noise Matrix
%==================================================
cd(foldOutName);
tmpName     = './variables/NoiseMatriz.mat';
%save(tmpName, 'E', '-v7.3');
save(tmpName, 'E');
cd(foldMatlabHome);
