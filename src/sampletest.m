clear;
clc;
gc=0;
bc=0;
pk=[pwd,'\','dibco9.m'];
[afb,ab]=size(pk);
im=strfind(pk,'dibco9.m');
for i=1:ab
    if i==im
        break;
    else
        pk1(i)=pk(i);
    end
end
 disp(pk1);  
srcFiles=dir(strcat(pk1,'\db\*.tiff'));
src1=strcat(pk1,'\db\');
%srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\objective_evaluation\objective_evaluation\db\*.tiff');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    I{i} = imread(filename);
    gc=gc+1;
end

srcFiles=dir(strcat(pk1,'\db\*.bmp'));
%srcFiles = dir('C:\Users\NVRKPrasad\Documents\programs_results\objective_evaluation\objective_evaluation\db\*.bmp');  % the folder in which ur images exists
for i = 1 : length(srcFiles)
    filename = strcat(src1,srcFiles(i).name);
    P{i} = imread(filename);
    bc=bc+1;
end
sf=0;
sc=0;
snr=0;
snc=0;
for i=1:gc
    temp_obj_eval= my_compute_precision_recall_fmeasure(P{i},I{i});
    fm(i)=temp_obj_eval.Fmeasure;
    if temp_obj_eval.Fmeasure>70
    sf=temp_obj_eval.Fmeasure+sf;
    sc=sc+1;
    end
    psnr(i)=temp_obj_eval.PSNR;
    if temp_obj_eval.NRM<20
        snr=(100*temp_obj_eval.NRM)+snr;
        snc=snc+1;
    end
    nrm(i)=(100*temp_obj_eval.NRM);
    mpm(i)=(1000*temp_obj_eval.MPM);
end
fmeas=mean(fm(:));
avgf=double(sf/sc);
psn=mean(psnr(:));
nr=mean(nrm(:));
nr1=double(snr/sc);
mp=mean(mpm(:));
f=figure;
data={'OTSU',78.72,15.34,5.77,13.3;'SAUV',85.41,16.39,6.94,3.2;'NIBL',55.82,9.89,16.4,61.5;'BERN',52.48,8.89,14.29,113.8;'GATO',85.25,16.5,10,0.7;'OUR_METHOD',avgf,psn,nr,mp};
colnames={'Methods','F-measure(%)','PSNR','NRM(x10^-2)','MPM(x10^-3'};
t=uitable(f,'Data',data,'ColumnName',colnames,'Position',[100 200 420 140]);
txt_title = uicontrol('Style', 'text', 'Position', [150 350 310 20], 'String','EVALUATION RESULTS OF THE DATASET OF DIBCO 2009');