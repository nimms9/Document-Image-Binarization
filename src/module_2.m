function kip=module_2(ab)
kp=imread(ab);
[a,b,c]=size(kp);
if c==3
kp=rgb2gray(kp);
end
[bik,bil,I]=fcontrast(ab);
img=bik;
img=double(img);
[a,b]=size(img);
%%obtain no of pixels for each gray level
h=zeros(1,256);
p=zeros(1,256);
tmp=zeros(a,b);
mean=zeros(a,b);
for i=1:a-2
    for j=1:b-2
        s=0;
        for i1=0:2
            for j1=0:2
                tmp(i1+1,j1+1)=img(i+i1,j+j1);
                s=s+tmp(i1+1,j1+1);
            end
        end
        mean(i+1,j+1)=double(s/9);
    end
end  
for i=1:a
    for j=1:b
        img(i,j)=mean(i,j);
    end
end
img=uint16(img);
for k=1:256
    h(k)=0;
end
for i=1:a
    for j=1:b
       k=img(i,j);
       h(k+1)=h(k+1)+1;
    end
end
for k =1:256
    p(k)=double(h(k)/(a*b));
end
sd=zeros(1,256);
for t=0:255
q1=0;
q2=0;
u1=0;
u2=0;
sig1=0;
sig2=0;
for i=0:t
    q1=q1+p(i+1);
end
for i=(t+1):255
    q2=q2+p(i+1);
end
for i=0:t
    u1=int16(u1+double((i*p(i+1))/q1));
end
for i=(t+1):255
    ui=((i)*p(i+1));
    u2=int16(u2+double(ui/q2));
end
for i=0:t
    v=int16(int16((i-int16(u1)).^2)*p(i+1));
    sig1=int16(sig1+double((v/q1)));
end
for i=(t+1):255
    sig2=int16(sig2+(int16(((i-int16(u2)).^2)).*(double(p(i+1)/q2))));
end
sd(t+1)=int16((q1*sig1)+(q2*sig2));
end
bc=min(sd(:));
for i=1:256
 if bc==sd(i)
     t=i-1;
 end
end
bil=zeros(a,b);
for j=1:b
    img(1,j)=int16(bik(1,j));
end
for i=1:a
    img(i,1)=int16(bik(i,1));
end
for j=1:b
    img(a,j)=int16(bik(a,j));
end
for i=1:a
    img(i,b)=int16(bik(i,b));
end
 for i=1:a
     for j=1:b
         if img(i,j)>t
             bil(i,j)=0;
         else
             bil(i,j)=1;
         end
     end
 end
[kp,jf]=edge(kp,'canny');
for i=1:a
     for j=1:b
         if img(i,j)>t
             bil(i,j)=1;
         else
             bil(i,j)=0;
         end
     end
end
kip=zeros(a,b);
 for i=1:a
     for j=1:b
         if bil(i,j)==1&&kp(i,j)==1
             kip(i,j)=1;
         end
     end
 end
 for i=1:a
     for j=1:b
         if kip(i,j)==0
             kip(i,j)=1;
         else
             kip(i,j)=0;
         end
     end
 end