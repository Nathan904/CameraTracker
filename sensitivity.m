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

% % Create Transfer Functions
% phi = ((Jl/(N^2))+Jm);
% tau = Kf;
% num = 1;
% den = [phi tau];
% 
% %   Create Plant Transfer Function
% G = tf(num,den);

config.torqueStart = 0;
config.torqueEnd = 0;
config.Td = 0;

config.file = 'Final_Model_33';
load_system(config.file);
sllin = slLinearizer(config.file);  
jl_range = linspace(0.75*Jl,1.75*Jl);
params(1).Name = 'Jl';
params(1).Value = jl_range;
sllin.Parameters = params;
addPoint(sllin,{'output'})
mdl_index = params(1).Value == max(jl_range);
[sys,info] = getSensitivity(sllin,'output',mdl_index)

% SimOut = runSim(config);
% t = SimOut.SimData.time;
% x = SimOut.SimData.signals.values(:,1);
% e = SimOut.SimData.signals.values(:,2);
% o = SimOut.SimData.signals.values(:,3);
% td= SimOut.SimData.signals.values(:,4);
% tm= SimOut.SimData.signals.values(:,5);

%%
phi = ((Jl/(N^2))+Jm);
tau = Kf;
num = 1;
den = [phi tau];

%   Create Plant Transfer Function
M = tf(num,den);

% Plant transfer function (CL)
G1 = (Km*M)/(Ra + Km*Kb*M);
G2 = tf(6*pi,[N 0]);
G = G1*G2;
% PID controller transfer function
C = tf([-p.Amp*Kd -p.Amp*Kp -p.Amp*Ki], [1 0]);
X1 = AnalysisPoint("X1");
T = feedback(G*C*X1,1);
S = getSensitivity(T,'X1')
%%

sym s Jl

% Create Transfer Functions
phi = ((Jl/(N^2))+Jm);
tau = Kf;
num = 1;
den = [phi tau];

%   Create Plant Transfer Function
G = tf(num,den);




































