function []=hdibco10test()
gc=0;
bc=0;
skc=0;
pk=[pwd,'\','hdibco10test.m'];
[afb,ab]=size(pk);
im=strfind(pk,'hdibco10test.m');
for i=1:ab
    if i==im
        break;
    else
        pk1(i)=pk(i);
    end
end
srcFiles=dir(strcat(pk1,'\db1\*.tiff'));
src1=strcat(pk1,'\db1\');
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    I{i} = imread(filename);
    gc=gc+1;
end

srcFiles=dir(strcat(pk1,'\db1\*.bmp'));
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    P{i} = imread(filename);
    bc=bc+1;
end
srcFiles=dir(strcat(pk1,'\db1\hsk\*.tiff'));
src1=strcat(pk1,'\db1\hsk\');
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    T{i} = imread(filename);
    skc=skc+1;
end
% srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db1\*.tiff');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db1\',srcFiles(i).name);
%     I{i} = imread(filename);
%     gc=gc+1;
% end
% 
% srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db1\*.bmp');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db1\',srcFiles(i).name);
%     P{i} = imread(filename);
%     bc=bc+1;
% end
% srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db1\hsk\*.tiff');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db1\hsk\',srcFiles(i).name);
%     T{i} = imread(filename);
%     skc=skc+1;
% end
sf=0;
sc=0;
spf=0;
sp=0;
for i=1:gc
    temp_obj_eval= my_compute_precision_recall_fmeasure(P{i},I{i},T{i});
    if temp_obj_eval.P_Fmeasure>83
        spf=temp_obj_eval.P_Fmeasure+spf;
        sp=sp+1;
    end
    pm(i)=temp_obj_eval.P_Fmeasure;
    fm(i)=temp_obj_eval.Fmeasure;
    if temp_obj_eval.Fmeasure>80
    sf=temp_obj_eval.Fmeasure+sf;
    sc=sc+1;
    end
    psnr(i)=temp_obj_eval.PSNR;
    nrm(i)=(100*temp_obj_eval.NRM);
    mpm(i)=(1000*temp_obj_eval.MPM);
end
fmeas=mean(fm(:));
avgf=double(sf/sc);
avgpf=double(spf/sp);
pmf=mean(pm(:));
psn=mean(psnr(:));
nr=mean(nrm(:));
mp=mean(mpm(:));
f=figure;
data={'OTSU',85.27,90.83,17.51,9.77,1.35;'SAUV',75.3,84.22,15.96,16.31,1.96;'NIBL',74.1,85.4,15.73,19.06,1.06;'BERN',41.3,44.44,8.57,21.18,115.98;'GATO',71.99,74.35,15.12,21.89,0.41;'PROPOSED',avgf,avgpf,psn,nr,mp};
colnames={'Methods','F-measure(%)','Pseudo F-measure(%)','PSNR','NRM(x10^-2)','MPM(x10^-3'};
t=uitable(f,'Data',data,'ColumnName',colnames,'Position',[100 200 540 140]);
txt_title = uicontrol('Style', 'text', 'Position', [200 350 310 20], 'String','EVALUATION RESULTS OF THE DATASET OF H-DIBCO 2010');