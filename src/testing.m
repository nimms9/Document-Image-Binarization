clear;
clc;
I=imread('H04.bmp');
I=rgb2gray(I);
uimg=I;
I=double(I);
[a,b]=size(I);
f=mat2cell(I,[10 a-10],[20 b-20]);
kp=module_2();
ed=mat2cell(kp,[10 a-10],[20 b-20]);
tim=f{1,1};
tim1=tim;
eim=ed{1,1};
eim1=eim;
count=0;
for i=1:10
    eim(i,3)=1;
    eim(i,20)=1;
    eim(i,5)=1;
    eim(i,15)=1;
    eim(i,12)=1;
end
j1=0;
for i=1:10
j=1;
   while j<=19
          if (eim(i,j)==0)&&(eim(i,j+1)==1)
                      inten=tim(i,j);
                      if j<20
                      j1=j+1;
                      else
                         break;
                      end 
                    j=j1;
                    count=count+1;
             while (inten>tim(i,j1))%||(inten==tim(i,j1))
                if (j1<=19)&&(eim(i,j1)==0&&eim(i,j1+1)==0)
                    tim(i,j1)=0;
                    if j1<20
                        j1=j1+1;
                    else
                        j=j1;
                        break;
                    end
                elseif (j1<=19)&&(eim(i,j1)==1&&eim(i,j1+1)==1)
                    tim(i,j1)=0;
                    if j1<20
                        j1=j1+1;
                    else
                        j=j1;
                        break;
                    end
                elseif (j1<=19)&&(eim(i,j1)==1&&eim(i,j1+1)==0)
                    tim(i,j1)=0;
                    if j1<20
                        j1=j1+1;
                    else
                        j=j1;
                        break;
                    end
                elseif j1==20 
                    tim(i,j1)=0;
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
dist1=zeros(1,count);
d1=1;
for i=1:10
    j=1;
        while j<=19
                if (eim(i,j)==0)&&(eim(i,j+1)==1)&&(j<19)
                        x1=i;
                        y1=j;
                for ip=(j+1):19
                        if (eim(i,ip)==0)&&(eim(i,(ip+1))==1)
                              x2=i;
                              y2=ip;
                              fg=[x1,y1;x2,y2];
                               if d1<=count
                                  dist1(1,d1)=pdist(fg,'euclidean');
                               end
                              d1=d1+1;
                              j=ip;
                              break;
                        end
                end
                else
                    j=j+1;
                end
        end
end