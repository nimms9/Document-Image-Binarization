function BW1=iresultbinary1()
I=imread('H04.bmp');
I=rgb2gray(I);
I=double(I);
[ewd,peak]=ibinary1();
oimg=ewd;
oimg1=ewd;
npeak=peak+2;
[a,b]=size(oimg);
newp=npeak-1;
r=floor(a/newp);
n=uint16(a)-(newp*r);
h=floor(b/newp);
p=uint16(b)-(newp*h);
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
%     fg=mat2cell(I,[r r r r r r r r-10 10],[h h h h h h h h-10 10]);
% elseif n==0&&p~=0
%     fg=mat2cell(I,[r r r r r r r r-10 10],[h h h h h h h h p]);
% elseif p==0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r n],[h h h h h h h h-10 10]);
% elseif p~=0&&n~=0
%     fg=mat2cell(I,[r r r r r r r r n],[h h h h h h h h p]);
% else
% end
if n==0&&p==0
    f=mat2cell(oimg,[r r r r r r r r r-10 10],[h h h h h h h h h-10 10]);
elseif n==0&&p~=0
    f=mat2cell(oimg,[r r r r r r r r r-10 10],[h h h h h h h h h p]);
elseif p==0&&n~=0
    f=mat2cell(oimg,[r r r r r r r r r n],[h h h h h h h h h-10 10]);
elseif p~=0&&n~=0
    f=mat2cell(oimg,[r r r r r r r r r n],[h h h h h h h h h p]);
else
end
if n==0&&p==0
    fg=mat2cell(I,[r r r r r r r r r-10 10],[h h h h h h h h h-10 10]);
elseif n==0&&p~=0
    fg=mat2cell(I,[r r r r r r r r r-10 10],[h h h h h h h h h p]);
elseif p==0&&n~=0
    fg=mat2cell(I,[r r r r r r r r r n],[h h h h h h h h h-10 10]);
elseif p~=0&&n~=0
    fg=mat2cell(I,[r r r r r r r r r n],[h h h h h h h h h p]);
else
end
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
for i=1:npeak
   for j=1:npeak
         temp=f{i,j};
         temp1=fg{i,j};
         [ta,tb]=size(temp);
         mean1=mean(temp(:));
         stde=(std2(temp(:)));
         thr=floor(((mean1)+((double(stde))))/2);
         for i1=1:ta
             for j1=1:tb
                if temp1(i1,j1)<=thr
                    temp1(i1,j1)=0;
                else
                    temp1(i1,j1)=1;
                end
            end
        end
        f{i,j}=temp;
        fg{i,j}=temp1;
    end
end
BW=cell2mat(f);
BW1=cell2mat(fg);