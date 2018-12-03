clear;
clc;
I=imread('H04.bmp');
I=rgb2gray(I);
kg=I;
I=double(I);
[a,b]=size(I);
kp=module_2();
BW1=iresultbinary();
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
cc=bwconncomp(BW1,4);
s=regionprops(cc,'Area');
L=labelmatrix(cc);
BW2=ismember(L,find([s.Area]>=3));
figure;
imshow(BW2);
if edg1(1,1)==1
    if edg1(1,2)==0&&edg1(2,1)==0
        if kg(1,2)>kg(2,1)
            edg1(2,1)=1;
            edg1(1,2)=0;
        else
            edg1(1,2)=1;
            edg1(2,1)=0;
        end
    elseif edg1(1,2)==1&&edg1(2,1)==1
         if kg(1,2)>kg(2,1)
             edg1(2,1)=1;
             edg1(1,2)=0;
         else
             edg1(1,2)=1;
             edg1(2,1)=0;
         end
    else
    end
end
if edg1(1,b)==1
    if edg1(1,b-1)==0&&edg1(2,b)==0
         if kg(1,b-1)>kg(2,b)
             edg1(2,b)=1;
             edg1(1,b-1)=0;
         else
             edg1(1,b-1)=1;
             edg1(2,b)=0;
         end
    elseif edg1(1,b-1)==1&&edg1(2,b)==1
         if kg(1,b-1)>kg(2,b)
             edg1(2,b)=1;
             edg1(1,b-1)=0;
         else
             edg1(1,b-1)=1;
             edg1(2,b)=0;
          end
    else
    end
end
if edg1(a,1)==1
     if edg1(a-1,1)==0&&edg1(a,2)==0
          if kg(a-1,1)>kg(a,2)
              edg1(a,2)=1;
              edg1(a-1,1)=0;
          else
              edg1(a,2)=0;
              edg1(a-1,1)=1;
          end
     elseif edg1(a-1,1)==1&&edg1(a,2)==1
          if kg(a-1,1)>kg(a,2)
              edg1(a,2)=1;
              edg1(a-1,1)=0;
          else
              edg1(a,2)=0;
              edg1(a-1,1)=1;
          end
     else
     end
end
if edg1(a,b)==1
     if edg1(a-1,b)==0&&edg1(a,b-1)==0
          if kg(a-1,b)>kg(a,b-1)
              edg1(a,b-1)=1;
              edg1(a-1,b)=0;
          else
              edg1(a,b-1)=0;
              edg1(a-1,b)=1;
          end
      elseif edg1(a-1,b)==1&&edg1(a,b-1)==1
            if kg(a-1,b)>kg(a,b-1)
              edg1(a,b-1)=1;
              edg1(a-1,b)=0;
          else
              edg1(a,b-1)=0;
              edg1(a-1,b)=1;
            end
    else
    end
end
for j=2:(b-1)
   if edg1(1,j)==1
       if edg1(2,j)==0&&edg1(1,j+1)==0
           if kg(2,j)>kg(1,j+1)
               edg1(1,j+1)=1;
               edg1(2,j)=0;
           else
               edg1(1,j+1)=0;
               edg1(2,j)=1;
           end
       elseif edg1(2,j)==1&&edg1(1,j+1)==1
            if kg(2,j)>kg(1,j+1)
               edg1(1,j+1)=1;
               edg1(2,j)=0;
           else
               edg1(1,j+1)=0;
               edg1(2,j)=1;
           end
       else
       end
   end
end
for i=2:(a-1)
    if edg1(i,1)==1
        if edg1(i,2)==0&&edg1(i+1,1)==0
             if kg(i,2)>kg(i+1,1)
                 edg1(i+1,1)=1;
                 edg1(i,2)=0;
             else
                 edg1(i,2)=1;
                 edg1(i+1,1)=0;
             end
        elseif edg1(i,2)==1&&edg1(i+1,1)==1
             if kg(i,2)>kg(i+1,1)
                 edg1(i+1,1)=1;
                 edg1(i,2)=0;
             else
                 edg1(i,2)=1;
                 edg1(i+1,1)=0;
             end
        else
        end
    end
end
for i=2:(a-1)
    if edg1(i,b)==1
        if edg1(i,b-1)==0&&edg1(i+1,b)==0
            if kg(i,b-1)>kg(i+1,b)
                edg1(i+1,b)=1;
                edg1(i,b-1)=0;
            else
                edg1(i+1,b)=0;
                edg1(i,b-1)=1;
            end
        elseif edg1(i,b-1)==1&&edg1(i+1,b)==1
            if kg(i,b-1)>kg(i+1,b)
                edg1(i+1,b)=1;
                edg1(i,b-1)=0;
            else
                edg1(i+1,b)=0;
                edg1(i,b-1)=1;
            end
        else
        end
    end
end
for j=2:(b-1)
    if edg1(a,j)==1
        if edg1(a,j+1)==0&&edg1(a-1,j)==0
            if kg(a,j+1)>kg(a-1,j)
                edg1(a,j+1)=0;
                edg1(a-1,j)=1;
            else
                edg1(a,j+1)=1;
                edg1(a-1,j)=0;
            end
        elseif edg1(a,j+1)==1&&edg1(a-1,j)==1
            if kg(a,j+1)>kg(a-1,j)
                edg1(a,j+1)=0;
                edg1(a-1,j)=1;
            else
                edg1(a,j+1)=1;
                edg1(a-1,j)=0;
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
                     edg1(i+1,j)=1;
                     edg1(i-1,j)=0;
                     edg1(i,j+1)=1;
                     edg1(i,j-1)=0;
                 elseif (kg(i-1,j)<kg(i+1,j))&&(kg(i,j-1)<kg(i,j+1))
                     edg1(i-1,j)=1;
                     edg1(i+1,j)=0;
                     edg1(i,j-1)=1;
                     edg1(i,j+1)=0;
                 elseif (kg(i-1,j)>kg(i+1,j))&&(kg(i,j-1)<kg(i,j+1))
                      edg1(i-1,j)=0;
                      edg1(i+1,j)=1;
                      edg1(i,j-1)=1;
                      edg1(i,j+1)=0;
                 elseif (kg(i-1,j)<kg(i+1,j))&&(kg(i,j-1)>kg(i,j+1))
                      edg1(i-1,j)=1;
                      edg1(i+1,j)=0;
                      edg1(i,j-1)=0;
                      edg1(i,j+1)=1;
                 else
                 end
            end
        end
    end
end
figure;
imshow(edg1);

