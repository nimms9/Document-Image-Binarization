clear;
clc;
BW1=iresultbinary();
kp=module_2();
edg=kp;
edp=BW1;
[a,b]=size(edg);
[ta,tb]=size(edp);
edp1=edp;
flag=0;
c1=0;c2=0;c3=0;c4=0;c5=0;c6=0;c7=0;c8=0;c=0;
% ct=0;
% ctf=0;
% for i=2:(a-1)
%     for j=2:(b-1)
%         if edg(i,j)==1
%         a=edg(i-1,j);
%         b=edg(i+1,j);
%         c=edg(i,j-1);
%         d=edg(i,j+1);
%         e=edg(i-1,j-1);
%         f=edg(i+1,j+1);
%         g=edg(i+1,j-1);
%         h=edg(i-1,j+1);
%         if (a==0)&&(b==0)&&(c==0)&&(d==0)&&(e==0)&&(f==0)&&(g==0)&&(h==0)
%             edp(i,j)=0;
%             ct=ct+1;
%         end
%         ctf=ctf+1;
%         end
%     end
% end
% edp=bwareaopen(edp,3);
for i=2:(a-1)
    for j=2:(b-1)
        if edp(i,j)==1
            a=edp(i-1,j);
            b=edp(i+1,j);
            c=edp(i,j-1);
            d=edp(i,j+1);
            if (a==0&&b==0)&&(c==1&&d==1)
                edp(i-1,j)=1;
                edp(i+1,j)=1;
                edp(i,j-1)=0;
                edp(i,j+1)=0;
                c=c+1;
            elseif (a==1&&b==1)&&(c==0&&d==0)
                edp(i-1,j)=0;
                edp(i+1,j)=0;
                edp(i,j-1)=1;
                edp(i,j+1)=1;
                c1=c1+1;
            elseif (a==1&&b==1&&c==1&&d==1)
                edp(i-1,j)=0;
                edp(i+1,j)=0;
                edp(i,j-1)=0;
                edp(i,j+1)=0;
                c2=c2+1;
            elseif (a==0&&b==0&&c==0&&d==0)
                edp(i-1,j)=1;
                edp(i+1,j)=1;
                edp(i,j-1)=1;
                edp(i,j+1)=1;
                c3=c3+1;
            elseif a==0&&b==0
                edp(i-1,j)=1;
                edp(i+1,j)=1;
                c4=c4+1;
            elseif a==1&&b==1
                edp(i-1,j)=0;
                edp(i+1,j)=0;
                c5=c5+1;
            elseif c==0&&d==0
                edp(i,j-1)=1;
                edp(i,j+1)=1;
                c6=c6+1;
            elseif c==1&&d==1
                edp(i,j-1)=0;
                edp(i,j+1)=0;
                c7=c7+1;
            else
            end
            c8=c8+1;
        end
    end
end
for i=2:(a-1)
    for j=2:(b-1)
        if edp(i,j)==1
        a=edp(i-1,j);
        b=edp(i+1,j);
        c=edp(i,j-1);
        d=edp(i,j+1);
        e=edp(i-1,j-1);
        f=edp(i+1,j+1);
        g=edp(i+1,j-1);
        h=edp(i-1,j+1);
        if (a==0&&b==0&&c==0&&d==0&&e==0&&f==0&&g==0&&h==0)
            edp(i,j)=0;
        end
        elseif edp(i,j)==0
        a=edp(i-1,j);
        b=edp(i+1,j);
        c=edp(i,j-1);
        d=edp(i,j+1);
        e=edp(i-1,j-1);
        f=edp(i+1,j+1);
        g=edp(i+1,j-1);
        h=edp(i-1,j+1);
        if (a==1&&b==1&&c==1&&d==1&&e==1&&f==1&&g==1&&h==1)
            edp(i,j)=1;
        end
        else
        end
    end
end
imshow(edp);
figure;
imshow(edp1);