Proces1.Alfa:=EXP(-Proces1.sampling_time/Proces1.Time_const);
//Wspolczynnik Alfa 
Proces1.A_p := Proces1.Gain * (1 - Proces1.Alfa); 
//Wspolczynnik Ap 
Proces1.y_k := (Proces1.A_p * Proces1.u_k_1) + (Proces1.Alfa * Proces1.y_k_1);
 //Nowa wartosc wyjscia na podstawie u(k-1), y(k-1) 
Proces1.y_k_1:= Proces1.y_k; 
 //Zapamietanie wyliczonej wartosci wyjscia 
Proces1.u_k_1:= Proces1.u_k; 
 //Zapamietanie ostatniego sterowania