syms R_1 R_2 C_1 C_2 Kp Ki Kd positive

assume((1e-12) < C_1);
assume(C_1 < (11e-6));
assume((1e-12) < C_2);
assume(C_2 < (11e-6));
assume((1) < R_1);
assume(R_1 < (2*11e6));
assume((1) < R_2);
assume(R_2 < (2*11e6));
eq1 = Kp == (R_2*C_2 + R_1*C_1)/(R_1*C_2);
eq2 = Ki == 1/(R_1*C_2);
eq3 = Kd == C_1*R_2;
eq = [eq1 eq2 eq3];
S = solve(eq,[Kp Ki Kd],"ReturnConditions",true)
S.conditions

%%