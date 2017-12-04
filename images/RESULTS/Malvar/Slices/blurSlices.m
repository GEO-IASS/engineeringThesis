names={'428.428','466.637','508.867','549.087','589.307','627.516','669.746','709.966','750.186','790.406','830.625','870.845','911.065','951.284'};

for i=1:size(names,2)
	I = imread(strcat(names{i},'.png'));
	H = fspecial('gaussian',[5 5],2);
	G = imfilter(I,H,'replicate');
	imwrite(G,strcat('./blur/',names{i},'.png'));
	s = imsharpen(G,'Radius',2,'Amount',1.2);
	imwrite(s,strcat('./blur/sharpened/',names{i},'.png'))
end	
