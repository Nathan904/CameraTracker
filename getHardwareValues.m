function H = getHardwareValues(Kp,Ki,Kd)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
syms R_1 R_2 C_1 C_2

eq1 = Kp == (R_2*C_2 + R_1*C_1)/(R_1*C_2);
eq2 = Ki == 1/(R_1*C_2);
eq3 = Kd == C_1*R_2;
eq4 = ((1e-12) < C_1);
eq5 = (C_1 < (11e-6));
eq6 = ((1e-12) < C_2);
eq7 = (C_2 < (11e-6));
eq8 = ((1) <= R_1);
eq9 = (R_1 < (2*11e6));
eq10 = ((1) <= R_2);
eq11 = (R_2 < (2*11e6));
eq = [eq1 eq2 eq3 eq4 eq5 eq6 eq7 eq8 eq9 eq10 eq11];
S = solve(eq,[R_1 R_2 C_1 C_2]);

H.R1 = S.R_1;
H.R2 = S.R_2;
H.C1 = S.C_1;
H.C2 = S.C_2;

end