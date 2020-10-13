%% INFORMATION
% Purpose:  display slice timing data - acquisition order/times 
% Ruth Shaffer May 2018


%% ADD PATHS
% downloaded parse_json script from MathWorks/ add path to it
% https://www.mathworks.com/matlabcentral/fileexchange/20565-json-parser
addpath('/path_to_MATLAB/MATLAB/parse_json')

% for graphing legend
addpath('/path_to_MATLAB/MATLAB/simonhenin-columnlegend-fa0aabf')
%% SET UP TIMING FILE PATHS

fileOrder = {'Slice44_Inter_MaxDelay_10','Slice44_Inter_Continuous_18','Slice44_Ascen_MaxDelay_14','Slice44_Ascen_Continuous_22','Slice48_Inter_MaxDelay_12','Slice48_Inter_Continuous_20','Slice48_Ascen_MaxDelay_16','Slice48_Ascen_Continuous_24'};
pathToFiles = '/path_to_json_files_output_from_DCM2NIIX';

indexCount = 1;
for i=fileOrder
    file = i{1}
    infile{indexCount} = sprintf('%s/%s.json',pathToFiles,file);
    indexCount=indexCount+1;
end
%% IMPORT JSON FILE AND ORGANIZE

for i=1:length(infile)
  fid{i} = fopen(infile{i});
  raw{i} = fread(fid{i},inf);
  str{i} = char(raw{i}');
  fclose(fid{i});
  
  % convert it to json structure in matlab
  matlab_results{i} = parse_json(str{i});
  % convert from cells
  slice_timings{i} = cell2mat(matlab_results{i}{1}.SliceTiming(:)); 

end

%% SET X VALUES
xValues_44Slice=0:43;
xValues_48Slice=0:47;

%% PLOT THE FIGURE

%Create Figure dimensions
sz = [800 1800]; % figure size
screensize = get(groot,'ScreenSize');
xpos = ceil((screensize(3)-sz(2))/2); % center the figure on the
ypos = ceil((screensize(4)-sz(1))/2); % center the figure on the
figHandle=figure('position',[xpos, ypos, sz(2), sz(1)]);

%Create Figure
subplot(2,2,1)
plot(xValues_44Slice,slice_timings{1},'-or',xValues_44Slice,slice_timings{2},'-ob');
title({'Slice timing; 44 slices; MB=4 (11 shots); Interleaved; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Slice acquisition time','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 43]);

%Create Figure
subplot(2,2,2)
plot(xValues_44Slice,slice_timings{3},'-or',xValues_44Slice,slice_timings{4},'-ob');
title({'Slice timing; 44 slices; MB=4 (11 shots); Ascending; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Slice acquisition time','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 43]);


%Create Figure
subplot(2,2,3)
plot(xValues_48Slice,slice_timings{5},'-or',xValues_48Slice,slice_timings{6},'-ob');
title({'Slice timing; 48 slices; MB=4 (12 shots); Interleaved; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Slice acquisition time','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 47]);

%Create Figure
subplot(2,2,4)
plot(xValues_48Slice,slice_timings{7},'-or',xValues_48Slice,slice_timings{8},'-ob');
title({'Slice timing; 48 slices; MB=4 (12 shots); Ascending; Sparse vs. Continuous';''},'fontsize',14)
xlabel('Slice number (starts at 0)','fontsize',14)
ylabel('Slice acquisition time','fontsize',14)
set(gca,'XTick',[0,10,20,30,40]);
xlim([0 47]);

%Legend
hL = columnlegend(2,{'Sparse','Continuous'})
newPositionFL = [0.43 0 0.17 0.08];
newUnitsFL = 'normalized';
set(hL,'Position', newPositionFL,'Units', newUnitsFL);

 %% OUTPUT FIGURE
 name='SLICE_TIMING_GRAPHS_ALL' % set for each fig
 name=[name,'.png']
 set(figHandle,'Units','Inches');
 pos = get(figHandle,'Position');
 set(figHandle,'PaperPositionMode','Auto','PaperUnits','Inches','PaperSize',[pos(3), pos(4)])
 print(figHandle,'-dpng','-r0',name)

