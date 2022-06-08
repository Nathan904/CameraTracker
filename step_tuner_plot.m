fig = figure;

subplot(2,1,1);
plot(t,x,'--k','LineWidth', 1);hold on;
plot(t,o, '-r','LineWidth', 1);%hold off;
ylim([config.stepSize*0.75 max(o)*1.25]);
xlim([config.stepTime config.stepTime+1.5]);
legend('Input','Output','Location','NorthOutside','Orientation','horizontal')
xlabel('\bfTime\rm [s]');
ylabel('\bfVoltage');


subplot(2,1,2)
plot(t,x,'--k','LineWidth', 1);hold on;
plot(t,o, '-r','LineWidth', 2);hold off;

legend('Input','Output','Location','NorthOutside','Orientation','horizontal')
xlabel('\bfTime\rm [s]');
ylabel('\bfVoltage');

fig=gcf;
fig = stepMetrics_XY(fig,{[t o]},"Step Response",0.02);