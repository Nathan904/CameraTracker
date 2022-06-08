function SimOut = runSim(config)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here



load_system(config.file);
set_param(gcs,'StopTime',config.stopTime);
set_param(gcs,'MaxStep',config.maxStep);
SimOut = sim(config.file);


end