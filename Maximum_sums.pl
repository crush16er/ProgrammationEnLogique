zs_maxmum(Zs, MSF) :-
   zs_maxmum_(Zs, 0,_, 0,MSF).

zs_maxmum_([], _,_, MSF,MSF).
zs_maxmum_([Z|Zs], MEH0,MEH, MSF0,MSF) :-
   max(0,MEH0+Z)  #= MEH1,
   max(MSF0,MEH1) #= MSF1,
   zs_maxmum_(Zs, MEH1,MEH, MSF1,MSF).