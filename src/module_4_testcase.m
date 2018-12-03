clear;
clc;
I=imread('H04.bmp');
I=rgb2gray(I);
kg=I;
I=double(I);
[a,b]=size(I);
kp=module_2();
BW1=iresultbinary();
edp=BW1;
edg1=kp;
edg2=kp;
edg3=kp;
if edg1(1,1)==1
    if edg1(1,2)==0&&edg1(2,1)==0
        edg1(1,1)=0;
    end
end
if edg1(1,b)==1
    if edg1(1,b-1)==0&&edg1(2,b)==0
        edg1(1,b)=0;
    end
end
if edg1(a,1)==1
     if edg1(a-1,1)==0&&edg1(a,2)==0
          edg1(a,1)=0;
     end
end
if edg1(a,b)==1
     if edg1(a-1,b)==0&&edg1(a,b-1)==0
          edg1(a,b)=0;
    end
end
for j=2:(b-1)
   if edg1(1,j)==1
       if edg1(2,j)==0&&edg1(1,j+1)==0
            edg1(1,j)=0;
       end
   end
end
for i=2:(a-1)
    if edg1(i,1)==1
        if edg1(i,2)==0&&edg1(i+1,1)==0
             edg1(i,1)=0;
        end
    end
end
for i=2:(a-1)
    if edg1(i,b)==1
        if edg1(i,b-1)==0&&edg1(i+1,b)==0
            edg1(i,b)=0;
        end
    end
end
for j=2:(b-1)
    if edg1(a,j)==1
        if edg1(a,j+1)==0&&edg1(a-1,j)==0
            edg1(a,j)=0;
        end
    end
end
imshow(edg1);
figure;
c=0;
for i=2:(a-1)
    for j=2:(b-1)
        if edg1(i,j)==1
            if edg1(i-1,j)==0&&edg1(i+1,j)==0&&edg1(i,j-1)==0&&edg1(i,j+1)==0
                edg1(i,j)=0;
                c=c+1;
            end
        end
    end
end
c1=0;
for i=2:(a-1)
    for j=2:(b-1)
        if edg1(i,j)==1
                c1=c1+1;
        end
    end
end
imshow(edg1);
% cc=bwconncomp(BW1,4);
% s=regionprops(cc,'Area');
% L=labelmatrix(cc);
% BW2=ismember(L,find([s.Area]>=3));
% figure;
% imshow(BW2);
if edg1(1,1)==1
    if edg1(1,2)==0&&edg1(2,1)==0
        if kg(1,2)>kg(2,1)
            edp(2,1)=1;
            edp(1,2)=0;
        else
            edp(1,2)=1;
            edp(2,1)=0;
        end
    elseif edg1(1,2)==1&&edg1(2,1)==1
         if kg(1,2)>kg(2,1)
             edp(2,1)=1;
             edp(1,2)=0;
         else
             edp(1,2)=1;
             edp(2,1)=0;
         end
    else
    end
end
if edg1(1,b)==1
    if edg1(1,b-1)==0&&edg1(2,b)==0
         if kg(1,b-1)>kg(2,b)
             edp(2,b)=1;
             edp(1,b-1)=0;
         else
             edp(1,b-1)=1;
             edp(2,b)=0;
         end
    elseif edg1(1,b-1)==1&&edg1(2,b)==1
         if kg(1,b-1)>kg(2,b)
             edp(2,b)=1;
             edp(1,b-1)=0;
         else
             edp(1,b-1)=1;
             edp(2,b)=0;
          end
    else
    end
end
if edg1(a,1)==1
     if edg1(a-1,1)==0&&edg1(a,2)==0
          if kg(a-1,1)>kg(a,2)
              edp(a,2)=1;
              edp(a-1,1)=0;
          else
              edp(a,2)=0;
              edp(a-1,1)=1;
          end
     elseif edg1(a-1,1)==1&&edg1(a,2)==1
          if kg(a-1,1)>kg(a,2)
              edp(a,2)=1;
              edp(a-1,1)=0;
          else
              edp(a,2)=0;
              edp(a-1,1)=1;
          end
     else
     end
end
if edg1(a,b)==1
     if edg1(a-1,b)==0&&edg1(a,b-1)==0
          if kg(a-1,b)>kg(a,b-1)
              edp(a,b-1)=1;
              edp(a-1,b)=0;
          else
              edp(a,b-1)=0;
              edp(a-1,b)=1;
          end
      elseif edg1(a-1,b)==1&&edg1(a,b-1)==1
            if kg(a-1,b)>kg(a,b-1)
              edp(a,b-1)=1;
              edp(a-1,b)=0;
          else
              edp(a,b-1)=0;
              edp(a-1,b)=1;
            end
    else
    end
