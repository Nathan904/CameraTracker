%Load Parameters
Parameters;
Km = p.Km;
Kb = p.Kb;
Kf = p.Kf;
Ra = p.Ra;
Jl = p.Jl*1000;
Jm = p.Jm;
N  = p.N;
%Kp = p.Kp;
%Ki = p.Ki;
%Kd = p.Kd;
%Kfilter = p.Kfilter;

% Create Transfer Functions
phi = ((Jl/(N^2))+Jm);
tau = Kf;
num = 1;
den = [phi tau];

%   Create Plant Transfer Function
G = tf(num,den);

config.torqueStart = 0;
config.torqueEnd = 0;
config.Td = 0;

config.file = 'Final_Model_3';
SimOut = runSim(config);
t = SimOut.SimData.time;
x = SimOut.SimData.signals.values(:,1);
e = SimOut.SimData.signals.values(:,2);
o = SimOut.SimData.signals.values(:,3);
td= SimOut.SimData.signals.values(:,4);
tm= SimOut.SimData.signals.values(:,5);

