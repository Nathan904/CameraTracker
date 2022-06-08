function new_fig = stepMetrics_XY(figure1, Data, Titles, settlingtime)
%STEPMETRICS(sys, SettlingTimeThreshold)
%  figure: Figure to add metrics to
%  sys:  cell array of transfer functions
%  SettlingTimeThreshold: Percentage for Settling Time (Ex. .02)
%  

if nargin > 3
  SettlingTimeThreshold = settlingtime;
else
  SettlingTimeThreshold = .02;
end

[~,j] = size(Data);
figure1();
%subplot(2,2,2);
for i=1:1:j
  d = cell2mat(Data(i));
        sim(i) = stepinfo(d(1:end,2),d(1:end,1),SettlingTimeThreshold=settlingtime,RiseTimeLimits=[0 1]);
% Create textbox
% Metrics for Sim
annotation(figure1,'textbox',...
    [0.75+(0.1*(i-1)) 0.3 0.09 0.039],...
    'Color',[0 0 0],...
    'String',{[Titles(i)], ...
    ['\bf%OS: \rm', num2str(sim(i).Overshoot,4)],...
    ['\bft_r: \rm', num2str(sim(i).RiseTime,4)],...
    ['\bft_p: \rm', num2str(sim(i).PeakTime,4)],...
    ['\bft_{',num2str(SettlingTimeThreshold*100),'%}\rm', num2str(sim(i).SettlingTime,4)]},...
    'FitBoxToText','on',...
    'BackgroundColor',[1 1 1]);
end

new_fig = figure1;
