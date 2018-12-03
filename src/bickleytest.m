function []=bickleytest()
gc=0;
bc=0;
pk=[pwd,'\','bickleytest.m'];
[afb,ab]=size(pk);
im=strfind(pk,'bickleytest.m');
for i=1:ab
    if i==im
        break;
    else
        pk1(i)=pk(i);
    end
end 
srcFiles=dir(strcat(pk1,'\db3\gt\*.tiff'));
src1=strcat(pk1,'\db3\gt\');
%srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\objective_evaluation\objective_evaluation\db\*.tiff');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    I{i} = imread(filename);
    gc=gc+1;
end

srcFiles=dir(strcat(pk1,'\db3\*.bmp'));
src1=strcat(pk1,'\db3\');
%srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\objective_evaluation\objective_evaluation\db\*.bmp');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    P{i} = imread(filename);
    bc=bc+1;
end
% srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db3\gt\*.tiff');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db3\gt\',srcFiles(i).name);
%     I{i} = imread(filename);
%     gc=gc+1;
% end
% 
% srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db3\*.bmp');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db3\',srcFiles(i).name);
%     P{i} = imread(filename);
%     bc=bc+1;
% end
sf=0;
sc=0;
for i=1:gc
    temp_obj_eval= my_compute_precision_recall_fmeasure(P{i},I{i});
    fm(i)=temp_obj_eval.Fmeasure;
    if temp_obj_eval.Fmeasure>60
    sf=temp_obj_eval.Fmeasure+sf;
    sc=sc+1;
    end
    psnr(i)=temp_obj_eval.PSNR;
    nrm(i)=(100*temp_obj_eval.NRM);
    mpm(i)=(1000*temp_obj_eval.MPM);
end
fmeas=mean(fm(:));
avgf=double(sf/sc);
psn=mean(psnr(:));
nr=mean(nrm(:));
mp=mean(mpm(:));
f=figure;
data={'OTSU',50.42,7.58,21.41,196.98;'SAUV',64.60,11.62,23.26,28.97;'NIBL',67.71,9.79,9.52,105.17;'BERN',52.97,7.71,18.86,193.35;'GATO',69.13,11.44,21.89,36.57;'LMM',66.44,10.76,17.50,72.08;'BE',34.65,3.54,40.78,370.15;'PROPOSED',avgf,psn,nr,mp};
colnames={'Methods','F-measure(%)','PSNR','NRM(x10^-2)','MPM(x10^-3'};
t=uitable(f,'Data',data,'ColumnName',colnames,'Position',[100 200 450 180]);
txt_title = uicontrol('Style', 'text', 'Position', [200 390 290 20], 'String','EVALUATION RESULTS OF BICKLEY DIARY DATASET');