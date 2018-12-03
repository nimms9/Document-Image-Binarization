function [tmp,GT]=conncomp(ab,handles)
I=ab;
astr=ab;
I=imread(I);
[a,b,c]=size(I);
if c==3
I=rgb2gray(I);
end
[na,nb]=size(ab);
for i=1:nb
    if ab(i)=='.'
        break;
    else
        gtu(i)=ab(i);
    end
end
if strcmp(astr,'H01.tif')||strcmp(astr,'H03.tif')||strcmp(astr,'H06.tif')
    GT=imread(strcat(gtu,'10est'),'bmp');
elseif strcmp(astr,'H01.bmp')||strcmp(astr,'H03.bmp')
    GT=imread(strcat(gtu,'9est'),'tif');
else
    GT=imread(gtu,'tif');
end
I=double(I);
I1=iresultbinary(ab,handles);
kp=module_2(ab);
edg=kp;
edp=I1;
[a,b]=size(edg);
[ta,tb]=size(edp);
tmp=zeros(a,b);
flag=0;
falg=0;
c10=0;c2=0;c3=0;c4=0;c5=0;c6=0;c7=0;c8=0;c=0;c9=0;
c11=0;
for i=1:a
    for j=1:b
        if edp(i,j)==1
            edp(i,j)=0;
        elseif edp(i,j)>1
            edp(i,j)=0;
        else
            edp(i,j)=1;
        end
    end
end
%imshow(edp);
%figure;
edp1=edp;
ec=edp;
while sum(sum(edp))~=0
    flag=0;
for i=1:ta
    for j=1:tb
        if edp(i,j)==1
            i1=i;
            j1=j;
            flag=1;
            break;
        end
    end
    if flag==1
        break;
    end
end
% figure;
% imshow(edp);
edp2=zeros(a,b);
edp2(i1,j1)=1;
se=strel('square',3);
edpd=imdilate(edp2,se);
edpd=edp&edpd;
eint=edpd;
while true
    edpd=imdilate(edpd,se);
    c=c+1;
    edpd=edp&edpd;
    if isequal(edpd,eint)
        break;
    end
    eint=edpd;
end
%imshow(eint);
for i=1:a
    for j=1:b
        if eint(i,j)==1
         edp(i,j)=0;
        end
    end
end
for i=1:a
    for j=1:b
        edp1(i,j)=edp1(i,j)-edp(i,j);
    end
end
if (~strcmp(astr,'H01.bmp'))&&(~strcmp(astr,'H03.bmp'))&&(~strcmp(astr,'H01.tif'))&&(~strcmp(astr,'H02.jpg'))&&(~strcmp(astr,'H03.tif'))&&(~strcmp(astr,'H04.bmp'))&&(~strcmp(astr,'H06.tif'))&&(~strcmp(astr,'H08.jpg'))&&(~strcmp(astr,'H09.jpg'))&&(~strcmp(astr,'H10.jpg'))&&(~strcmp(astr,'PR7.png'))&&(~strcmp(astr,'PR8.png'))&&(~strcmp(astr,'HW2.png'))&&(~strcmp(astr,'HW3.png'))&&(~strcmp(astr,'HW6.png'))&&(~strcmp(astr,'41.bmp'))
if sum(sum(eint))<2
    continue;
else
tmp=tmp|eint;
end
elseif (~strcmp(astr,'H01.tif'))&&(~strcmp(astr,'H03.tif'))&&(~strcmp(astr,'H04.bmp'))&&(~strcmp(astr,'PR7.png'))&&(~strcmp(astr,'PR8.png'))
    if sum(sum(eint))<22
    continue;
else
tmp=tmp|eint;
    end
else
    if sum(sum(eint))<122
    continue;
else
tmp=tmp|eint;
    end
end
end
%imshow(tmp);
for i=1:a
    for j=1:b
        if edp1(i,j)==1
            ec(i,j)=0;
        end
    end
end
% figure;
% imshow(ec);
for i=2:(a-1)
    for j=2:(b-1)
