%% INFORMATION
% Purpose:  display Slice intensity data
% Ruth Shaffer May 2018

%% ADD PATH
addpath('/path_to_MATLAB/MATLAB/simonhenin-columnlegend-fa0aabf')

%% SET UP PATH TO FILES

fileOrder = {'Slice44_Inter_MaxDelay_10','Slice44_Inter_Continuous_18','Slice44_Ascen_MaxDelay_14','Slice44_Ascen_Continuous_22','Slice48_Inter_MaxDelay_12','Slice48_Inter_Continuous_20','Slice48_Ascen_MaxDelay_16','Slice48_Ascen_Continuous_24'};
pathToFiles = '/path_to_slice_intensity_files';

indexCount = 1;
for i=fileOrder
    file = i{1}
    infile{indexCount} = sprintf('%s/sliceBySliceMean_%s_FOR_GRAPHING_NO_EMPTY_DATA_SLICES.txt',pathToFiles,file);
    indexCount=indexCount+1;
end

%% LOAD FILES
for i=1:length(infile)
    data{i} = load(infile{i}, '-ascii');
    
    % set x and y coordinates
    x{i} = data{i}(:,1); % column 1 of the data text file is assigned the variable x
    y{i} = data{i}(:,2); % column 2 is assigned the variable y

end

%% PLOT THE FIGURE

%Create Figure dimensions
sz = [800 1800]; % figure size
screensize = get(groot,'ScreenSize');
xpos = ceil((screensize(3)-sz(2))/2); % center the figure on the
ypos = ceil((screensize(4)-sz(1))/2); % center the figure on the
figHandle=figure('position',[xpos, ypos, sz(2), sz(1)]);

%Create Figure
subplot(2,2,1);
plot(x{1},y{1},'-or',x{2},y{2},'-ob');
title({'Slice intensity; 44 slices; MB=4 (11 shots); Interleaved; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Mean slice intensity','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 43]);

%Create Figure
subplot(2,2,2);
plot(x{3},y{3},'-or',x{4},y{4},'-ob');
title({'Slice intensity; 44 slices; MB=4 (11 shots); Ascending; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Mean slice intensity','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 43]);

%Create Figure
subplot(2,2,3);
plot(x{5},y{5},'-or',x{6},y{6},'-ob');
title({'Slice intensity; 48 slices; MB=4 (12 shots); Interleaved; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Mean slice intensity','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 47]);

%Create Figure
subplot(2,2,4);
plot(x{7},y{7},'-or',x{8},y{8},'-ob');
title({'Slice intensity; 48 slices; MB=4 (12 shots); Ascending; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Mean slice intensity','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 47]);

% Legend
 hL = columnlegend(2,{'Sparse','Continuous'})
 newPositionFL = [0.43 0 0.17 0.08];
 newUnitsFL = 'normalized';
 set(hL,'Position', newPositionFL,'Units', newUnitsFL);
 
%% Output Figure 
name='SLICE_INTENSITY_GRAPHS';
name=[name,'.png']
set(figHandle,'Units','Inches');
pos = get(figHandle,'Position');
set(figHandle,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
print(figHandle,'-dpng','-r0',name)



  

