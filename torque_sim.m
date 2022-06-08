function maxValue = torque_sim(config)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

SimOut = sim(config.file);

maxValue = max(SimOut.SimData.signals.values(:,3));

end