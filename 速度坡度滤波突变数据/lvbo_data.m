%% 远程监控数据中速度计算的坡度存在坡度突变的情况，此函数滤除突变的数据。
clear all
clc
%% 载入Excel文件
path = pwd;
dirOutput = dir(fullfile(path,'*.xlsx'));
fileName = {dirOutput.name};     
filename=fileName{1,1};%%输入数据表格的名称
[excelData,excelStr] = xlsread(filename,1);               %读取原始数据表中的数据：str为数据表中的字符，data为数据表中的数据
[excelRow,excelColumn] = size(excelData);        %%获取数据表中的行列个数
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
imname = filename(1:i-1); %% imname为不带后缀文件名称  仪表车速计算坡度		GPS车速计算坡度	GPS里程计算坡度

junfangFile = strcat(imname,'_lvbo.xlsx'); %%组成带excle文件名的podu文件名
colname={'序号','时间','仪表车速计算坡度','累计里程计算坡度','GPS车速计算坡度','车速','行驶距离'};    %%增加每一列的数据名称
xlswrite(junfangFile, colname, 'sheet1','A1');
xlswrite(junfangFile, excelData, 'sheet1','A2');
figure;
plot(excelData(:,3),'r-');
hold on;
plot(excelData(:,5),'b-');