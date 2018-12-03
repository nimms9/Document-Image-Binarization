function [bik,bil,I]=fcontrast(img)
img=imread(img);
[a,b,c]=size(img);
if c==3
img=rgb2gray(img);
end
I=img;
y=2^-10;
ap=std2(img);
img=double(img);
be=((ap)/128)^y;
[a,b]=size(img);
c=zeros(a,b);
c1=zeros(a,b);
tmp=zeros(3,3);
pk=zeros(a,b);
% mean=zeros(a,b);
% %%mean filter
% for i=1:a-2
%     for j=1:b-2
%         s=0;
%         for i1=0:2
%             for j1=0:2
%                 tmp(i1+1,j1+1)=img(i+i1,j+j1);
%                 s=s+tmp(i1+1,j1+1);
%             end
%         end
%         mean(i+1,j+1)=double(s/9);
%     end
% end  
% for i=1:a
%     for j=1:b
%         img(i,j)=mean(i,j);
%     end
% end
for i=1:a-2
    for j=1:b-2
        for i1=0:2
            for j1=0:2
                tmp(i1+1,j1+1)=img(i+i1,j+j1);
            end
        end
        large=0;
        small=257;
        for i1=1:3
            for j1=1:3
                if large<tmp(i1,j1)
                    large=tmp(i1,j1);
                end
                if small>tmp(i1,j1)
                    small=tmp(i1,j1);
                end
            end
        end
        if large==0
            e=50;
            c(i+1,j+1)=double((large-small)/(large+small+e));
            c1(i+1,j+1)=double((be*c(i+1,j+1))+((1-be)*(large-small)));
        else
            c(i+1,j+1)=double((large-small)/(large+small));
            pk(i+1,j+1)=large-small;
        end
    end
end
p=zeros(a,b);
temp=zeros(a,b);
for i=1:a-2
   for j=1:b-2
    for i1=0:2
        for j1=0:2
        temp(i1+1,j1+1)= pk(i+i1,j+j1);
        end
     end
lar=0;
smal=258;
for i1=1:3
    for j1=1:3
        if lar<temp(i1,j1)
            lar=temp(i1,j1);
        end
        if smal>temp(i1,j1)
          smal=temp(i1,j1);
        end
    end
end
    %smal=(-1)*(smal);
    p(i+1,j+1)=(pk(i+1,j+1)-smal)/(lar-smal);
    end
end
for i=1:a
    for j=1:b
        c1(i,j)=double((be*c(i,j))+((1-be)*(p(i,j))));
    end
end
bik=zeros(a,b);
for i=1:a
    for j=1:b
            bik(i,j)=uint16((c1(i,j)*double(I(i,j))));
    end
end
for j=1:b
    bik(1,j)=int16(I(1,j));
end
for i=1:a
    bik(i,1)=int16(I(i,1));
end
for j=1:b
    bik(a,j)=int16(I(a,j));
end
for i=1:a
    bik(i,b)=int16(I(i,b));
end
sum=double(0);
for i=1:a
    for j=1:b
    sum=sum+double(bik(i,j));
    end
end
avg=double(sum/(a*b));
bil=zeros(a,b);
for i=1:a
    for j=1:b
        if bik(i,j)>avg
            bil(i,j)=1;
        else
            bil(i,j)=0;
        end
    end
end