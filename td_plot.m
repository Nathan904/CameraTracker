plot(t,rad2deg(o./(6/pi)), '-r',t,(.1.*td),'-b',t,0,'--k','LineWidth', 2);hold on;
%plot(t,td,'-b','LineWidth', 1);
hold off;
xlim([config.torqueStart-0.1 config.torqueEnd+2])
%ylim([.9 1.2]);
legend('System Output','Torque Disturbance','Location','NorthOutside','Orientation','horizontal')
title("20 N*m Torque Disturbance Rejection")
xlabel('\bfTime\rm [s]');
ylabel('\bfCamera Angle\rm [deg.]');