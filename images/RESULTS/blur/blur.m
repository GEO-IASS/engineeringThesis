I=imread('original.png');
H = fspecial('gaussian',[5 5],2);
G = imfilter(I,H,'replicate');
imwrite(G,'blurOriginal.png');

b = imsharpen(G,'Radius',2,'Amount',1.2);
imwrite(b,'sharpenedOriginal.png')