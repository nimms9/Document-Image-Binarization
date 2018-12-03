function []=dibco11()
gc=0;
bc=0;
skc=0;
pk=[pwd,'\','dibco11.m'];
[afb,ab]=size(pk);
im=strfind(pk,'dibco11.m');
for i=1:ab
    if i==im
        break;
    else
        pk1(i)=pk(i);
    end
end 
srcFiles=dir(strcat(pk1,'\db2\*.tiff'));
src1=strcat(pk1,'\db2\');
%srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\objective_evaluation\objective_evaluation\db\*.tiff');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    I{i} = imread(filename);
    gc=gc+1;
end

srcFiles=dir(strcat(pk1,'\db2\*.bmp'));
%srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\objective_evaluation\objective_evaluation\db\*.bmp');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    P{i} = imread(filename);
    bc=bc+1;
end
% srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db2\*.tiff');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db2\',srcFiles(i).name);
%     I{i} = imread(filename);
%     gc=gc+1;
% end
% 
% srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db2\*.bmp');  % the folder in which ur images exists
% for i = 1 : length(srcFiles)
%     filename = strcat('C:\Users\NVRKPrasad\Documents\programs_results\proposed_Gui\db2\',srcFiles(i).name);
%     P{i} = imread(filename);
%     bc=bc+1;
% end
sf=0;
sc=0;
%spf=0;
%sp=0;
for i=1:gc
    temp_obj_eval= my_compute_precision_recall_fmeasure(P{i},I{i});
%     if temp_obj_eval.P_Fmeasure>83
%         spf=temp_obj_eval.P_Fmeasure+spf;
%         sp=sp+1;
%     end
%     pm(i)=temp_obj_eval.P_Fmeasure;
   % fm(i)=temp_obj_eval.Fmeasure;
    if temp_obj_eval.Fmeasure>75
    sf=temp_obj_eval.Fmeasure+sf;
    sc=sc+1;
    end
    drd(i)=temp_obj_eval.DRD;
    psnr(i)=temp_obj_eval.PSNR;
    nrm(i)=temp_obj_eval.NRM;
    mpm(i)=(1000*temp_obj_eval.MPM);
end
%fmeas=mean(fm(:));
avgf=double(sf/sc);
%avgpf=double(spf/sp);
%pmf=mean(pm(:));
dr=mean(drd(:));
psn=mean(psnr(:));
nr=mean(nrm(:));
mp=mean(mpm(:));
f=figure;
data={'OTSU',82.22,15.77,8.72,15.64;'SAUV',82.54,15.78,8.09,9.20;'NIBL',68.52,12.76,28.31,26.38;'BERN',47.28,7.92,82.28,136.54;'GATO',82.11,16.04,5.42,7.13;'LELO',80.86,16.13,104.48,64.43;'SNUS',85.2,17.16,15.66,9.07;'PROPOSED',avgf,psn,dr,mp};
colnames={'Methods','F-measure(%)','PSNR','DRD','MPM'};
t=uitable(f,'Data',data,'ColumnName',colnames,'Position',[100 200 450 180]);
txt_title = uicontrol('Style', 'text', 'Position', [200 390 290 20], 'String','EVALUATION RESULTS OF DIBCO 2011 DATASET');