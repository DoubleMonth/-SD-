%% Զ�̼���������ٶȼ�����¶ȴ����¶�ͻ���������˺����˳�ͻ������ݡ�
clear all
clc
%% ����Excel�ļ�
path = pwd;
dirOutput = dir(fullfile(path,'*.xlsx'));
fileName = {dirOutput.name};     
filename=fileName{1,1};%%�������ݱ�������
[excelData,excelStr] = xlsread(filename,1);               %��ȡԭʼ���ݱ��е����ݣ�strΪ���ݱ��е��ַ���dataΪ���ݱ��е�����
[excelRow,excelColumn] = size(excelData);        %%��ȡ���ݱ��е����и���
for i=2:excelRow-1
    if (excelData(i,3)-excelData(i-1,3))>4
        excelData(i,3) = excelData(i-1,3);
    end
end

for i=2:excelRow-1
    if (excelData(i,5)-excelData(i-1,5))>4
        excelData(i,5) = excelData(i-1,5);
    end
end

i = find('.'==filename);
imname = filename(1:i-1); %% imnameΪ������׺�ļ�����  �Ǳ��ټ����¶�		GPS���ټ����¶�	GPS��̼����¶�

junfangFile = strcat(imname,'_lvbo.xlsx'); %%��ɴ�excle�ļ�����podu�ļ���
colname={'���','ʱ��','�Ǳ��ټ����¶�','�ۼ���̼����¶�','GPS���ټ����¶�','����','��ʻ����'};    %%����ÿһ�е���������
xlswrite(junfangFile, colname, 'sheet1','A1');
xlswrite(junfangFile, excelData, 'sheet1','A2');
figure;
plot(excelData(:,3),'r-');
hold on;
plot(excelData(:,5),'b-');