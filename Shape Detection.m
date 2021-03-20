%% read in image
imread('C:\Users\yashw\Desktop\revive.png');
imshow(i);
%% RGB colour space
rmat=i(:,:,1);
gmat=i(:,:,2);
bmat=i(:,:,3);
figure;
subplot(2,2,1),imshow(rmat);
title('red plane');
subplot(2,2,2),imshow(gmat);
title('green plane');
subplot(2,2,3),imshow(bmat);
title('blue plane');
subplot(2,2,4),imshow(i);
title('original plane');
%%
levelr=0.623;
levelg=0.5;
levelb=0.4;
i1=im2bw(rmat,levelr);
i2=im2bw(gmat,levelg);
i3=im2bw(bmat,levelb);
isum=(i1&i2&i3);

%plot the data
subplot(2,2,1),imshow(i1);
title('red plane');
subplot(2,2,2),imshow(i2);
title('green plane');
subplot(2,2,3),imshow(i3);
title('blue plane');
subplot(2,2,4),imshow(isum);
title('sum of all planes');
%% complement image and fill in holes
icomp=imcomplement(isum);
ifilled=imfill(icomp,'holes');
figure;
imshow(ifilled);
%%
%se=strel('disk',0);
%iopenned=imopen(ifilled,se);
%figure;
%imshowpair(iopenned,i);
%imshow(iopenned);
%% extract features
iregion=regionprops(ifilled,'centroid');
[labeled,numObjects]=bwlabel(ifilled,4)
stats=regionprops(labeled,'eccentricity','area');
areas=[stats.area]
eccentricities=[stats.eccentricity];
%% use feature anlysis to count skittles and objects
idxOfskittles=find(eccentricities);
statsDefects=stats(idxOfskittles);
figure, imshow(i);
hold on;
for idx=1 : length(idxOfskittles)
    h=rectangle('position',statsDefects(idx).boundries);
    set(h,'edgeColour',[0.75 0 0]);
    hold on;
end
if idx>10
    title(['there are ',num2str(numObjects),'objects in ');
end 
hold off;

