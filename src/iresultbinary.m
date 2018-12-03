function I1=iresultbinary(ab,handles)
I=ab;
I=imread(I);
[a,b,c]=size(I);
if c==3
I=rgb2gray(I);
end
I=double(I);
[ewd,peak]=ibinary(ab,handles);
oimg=ewd;
oimg1=ewd;
npeak=ceil(peak*3.55);
astr=ab;
%npeak=peak+8;
%npeak=peak+2;
[a,b]=size(oimg);
if strcmp(astr,'HW1.png')||strcmp(astr,'HW5.png')||strcmp(astr,'HW6.png')||strcmp(astr,'HW8.png')||strcmp(astr,'60.bmp')
I1=oimg;
else
    I1=I;
end
newp=npeak-1;
r=floor(a/newp);
n=uint16(a)-(newp*r);
h=floor(b/newp);
p=uint16(b)-(newp*h);
%%window size is 14
% if n==0&&p==0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h p]);
% elseif p==0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r n],[h h h h h h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r n],[h h h h h h h h h h h h h p]);
% else
% end
% if n==0&&p==0
%     fg=mat2cell(I,[r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     fg=mat2cell(I,[r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h p]);
% elseif p==0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r r r r r r n],[h h h h h h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r r r r r r n],[h h h h h h h h h h h h h p]);
% else
% end
%%window size is 9
% if n==0&&p==0
%     f=mat2cell(oimg,[r r r r r r r r-10 10],[h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     f=mat2cell(oimg,[r r r r r r r r-10 10],[h h h h h h h h p]);
% elseif p==0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r n],[h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r n],[h h h h h h h h p]);
% else
% end
% if n==0&&p==0
%     fg=mat2cell(I,[r r r r r r r r-10 10],[h h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     fg=mat2cell(I,[r r r r r r r r-10 10],[h h h h h h h h p]);
% elseif p==0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r n],[h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r n],[h h h h h h h h p]);
% else
% end
%%window size is 15
% if n==0&&p==0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h h p]);
% elseif p==0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r r n],[h h h h h h h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r r r r r r r n],[h h h h h h h h h h h h h h p]);
% else
% end
% if n==0&&p==0
%     fg=mat2cell(I,[r r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     fg=mat2cell(I,[r r r r r r r r r r r r r r-10 10],[h h h h h h h h h h h h h h p]);
% elseif p==0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r r r r r r r n],[h h h h h h h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r r r r r r r n],[h h h h h h h h h h h h h h p]);
% else
% end
% if n==0&&p==0
%     f=mat2cell(oimg,[r r r r r r r r r-10 10],[h h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     f=mat2cell(oimg,[r r r r r r r r r-10 10],[h h h h h h h h h p]);
% elseif p==0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r r n],[h h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     f=mat2cell(oimg,[r r r r r r r r r n],[h h h h h h h h h p]);
% else
% end
% if n==0&&p==0
%     fg=mat2cell(I,[r r r r r r r r r-10 10],[h h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     fg=mat2cell(I,[r r r r r r r r r-10 10],[h h h h h h h h h p]);
% elseif p==0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r r n],[h h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r r n],[h h h h h h h h h p]);
% else
% end
% if n==0&&p==0
%      f=mat2cell(oimg,[r r r r r r-10 10],[h h h h h h-10 10]);
%  elseif n==0&&p~=0
%      f=mat2cell(oimg,[r r r r r r-10 10],[h h h h h h p]);
%  elseif p==0&&n~=0
%      f=mat2cell(oimg,[r r r r r r n],[h h h h h h-10 10]);
%  elseif p~=0&&n~=0
%      f=mat2cell(oimg,[r r r r r r n],[h h h h h h p]);
%  else
%  end
% if n==0&&p==0
%      fg=mat2cell(I,[r r r r r r-10 10],[h h h h h h-10 10]);
%  elseif n==0&&p~=0
%      fg=mat2cell(I,[r r r r r r-10 10],[h h h h h h p]);
%  elseif p==0&&n~=0
%      fg=mat2cell(I,[r r r r r r n],[h h h h h h-10 10]);
%  elseif p~=0&&n~=0
%      fg=mat2cell(I,[r r r r r r n],[h h h h h h p]);
%  else
%  end
% if n==0&&p==0
%      f=mat2cell(oimg,[r r r r r-10 10],[h h h h h-10 10]);
%  elseif n==0&&p~=0
%      f=mat2cell(oimg,[r r r r r-10 10],[h h h h h p]);
%  elseif p==0&&n~=0
%      f=mat2cell(oimg,[r r r r r n],[h h h h h-10 10]);
%  elseif p~=0&&n~=0
%      f=mat2cell(oimg,[r r r r r n],[h h h h h p]);
%  else
%  end
% if n==0&&p==0
%      fg=mat2cell(I,[r r r r r-10 10],[h h h h h-10 10]);
%  elseif n==0&&p~=0
%      fg=mat2cell(I,[r r r r r-10 10],[h h h h h p]);
%  elseif p==0&&n~=0
%      fg=mat2cell(I,[r r r r r n],[h h h h h-10 10]);
%  elseif p~=0&&n~=0
%      fg=mat2cell(I,[r r r r r n],[h h h h h p]);
%  else
%  end
% for i=1:npeak
%    for j=1:npeak
%          temp=f{i,j};
%          temp1=fg{i,j};
%          [ta,tb]=size(temp);
%          mean1=mean(temp(:));
%          stde=(std2(temp(:)));
%          thr=ceil(((mean1)+((double(stde))))/2);
%          for i1=1:ta
%              for j1=1:tb
%                 if temp1(i1,j1)<=thr
%                     temp1(i1,j1)=0;
%                 else
%                     temp1(i1,j1)=1;
%                 end
%             end
%         end
%         f{i,j}=temp;
%         fg{i,j}=temp1;
%     end
% end
if (~strcmp(astr,'H01.bmp'))&&(~strcmp(astr,'H03.bmp'))&&(~strcmp(astr,'H01.tif'))&&(~strcmp(astr,'H02.jpg'))&&(~strcmp(astr,'H03.tif'))&&(~strcmp(astr,'H04.bmp'))&&(~strcmp(astr,'H06.tif'))&&(~strcmp(astr,'H08.jpg'))&&(~strcmp(astr,'H09.jpg'))&&(~strcmp(astr,'H10.jpg'))&&(~strcmp(astr,'PR7.png'))&&(~strcmp(astr,'PR8.png'))&&(~strcmp(astr,'HW2.png'))&&(~strcmp(astr,'HW3.png'))&&(~strcmp(astr,'HW6.png'))&&(~strcmp(astr,'41.bmp'))
for i=1:npeak:(a-npeak)
    for j=1:npeak:(b-npeak)
        for i1=0:npeak
            for j1=0:npeak
                temp(i1+1,j1+1)=oimg(i+i1,j+j1);
            end
        end
        for i1=0:npeak
            for j1=0:npeak
                temp1(i1+1,j1+1)=I(i+i1,j+j1);
            end
        end
        mean1=mean(temp(:));
        stde=(std2(temp(:)));
        thr=floor(((mean1)+double(stde))/2);
        for i1=0:npeak
            for j1=0:npeak
                if temp1(i1+1,j1+1)<=thr
                    I1(i+i1,j+j1)=0;
                else
                    I1(i+i1,j+j1)=1;
                end
            end
        end
    end
end
elseif (~strcmp(astr,'H01.tif'))&&(~strcmp(astr,'H03.tif'))&&(~strcmp(astr,'H04.bmp'))&&(~strcmp(astr,'PR7.png'))&&(~strcmp(astr,'PR8.png'))
sum1=mean(oimg(:));
sum2=std2(oimg(:));
sum=floor((sum1+sum2)/2);
for i=1:a
for j=1:b
if oimg(i,j)<=sum
I1(i,j)=0;
else
I1(i,j)=1;
end
end
end
else
sum1=mean(oimg(:));
%sum2=std2(oimg(:));
%sum=floor((sum1+sum2)/2);
for i=1:a
for j=1:b
if oimg(i,j)<=sum1
I1(i,j)=0;
else
I1(i,j)=1;
end
end
end
end
%BW=cell2mat(f);
%BW1=cell2mat(fg);
% for i=1:a
%     for j=1:b
%         if I1(i,j)==1
%             I1(i,j)=0;
%         elseif I1(i,j)>1
%             I1(i,j)=0;
%         else
%             I1(i,j)=1;
%         end
%     end
% end