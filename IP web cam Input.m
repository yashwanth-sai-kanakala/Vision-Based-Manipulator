
tic
f= imread('http://192.168.43.14:8080/photoaf.jpg');
b=imread('http://192.168.43.14:8080/photoaf.jpg');

while b==f
  b=snapshot(mycam);
end

toc
imshow(b)