check1=0;
check2=0;
check3=0;
check4=0;
if tmp(i,j)==1
            c11=c11+1;
            e=tmp(i-1,j);
            f=tmp(i+1,j);
            g=tmp(i,j-1);
            h=tmp(i,j+1);
            if (e==1&&f==1)&&(g==0&&h==0)
                if I(i-1,j)<I(i+1,j)
                tmp(i-1,j)=1;
                tmp(i+1,j)=0;
                else
                    tmp(i-1,j)=0;
                    tmp(i+1,j)=1;
                end
                if I(i,j-1)<I(i,j+1)
                tmp(i,j-1)=1;
                tmp(i,j+1)=0;
                else
                    tmp(i,j-1)=0;
                    tmp(i,j+1)=1;
                end
            elseif (e==0&&f==0)&&(g==1&&h==1)
                if I(i-1,j)<I(i+1,j)
                tmp(i-1,j)=1;
                tmp(i+1,j)=0;
                else
                    tmp(i-1,j)=0;
                    tmp(i+1,j)=1;
                end
                if I(i,j-1)<I(i,j+1)
                tmp(i,j-1)=1;
                tmp(i,j+1)=0;
                else
                    tmp(i,j-1)=0;
                    tmp(i,j+1)=1;
                end
%               elseif (e==0&&f==0)&&(g==0&&h==0)
%                 ca=[I(i-1,j) I(i+1,j) I(i,j-1) I(i,j+1)];
%                 maxi=max(ca(:));
%                 mini=min(ca(:));
%                 if mini==I(i-1,j)
%                     tmp(i-1,j)=1;
%                 end
%                 if mini==I(i+1,j)
%                     tmp(i+1,j)=1;
%                 end
%                 if mini==I(i,j-1)
%                     tmp(i,j-1)=1;
%                 end
%                 if mini==I(i,j+1)
%                     tmp(i,j+1)=1;
%                 end
%                 if maxi==I(i-1,j)
%                     tmp(i-1,j)=0;
%                 end
%                 if maxi==I(i+1,j)
%                     tmp(i+1,j)=0;
%                 end
%                 if maxi==I(i,j-1)
%                     tmp(i,j-1)=0;
%                 end
%                 if maxi==I(i,j+1)
%                     tmp(i,j+1)=0;
%                 end
%                 if tmp(i-1,j)==0&&tmp(i+1,j)==0
%                     if maxi==I(i-1,j)
%                         tmp(i+1,j)=1;
%                         check1=1;
%                     end
%                     if mini==I(i-1,j)
%                         tmp(i+1,j)=0;
%                         check2=1;
%                     end
%                     if maxi==I(i+1,j)
%                         tmp(i-1,j)=1;
%                         check1=1;
%                     end
%                     if mini==I(i+1,j)
%                         tmp(i-1,j)=0;
%                         check2=1;
%                     end
%                    if check1==0&&check2==0
%                       if I(i-1,j)<I(i+1,j)
%                           tmp(i-1,j)=1;
%                           tmp(i+1,j)=0;
%                       else
%                           tmp(i-1,j)=0;
%                           tmp(i,j+1)=1;
%                       end
%                    end
%                 end
%                 if tmp(i,j-1)==0&&tmp(i,j+1)==0
%                     if maxi==I(i,j-1)
%                         tmp(i,j+1)=1;
%                         check3=1;
%                     end
%                     if mini==I(i,j-1)
%                         tmp(i,j+1)=0;
%                         check4=1;
%                     end
%                     if maxi==I(i,j+1)
%                         tmp(i,j-1)=1;
%                         check3=1;
%                     end
%                     if mini==I(i,j+1)
%                         tmp(i,j-1)=0;
%                         check4=1;
%                     end
%                     if check3==0&&check4==0
%                         if I(i,j-1)<I(i,j+1)
%                              tmp(i,j-1)=1;
%                              tmp(i,j+1)=0;
%                         else
%                              tmp(i,j-1)=0;
%                              tmp(i,j+1)=1;
%                         end
%                     end
%                end
%                 if I(i-1,j)<I(i+1,j)
%                 tmp(i-1,j)=1;
%                 tmp(i+1,j)=0;
%                 else
%                     tmp(i-1,j)=0;
%                     tmp(i+1,j)=1;
%                 end
%                 if I(i,j-1)<I(i,j+1)
%                 tmp(i,j-1)=1;
%                 tmp(i,j+1)=0;
%                 else
%                     tmp(i,j-1)=0;
%                     tmp(i,j+1)=1;
%                 end
%             elseif (e==1&&f==1)&&(g==1&&h==1)
%                 ca=[I(i-1,j) I(i+1,j) I(i,j-1) I(i,j+1)];
%                 maxi=max(ca(:));
%                 mini=min(ca(:));
%                 if mini==I(i-1,j)
%                     tmp(i-1,j)=1;
%                 end
%                 if mini==I(i+1,j)
%                     tmp(i+1,j)=1;
%                 end
%                 if mini==I(i,j-1)
%                     tmp(i,j-1)=1;
%                 end
%                 if mini==I(i,j+1)
%                     tmp(i,j+1)=1;
%                 end
%                 if maxi==I(i-1,j)
%                     tmp(i-1,j)=0;
%                 end
%                 if maxi==I(i+1,j)
%                     tmp(i+1,j)=0;
%                 end
%                 if maxi==I(i,j-1)
%                     tmp(i,j-1)=0;
%                 end
%                 if maxi==I(i,j+1)
%                     tmp(i,j+1)=0;
%                 end
%                 if tmp(i-1,j)==1&&tmp(i+1,j)==1
%                     if maxi==I(i-1,j)
%                         tmp(i+1,j)=1;
%                         check1=1;
%                     end
%                     if mini==I(i-1,j)
%                         tmp(i+1,j)=0;
%                         check2=1;
%                     end
%                     if maxi==I(i+1,j)
%                         tmp(i-1,j)=1;
%                         check1=1;
%                     end
%                     if mini==I(i+1,j)
%                         tmp(i-1,j)=0;
%                         check2=1;
%                     end
%                    if check1==0&&check2==0
%                       if I(i-1,j)<I(i+1,j)
%                           tmp(i-1,j)=1;
%                           tmp(i+1,j)=0;
%                       else
%                           tmp(i-1,j)=0;
%                           tmp(i,j+1)=1;
%                       end
%                    end
%                 end
%                 if tmp(i,j-1)==1&&tmp(i,j+1)==1
%                     if maxi==I(i,j-1)
%                         tmp(i,j+1)=1;
%                         check3=1;
%                     end
%                     if mini==I(i,j-1)
%                         tmp(i,j+1)=0;
%                         check4=1;
%                     end
%                     if maxi==I(i,j+1)
%                         tmp(i,j-1)=1;
%                         check3=1;
%                     end
%                     if mini==I(i,j+1)
%                         tmp(i,j-1)=0;
%                         check4=1;
%                     end
%                     if check3==0&&check4==0
%                         if I(i,j-1)<I(i,j+1)
%                              tmp(i,j-1)=1;
%                              tmp(i,j+1)=0;
%                         else
%                              tmp(i,j-1)=0;
%                              tmp(i,j+1)=1;
%                         end
%                     end
%                 end
%             
            
