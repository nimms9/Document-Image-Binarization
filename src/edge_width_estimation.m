clear;
clc;
I=imread('30.bmp');
%I=rgb2gray(I);
disp1=I;
I=double(I);
uimg=I;
kp=module2_cc();
[a,b]=size(I);
% for i=1:a
%     for j=1:b
%         if kp(i,j)==0
%             kp(i,j)=1;
%         else
%             kp(i,j)=0;
%         end
%     end
% end
edg1=kp;
edg2=kp;
edg3=kp;
j1=0;
for i=1:a
j=1;
   while j<=(b-1)
          if (edg1(i,j)==0)&&(edg1(i,j+1)==1)
                      inten=uimg(i,j);
                      if j<b
                      j1=j+1;
                      else
                         break;
                      end
                      j=j1;
             while (inten>uimg(i,j1))||(inten==uimg(i,j1))
                if (j1<=(b-1))&&(edg1(i,j1)==1&&edg1(i,j1+1)==0)
                    uimg(i,j1)=0;
                    if j1<b
                        j1=j1+1;
                    else
                        j=j1;
                        break;
                    end
                elseif (j1<=(b-1))&&(edg1(i,j1)==1&&edg1(i,j1+1)==1)
                    uimg(i,j1)=0;
                    if j1<b
                        j1=j1+1;
                    else
                        j=j1;
                        break;
                    end
                elseif (j1<=(b-1))&&(edg1(i,j1)==0&&edg1(i,j1+1)==0)
                    uimg(i,j1)=0;
                    if j1<b
                        j1=j1+1;
                    else
                        j=j1;
                        break;
                    end
                elseif j1==b 
                    uimg(i,j1)=0;
                    break;
                else
                    j=j1;
                    break;
                end
             end
           else
                j=j+1;
          end

   end
end
% for i=1:a-1
%     for j=1:b-1
%         if (edg1(i,j)==0)&&(edg1(i,j+1)==1)
%             inten=uimg(i,j);
%             for ip=j+1:b
%                 if inten<uimg(i,ip)
%                     uimg(i,ip)=0;
%                 end
%             end
%         end
%     end
% end

% for i=1:a-1
%     for j=1:b-1
%         if (edg1(i,j)==0)&&(edg1(i,j+1)==1)
%             inten(i)=i;
%             inten1(i)=j;
%         end
%     end
% end
% for i=1:a-1
%     for j=1:b-1
%         if inten(i)==i
%             if uimg(inten(i),inten1(i))<uimg(inten(i),(inten1(i)+1))
%                 uimg(inten(i),(inten1(i)))=0;
%             end
%         end
%     end
% end
% dist=zeros(a,b);
% for i=1:a
%     for j=1:b
%         if uimg(i,j)~=0
%             x1=i;
%             y1=j;
%             for ip=(j+1):b
%                 if uimg(i,ip)~=0
%                     x2=i;
%                     y2=ip;
%                     fg=[x1,y1;x2,y2];
%                     dist(i,ip)=pdist(fg,'euclidean');
%                     x1=x2;
%                     y1=y2;
%                 end
%             end
%         end
%       break;
%     end
% end
d1=1;
for i=1:a
    j=1;
        while j<=(b-1)
                if (edg1(i,j)==0)&&(edg1(i,j+1)==1)%&&(j<(b-1))
                        x1=i;
                        y1=j;
                for ip=(j+1):(b-1)
                        if (edg1(i,ip)==0)&&(edg1(i,(ip+1))==1)
                              x2=i;
                              y2=ip;
                              fg=[x1,y1;x2,y2];
                              dist1(1,d1)=pdist(fg,'euclidean');
                              d1=d1+1;
                              %j=ip;
                              break;
                        end
                end
                j=ip;
                else
                    j=j+1;
                end
        end
end
il=max(dist1(:));
%h=zeros(1,il);
[ca,cb]=size(dist1);
for j=1:cb
        t=int16(dist1(1,j));
        h(t)=0;
end
    for j=1:cb
        t=int16(dist1(1,j));
        h(t)=h(t)+1;
    end
imshow(edg3);
figure;
for j=1:il
    if h(1,j)==max(h(:))
        disp(['    peak value=',num2str(j)]);
    end
end
count=0;
for j=1:il
    if h(1,j)==0
        count=count+1;
    end
end
disp(['    zero distances number count=',num2str(count)]);
for i=1:il
    cx(i)=int16(i);
end
hp=int16(h);
plot(cx,hp,'b-');
set(gca,'xtick',0:10:500)
set(gca,'ytick',0:100:2000)
axis([0 500 0 2000]);
grid on;
figure;
imshow(uimg);