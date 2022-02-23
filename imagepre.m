load('Target.mat');
load('Input.mat');

abn=(Target==1);
norm=~abn;
abn_data=Data(:,:,abn);
norm_data=Data(:,:,norm);
n=length(abn_data(1,1,:));
for i=1:n
    I=abn_data(:,:,i);
    img=imresize(I,[227,227]);
    [rows,cols]=size(img);
 r=zeros(rows,cols);
 g=zeros(rows,cols);
 b=zeros(rows,cols);
 r=double(img);
 g=double(img);
 b=double(img);
 rgb=cat(3,r,g,b);
    s=strcat('.\image\abnormal\',num2str(i),'.JPG');
    imwrite(uint8(rgb),s);
end

n=length(norm_data(1,1,:));
for i=1:n
    I=norm_data(:,:,i);
    img=imresize(I,[227,227]);
    [rows,cols]=size(img);
 r=zeros(rows,cols);
 g=zeros(rows,cols);
 b=zeros(rows,cols);
 r=double(img);
 g=double(img);
 b=double(img);
 rgb=cat(3,r,g,b);
    s=strcat('.\image\normal\',num2str(i),'.JPG');
    imwrite(uint8(rgb),s);
end