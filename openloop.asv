%Load Parameters
Parameters;
Km = p.Km;
Kb = p.Kb;
Kf = p.Kf;
Ra = p.Ra;
%Jl = p.Jl;
Jm = p.Jm;
N  = p.N;
Kp = p.Kp;
Ki = p.Ki;
Kd = p.Kd;
Amp = p.Amp;
syms Jl
% Create Transfer Functions
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

% Feedback transfer function
%H = tf(6,[pi*N 0]);

T = sisoinit(1);
T.G.Value = G;
T.C.Value = C;
%T.H.Value = H;
T.OL1.View = {'bode'};


%%
sisotool(T);