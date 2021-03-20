clc;
p=imread('C:\Users\yashw\Desktop\revive.png');
imshow(p)
I= rgb2gray(p);
I=imbinarize(I,0.5);
I=1-I;
I=imfill(I,'holes');
I = imclose(I,strel('disk',5));

%I=bwlabel(I);
imtool(I);
I=logical(I);
vislabels(I);
f=regionprops(I,'AREA','Perimeter','centroid','Extrema');

hold on
for k = 1:numel(f)
    x(1,k)=f(k).Centroid(1)-f(1).Centroid(1);
    y(1,k)=f(k).Centroid(2)-f(1).Centroid(2);
    plot(f(k).Centroid(1),f(k).Centroid(2),'b*');
    
end
hold off

for k = 1:numel(f)
a=f(k).Area;
p=f(k).Perimeter;
r(1,k) = ((p .^2 )./ (4*(pi*a)));
end

