//Regulator PID na podstawie rownania roznicowego 
IF PIDR_s.Control_ON THEN
    
    //Wyliczenie parametrow 
    PIDR_s.Rp0:=PIDR_s.K_gain*(1.0+(PIDR_s.sampling_time/(2.0*PIDR_s.TI)
    )+PIDR_s.TD/PIDR_s.sampling_time);//r0 = K*( 1+(Tp/(2*Ti))+Td/Tp ); 
    PIDR_s.Rp1 := PIDR_s.K_gain*((PIDR_s.sampling_time/(2.0*PIDR_s.TI))-
    (2.0*PIDR_s.TD/PIDR_s.sampling_time)-1);//r1 = K*( (Tp/(2*Ti))-(2*Td/Tp)-1 ); 
    PIDR_s.Rp2:=PIDR_s.K_gain*PIDR_s.TD/PIDR_s.sampling_time;//K*Td/Tp 
    //Wyliczenie uchybu regulacji i przesuniecie historii 
    PIDR_s.Ep2 := PIDR_s.Ep1; 
    PIDR_s.Ep1 := PIDR_s.Ep0; 
    PIDR_s.Ep0 := PIDR_s.SV - PIDR_s.PV; 
    
    //Obliczenie sterowania 
    PIDR_s.MV := PIDR_s.Rp2*PIDR_s.Ep2 + PIDR_s.Rp1*PIDR_s.Ep1 + 
    PIDR_s.Rp0*PIDR_s.Ep0 + PIDR_s.MV;//u = R2*E2 + R1*E1 + R0*E0 + u; 
    
    //ANTI WIND UP 
    IF (PIDR_s.MV > 100.0) THEN
        PIDR_s.MV := 100.0; 
    END_IF; 
    IF (PIDR_s.MV < 0.0) THEN
        PIDR_s.MV := 0.0; 
    END_IF;
END_IF;