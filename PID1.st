MOV(PID1.Control_ON, REAL_TO_INT( Proces1.y_k ),PID1.PV); 
PID( PID1.Control_ON, PID1.SV , PID1.PV , PID1.params[0] , PID1.MV); 
EMOV(PID1.Control_ON, INT_TO_REAL(PID1.MV), Proces1.u_k);