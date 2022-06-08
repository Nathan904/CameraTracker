fig = figure;

plot(t,x,'--k','LineWidth', 1);hold on;
plot(t,o, '-r','LineWidth', 2);
%plot(t,c);hold off;

title('\bfTransient and Steady State Response to 5V 30->100kHz sinusoidal chirp signal')
legend('Input','Output','Location','NorthOutside','Orientation','horizontal')
xlabel('\bfTime\rm [s]');
ylabel('\bfVoltage');

% fig=gcf;
% fig = stepMetrics_XY(fig,{[t o]},"Step Response",0.02);