end
for j=2:(b-1)
   if edg1(1,j)==1
       if edg1(2,j)==0&&edg1(1,j+1)==0
           if kg(2,j)>kg(1,j+1)
               edp(1,j+1)=1;
               edp(2,j)=0;
           else
               edp(1,j+1)=0;
               edp(2,j)=1;
           end
       elseif edg1(2,j)==1&&edg1(1,j+1)==1
            if kg(2,j)>kg(1,j+1)
               edp(1,j+1)=1;
               edp(2,j)=0;
           else
               edp(1,j+1)=0;
               edp(2,j)=1;
           end
       else
       end
   end
end
for i=2:(a-1)
    if edg1(i,1)==1
        if edg1(i,2)==0&&edg1(i+1,1)==0
             if kg(i,2)>kg(i+1,1)
                 edp(i+1,1)=1;
                 edp(i,2)=0;
             else
                 edp(i,2)=1;
                 edp(i+1,1)=0;
             end
        elseif edg1(i,2)==1&&edg1(i+1,1)==1
             if kg(i,2)>kg(i+1,1)
                 edp(i+1,1)=1;
                 edp(i,2)=0;
             else
                 edp(i,2)=1;
                 edp(i+1,1)=0;
             end
        else
        end
    end
end
for i=2:(a-1)
    if edg1(i,b)==1
        if edg1(i,b-1)==0&&edg1(i+1,b)==0
            if kg(i,b-1)>kg(i+1,b)
                edp(i+1,b)=1;
                edp(i,b-1)=0;
            else
                edp(i+1,b)=0;
                edp(i,b-1)=1;
            end
        elseif edg1(i,b-1)==1&&edg1(i+1,b)==1
            if kg(i,b-1)>kg(i+1,b)
                edp(i+1,b)=1;
                edp(i,b-1)=0;
            else
                edp(i+1,b)=0;
                edp(i,b-1)=1;
            end
        else
        end
    end
end
for j=2:(b-1)
    if edg1(a,j)==1
        if edg1(a,j+1)==0&&edg1(a-1,j)==0
            if kg(a,j+1)>kg(a-1,j)
                edp(a,j+1)=0;
                edp(a-1,j)=1;
            else
                edp(a,j+1)=1;
                edp(a-1,j)=0;
            end
        elseif edg1(a,j+1)==1&&edg1(a-1,j)==1
            if kg(a,j+1)>kg(a-1,j)
                edp(a,j+1)=0;
                edp(a-1,j)=1;
            else
                edp(a,j+1)=1;
                edp(a-1,j)=0;
            end
        else
        end
    end
end
for i=2:(a-1)
    for j=2:(b-1)
        if edg1(i,j)==1
            if ((edg1(i-1,j)==0&&edg1(i+1,j)==0)||(edg1(i-1,j)==1&&edg1(i+1,j)==1))&&((edg1(i,j-1)==0&&edg1(i,j+1)==0)||(edg1(i,j-1)==1&&edg1(i,j+1)==1))
                 if (kg(i-1,j)>kg(i+1,j))&&(kg(i,j-1)>kg(i,j+1))
                     edp(i+1,j)=1;
                     edp(i-1,j)=0;
                     edp(i,j+1)=1;
                     edp(i,j-1)=0;
                 elseif (kg(i-1,j)<kg(i+1,j))&&(kg(i,j-1)<kg(i,j+1))
                     edp(i-1,j)=1;
                     edp(i+1,j)=0;
                     edp(i,j-1)=1;
                     edp(i,j+1)=0;
                 elseif (kg(i-1,j)>kg(i+1,j))&&(kg(i,j-1)<kg(i,j+1))
                      edp(i-1,j)=0;
                      edp(i+1,j)=1;
                      edp(i,j-1)=1;
                      edp(i,j+1)=0;
                 elseif (kg(i-1,j)<kg(i+1,j))&&(kg(i,j-1)>kg(i,j+1))
                      edp(i-1,j)=1;
                      edp(i+1,j)=0;
                      edp(i,j-1)=0;
                      edp(i,j+1)=1;
                 else
                 end
            end
        end
    end
end
figure;
imshow(edp);
%pp=strel('diamond',2);
pk=[1 0 1; 0 1 0; 1 0 1];
pp=[0 1 0;1 0 1;0 1 0];
pl=pp&(~pk);
D=imdilate(edp,pl);
figure;
imshow(D);
se=strel('rectangle',[5,4]);
df=edp|D;
fig=imopen(df,se);
figure;
imshow(fig);
figure;
pg=D&fig;
imshow(pg);