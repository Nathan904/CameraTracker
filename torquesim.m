%Load Parameters
Parameters;
Km = p.Km;
Kb = p.Kb;
Kf = p.Kf;
Ra = p.Ra;
Jl = p.Jl;
Jm = p.Jm;
N  = p.N;
Kp = p.Kp;
Ki = p.Ki;
Kd = p.Kd;
%Kfilter = p.Kfilter;

% Create Transfer Functions
phi = ((Jl/(N^2))+Jm);
tau = Kf;
num = 1;
den = [phi tau];

%   Create Plant Transfer Function
G = tf(num,den);

config.file = 'Final_Model_3';
config.maxStep = '0.001';
config.stepTime = 0;
config.stopTime = "15";
config.stepSize = 0;

peak=0;
config.Td = 1;
while(1)
    config.Td = config.Td + 1;
    peak = torque_sim(config);%run sim
    if(peak >= 3)
        max_torque = config.Td;
        sprintf("Max Found")
        break
    else
        fprintf("Max not Found. Current Peak and Torque:\n");
        peak
        config.Td
    end
end