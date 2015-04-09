url='http://192.168.43.5:8080/shot.jpg';
ss=imread(url);
fh=image(ss);
 i=0;
while(i<5)
    ss=imread(url);
    set(fh,'CData',ss);
    drawnow;
    i=i+1;
   
end
