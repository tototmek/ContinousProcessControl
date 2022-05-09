Proces2.Alfa:=EXP(-Proces2.sampling_time/Proces2.Time_const);
//Wspolczynnik Alfa 
Proces2.A_p := Proces2.Gain * (1 - Proces2.Alfa); 
//Wspolczynnik Ap 
Proces2.y_k := (Proces2.A_p * Proces2.u_k_1) + (Proces2.Alfa * Proces2.y_k_1);
 //Nowa wartosc wyjscia na podstawie u(k-1), y(k-1) 
Proces2.y_k_1:= Proces2.y_k; 
 //Zapamietanie wyliczonej wartosci wyjscia 
Proces2.u_k_1:= Proces2.u_k; 
 //Zapamietanie ostatniego sterowania