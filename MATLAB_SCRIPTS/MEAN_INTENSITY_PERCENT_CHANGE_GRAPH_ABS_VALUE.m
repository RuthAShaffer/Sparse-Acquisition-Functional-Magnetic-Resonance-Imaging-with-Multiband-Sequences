%% INFORMATION
% Purpose:  Display slice intensity data (absolute value of percent change).
% Ruth Shaffer May 2018


%% for graphing legend
addpath('/path_to_MATLAB/MATLAB/simonhenin-columnlegend-fa0aabf')

%% import intensity data

fileOrder = {'sliceBySliceMean_Slice44_Inter_MaxDelay_10_FOR_GRAPHING_NO_EMPTY_DATA_SLICES','sliceBySliceMean_Slice44_Inter_Continuous_18_FOR_GRAPHING_NO_EMPTY_DATA_SLICES'};

indexCount = 1;
for i=fileOrder
    i2 = i{1}
    infile{indexCount} = sprintf('/path_to_slice_intensity_files/%s.txt',i2);
    indexCount=indexCount+1;
end

%% load the files

% example original: data2 = load(infile2, '-ascii');
for i=1:2
  data{i} = load(infile{i}, '-ascii');
end

%% set the x and y coordinates

% example original:
% x1 = data1(:,1); % column 1 of the data text file is assigned the variable x
% y1 = data1(:,2); % column 2 is assigned the variable y

for i=1:2
  x_temp{i} = data{i}(:,1);
  y_temp{i} = data{i}(:,2);
end

%% Convert to percent change (and x to correspond)

for i=1:2
    x{i} = x_temp{i}(1:end-1,:)+2;
    y{i} = abs(100*(diff(y_temp{i})./y_temp{i}(1:end-1,:)));
end

%% plot the figures

%Create Figure dimensions
sz = [800 1800]; % figure size
screensize = get(groot,'ScreenSize');
xpos = ceil((screensize(3)-sz(2))/2); % center the figure on the
ypos = ceil((screensize(4)-sz(1))/2); % center the figure on the
figHandle=figure('position',[xpos, ypos, sz(2), sz(1)]);

%Create Figure
%subplot(2,2,1);
plot(x{1},y{1},'-or',x{2},y{2},'-ob');
title('Abs Val % Change - Slice intensity 44 slices, MB=4 - Interleaved - 0% Gap','fontsize',14)
ylabel('Abs Val % Change','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 43]);
ylim([0 15]);


%Legend
hL = columnlegend(2,{'Maxed out delay in TR','Continuous Acquisition'});
newPositionFL = [0.43 .44 0.17 0.08];
newUnitsFL = 'normalized';
set(hL,'Position', newPositionFL,'Units', newUnitsFL);

%Output Figure 
name='graphs_phantomQAdilate0_CONTIN_VS_DELAY_YAxis0to15_percentChangeAbsoluteValue' % set for each fig
name=[name,'.pdf']
set(figHandle,'Units','Inches');
pos = get(figHandle,'Position');
set(figHandle,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])

%print(figHandle,'-dpdf','-r0',name)
