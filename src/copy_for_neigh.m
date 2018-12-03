clear;
clc;
I=imread('H04.bmp');
I=rgb2gray(I);
kg=I;
I=double(I);
[a,b]=size(I);
kp=module_2();
edg1=kp;
edg2=kp;
edg3=kp;
if edg1(1,1)==1
    if edg1(1,2)==0&&edg1(2,1)==0
        edg1(1,1)=0;
    elseif edg1(1,2)==0&&edg1(2,1)==1
         edg1(1,1)=0;
    elseif edg1(1,2)==1&&edg1(2,1)==0;
          edg1(1,1)=0;
    else
    end
end
if edg1(1,b)==1
    if edg1(1,b-1)==0&&edg1(2,b)==0
        edg1(1,b)=0;
    elseif edg1(1,b-1)==0&&edg1(2,b)==1
          edg1(1,b)=0;
    elseif edg1(1,b-1)==1&&edg1(2,b)==0;
           edg1(1,b)=0;
    else
    end
end
if edg1(a,1)==1
     if edg1(a-1,1)==0&&edg1(a,2)==0
          edg1(a,1)=0;
     elseif edg1(a-1,1)==1&&edg1(a,2)==0
          edg1(a,1)=0;
     elseif edg1(a-1,1)==0&&edg1(a,2)==1
          edg1(a,1)=0;
     else
     end
end
if edg1(a,b)==1
     if edg1(a-1,b)==0&&edg1(a,b-1)==0
          edg1(a,b)=0;
      elseif edg1(a-1,b)==1&&edg1(a,b-1)==0
            edg1(a,b)=0;
    elseif edg1(a-1,b)==0&&edg1(a,b-1)==0
           edg1(a,b)=0;
    else
    end
end
for j=2:(b-1)
   if edg1(1,j)==1
       if edg1(2,j)==0&&edg1(1,j+1)==0
            edg1(1,j)=0;
       elseif edg1(2,j)==0&&edg1(1,j+1)==1
            edg1(1,j)=0;
       elseif edg1(2,j)==1&&edg1(1,j+1)==0
             edg1(1,j)=0;
       else
       end
   end
end
for i=2:(a-1)
    if edg1(i,1)==1
        if edg1(i,2)==0&&edg1(i+1,1)==0
             edg1(i,1)=0;
        elseif edg1(i,2)==1&&edg1(i+1,1)==0
             edg1(i,1)=0;
        elseif edg1(i,2)==0&&edg1(i+1,1)==1
             edg1(i,1)=0;
        else
        end
    end
end
for i=2:(a-1)
    if edg1(i,b)==1
        if edg1(i,b-1)==0&&edg1(i+1,b)==0
            edg1(i,b)=0;
        elseif edg1(i,b-1)==0&&edg1(i+1,b)==1
            edg1(i,b)=0;
        elseif edg1(i,b-1)==1&&edg1(i+1,b)==0
             edg1(i,b)=0;
        else
        end
    end
end
for j=2:(b-1)
    if edg1(a,j)==1
        if edg1(a,j+1)==0&&edg1(a-1,j)==0
            edg1(a,j)=0;
        elseif edg1(a,j+1)==1&&edg1(a-1,j)==0
            edg1(a,j)=0;
        elseif edg1(a,j+1)==0&&edg1(a-1,j)==1
            edg1(a,j)=0;
        else
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


