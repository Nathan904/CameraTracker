plot(t,rad2deg(o./(6/pi)), '-r',t,0,'--k','LineWidth', 2);hold on;
%plot(t,td,'-b','LineWidth', 1);
hold off;
xlim([config.torqueStart-0.1 str2double(config.stopTime)])
%ylim([.9 1.2]);
legend('System Output','Location','NorthOutside','Orientation','horizontal')
title("353 N*m Torque Disturbance Steady-State Rejection")
xlabel('\bfTime\rm [s]');
ylabel('\bfCamera Angle\rm [deg.]');