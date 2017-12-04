pattern=fullfile('*.png');
pngFiles = dir(pattern);
if length(pngFiles)>0
    %ImgExample=imread(pngFiles(1).name);
    [M,N,D]=size(imread(pngFiles(1).name));
    CUBE3d = zeros(M,N,length(pngFiles));
    CUBE2d = zeros(M*N,2);%length(pngFiles));

    for i = 1:2%length(pngFiles)
        fprintf(pngFiles(i).name)
        fprintf('\n');
        I=imread(pngFiles(i).name);
        Id=im2double(I);
        Ig=rgb2gray(Id);
        CUBE3d(:,:,i)=Ig;
        CUBE2d(:,i)=Ig(:)';%'
        
    end
    save 'CUBECut.mat' CUBE3d CUBE2d
else
    fprintf(strcat('No "',pattern,'" files found.\n'))
end


%{
pngFiles = dir(fullfile('*.png'));
%images=cells(172,174,length(pngFiles),'uint8');

M=172;
N=174;
CUBE = zeros(M,N,length(pngFiles));

for i = 1:2%length(pngFiles)
    fprintf(pngFiles(i).name)
    fprintf('\n');
    %images(:,:,i)=rgb2gray(imread(pngFiles(i).name));

    temp=double(imread(pngFiles(i).name));     
    CUBE(:,:,i) = rgb2gray(temp);
    imagesc(CUBE(:,:,i)); 
    colormap('gray') 
    drawnow 

end
%myImageS = cat(3,I);
%}