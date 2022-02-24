payment(F,L,P) :- salaried(F,L,Salary),
P is Salary.
payment(F,L,P) :- hourly(F,L,Hours,Rate),
Hours < 40,
P is Hours*Rate.
payment(F,L,P) :- hourly(F,L,Hours,Rate),
Hours =< 50,
Hours >= 40,
P is (40 * Rate) + (1.5 * Rate * (Hours - 40)).
payment(F,L,P) :- hourly(F,L,Hours,Rate),
Hours > 50,
P is (40 * Rate) + (1.5 * Rate * 10) + (2 * Rate * (Hours - 50)).
payment(F,L,P) :- commission(F,L,Min,Sales,Crate),
Sales*Crate > Min,
P is Sales*Crate.
payment(F,L,P) :- commission(F,L,Min,Sales,Crate),
Sales*Crate =< Min,
P is Min.