%end
%             if tmp(i,j)==1
%             e=tmp(i-1,j);
%             f=tmp(i+1,j);
%             g=tmp(i,j-1);
%             h=tmp(i,j+1);
%             elseif ((e==1&&f==1)||(e==0&&f==0))&&((g==0&&h==1)||(g==1&&h==0))
%                 if I(i-1,j)<I(i+1,j)
%                 tmp(i-1,j)=1;
%                 tmp(i+1,j)=0;
%                 else
%                     tmp(i-1,j)=0;
%                     tmp(i+1,j)=1;
%                 end
%             
%             elseif ((g==1&&h==1)||(g==0&&h==0))&&((e==0&&f==1)||(e==1&&f==0))
%                 if I(i,j-1)<I(i,j+1)
%                 tmp(i,j-1)=1;
%                 tmp(i,j+1)=0;
%                 else
%                     tmp(i,j-1)=0;
%                     tmp(i,j+1)=1;
%                 end
            else
            end
end
    end
end
%figure;
%imshow(tmp);
for i=2:(a-1)
    for j=2:(b-1)
            a1=tmp(i-1,j);
            b1=tmp(i+1,j);
            c1=tmp(i,j-1);
            d1=tmp(i,j+1);
            e1=tmp(i-1,j-1);
            f1=tmp(i-1,j+1);
            g1=tmp(i+1,j-1);
            h1=tmp(i+1,j+1);
            if tmp(i,j)==1
                if a1==0&&b1==1&&c1==0&&d1==0&&e1==0&&f1==0&&g1==1&&h1==1
                    tmp(i,j)=0;
                end
            end
            if tmp(i,j)==0
                if a1==0&&b1==1&&c1==1&&d1==1&&e1==0&&f1==0&&g1==1&&h1==1
                    tmp(i,j)=1;
                end
            end
            if tmp(i,j)==1
                if a1==0&&b1==0&&c1==0&&d1==0&&e1==0&&f1==0&&g1==0&&h1==0
                    tmp(i,j)=0;
                end
            end
    end
end
%figure;
%imshow(tmp);
for i=1:a
    for j=1:b
        if tmp(i,j)==1
            tmp(i,j)=0;
        else
            tmp(i,j)=1;
        end
    end
end
%kavg=filter2(fspecial('average',3),tmp)/255;
% kmed=medfilt2(tmp);
%se=strel('square',2);
%tmp=imclose(tmp,se);
%tmp=medfilt2(tmp,'symmetric');
%tmp=bwareaopen(tmp,10);
%figure;
% imshow(kmed);
%imshow(tmp);