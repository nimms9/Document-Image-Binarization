clear;
clc;
I=imread('H04.bmp');
I=rgb2gray(I);
I=double(I);
[ewd,peak]=ibinary();
oimg=ewd;
oimg1=ewd;
npeak=ceil((3.5)*peak);
%npeak=peak+2;
%npeak=peak+8;
[a,b]=size(oimg);
I1=I;
ce1=1;
ce2=1;
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
%          thr=floor(((mean1)+((double(stde))))/2);
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
for i=1:npeak:(a-(npeak))
    for j=1:npeak:(b-(npeak))
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
for i=1:a
    for j=1:b
        if I1(i,j)>1
            if ce1==1
            ie1=j;
            ce1=0;
            end
            if I1(i,1)>1&&ce2==1
            ie2=i;
            ce2=0;
            end
        end
    end
end
% I2=I1;
% sub1=a-ie2;
% sub1=sub1+1;
% sub2=b-ie1;
% sub2=sub2+1;
% sub2=sub2-(sub1+1);
for i=1:npeak:(a-(npeak))
    for j=1:npeak:(b-(npeak))
%         for i1=0:npeak
%             for j1=0:npeak
%                 temp2(i1+1,j1+1)=I1(i+i1,j+j1);
%             end
%         end
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
                    I2(i+i1,j+j1)=0;
                else
                    I2(i+i1,j+j1)=1;
                end
            end
        end
    end
end
%BW=cell2mat(f);
%BW1=cell2mat(fg);
%imshow(BW1);
imshow(I1);
figure;
imshow(oimg1);
figure;
imshow(uint8(I));