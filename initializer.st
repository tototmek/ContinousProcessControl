// Ustawienie procesu symulowanego 
//Okres probkowania 1s=1000ms - parametr w programie FIXED SCAN 
Proces1.sampling_time := 1.0; 
// Ustawienie wartosci poczatkowych procesu 1 
Proces1.Gain := 10.0; 
Proces1.Time_const := 5.0; 
//Okres probkowania 1s=1000ms - parametr w programie FIXED SCAN 
Proces2.sampling_time := 1.0; 
// Ustawienie wartosci poczatkowych procesu 2 
Proces2.Gain := 5.0; 
Proces2.Time_const := 10.0; 
//Parametry regulatora wbudowanego PID1 
PID1.params[0] := K1000; //okres regulacji w milisekundach 
PID1.params[3] := K1; //wzmocnienie regulatora P 
PID1.params[4] := K0; //TI = 0 oznacza nieskonczony czas calkowania - inaczej mowiac calkowanie wylaczone 
PID1.params[5] := K0; //KD = 0 oznacza zerowe wzmocnienie rozniczkowania 
PID1.params[6] := K0; //TD = 0 oznacza wylaczone rozniczkowanie 
PID1.params[22] := 100; //gorny limit wartosci wyjsciowej z regulatora - zapobiega rowniez efektowi wind-up 
PID1.params[23] := 0; //dolny limit wartosci wyjsciowej z regulatora - -||- 
SET(TRUE, PID1.params[1].5); //aktywacja limitow na wyjsciu regulatora 
SET(TRUE, PID1.params[1].0); //trzeba odwrocic kierunek dzialania PID 
//Parametry regulatora z dyskretnego rownania roznicowego PID2 
PID2.K_gain := 1.0; 
PID2.TI := 99999.0; 
PID2.TD := 0.00001; 
PID2.Ep0 := 0.0; 
PID2.Ep1 := 0.0; 
PID2.Ep2 := 0.0; 
PID2.Rp0 := 0.0; 
PID2.Rp1 := 0.0; 
PID2.Rp2 := 0.0; 
PID2.sampling_time := 1.0; 
EI(TRUE);
