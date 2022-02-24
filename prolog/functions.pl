list_sum([],0).
list_sum([H|T],N) :- list_sum(T,N1), N is N1+H.
list_min([H],H).
list_min([H|T],M) :- list_min(T,M1), M is min(M1,H).
list_max([H],H).
list_max([H|T],Maximum) :- list_max(T,Max1), Maximum is max(Max1,H).
count(Op,Ref,Count) :- (
	Op='eq',findall(Z,(payment(X,Y,Z),Z=:=Ref),List), length(List,Count);
	Op='ne',findall(Z,(payment(X,Y,Z),Z=\=Ref),List), length(List,Count);
	Op='gt',findall(Z,(payment(X,Y,Z),Z>Ref),List), length(List,Count);
	Op='ge',findall(Z,(payment(X,Y,Z),Z>=Ref),List), length(List,Count);
	Op='lt',findall(Z,(payment(X,Y,Z),Z<Ref),List), length(List,Count);
	Op='le',findall(Z,(payment(X,Y,Z),Z=<Ref),List), length(List,Count)
	).
list(Op,Ref,List) :- (
	Op='eq',findall([X,Y,Z],(payment(X,Y,Z),Z=:=Ref),List);
	Op='ne',findall([X,Y,Z],(payment(X,Y,Z),Z=\=Ref),List);
	Op='gt',findall([X,Y,Z],(payment(X,Y,Z),Z>Ref),List);
	Op='ge',findall([X,Y,Z],(payment(X,Y,Z),Z>=Ref),List);
	Op='lt',findall([X,Y,Z],(payment(X,Y,Z),Z<Ref),List);
	Op='le',findall([X,Y,Z],(payment(X,Y,Z),Z=<Ref),List)
	).
min(Op,Ref,Min) :- (
	Op='eq',findall(Z,(payment(X,Y,Z),Z=:=Ref),List), list_min(List,Min);
	Op='ne',findall(Z,(payment(X,Y,Z),Z=\=Ref),List), list_min(List,Min);
	Op='gt',findall(Z,(payment(X,Y,Z),Z>Ref),List), list_min(List,Min);
	Op='ge',findall(Z,(payment(X,Y,Z),Z>=Ref),List), list_min(List,Min);
	Op='lt',findall(Z,(payment(X,Y,Z),Z<Ref),List), list_min(List,Min);
	Op='le',findall(Z,(payment(X,Y,Z),Z=<Ref),List), list_min(List,Min)
	).
max(Op,Ref,Max) :- (
	Op='eq',findall(Z,(payment(X,Y,Z),Z=:=Ref),List), list_max(List,Max);
	Op='ne',findall(Z,(payment(X,Y,Z),Z=\=Ref),List), list_max(List,Max);
	Op='gt',findall(Z,(payment(X,Y,Z),Z>Ref),List), list_max(List,Max);
	Op='ge',findall(Z,(payment(X,Y,Z),Z>=Ref),List), list_max(List,Max);
	Op='lt',findall(Z,(payment(X,Y,Z),Z<Ref),List), list_max(List,Max);
	Op='le',findall(Z,(payment(X,Y,Z),Z=<Ref),List), list_max(List,Max)
	).
avg(Op, Ref, Avg) :- (
	Op='eq',findall(Z,(payment(X,Y,Z),Z=:=Ref),List), list_sum(List,Sum),length(List,Length),Avg is Sum/Length;
	Op='ne',findall(Z,(payment(X,Y,Z),Z=\=Ref),List), list_sum(List,Sum),length(List,Length),Avg is Sum/Length;
	Op='gt',findall(Z,(payment(X,Y,Z),Z>Ref),List), list_sum(List,Sum),length(List,Length),Avg is Sum/Length;
	Op='ge',findall(Z,(payment(X,Y,Z),Z>=Ref),List), list_sum(List,Sum),length(List,Length), Avg is Sum/Length;
	Op='lt',findall(Z,(payment(X,Y,Z),Z<Ref),List), list_sum(List,Sum),length(List,Length),Avg is Sum/Length;
	Op='le',findall(Z,(payment(X,Y,Z),Z=<Ref),List), list_sum(List,Sum),length(List,Length),Avg is Sum/Length
	).
total(Op,Ref,Total) :- (
	Op='eq',findall(Z,(payment(X,Y,Z),Z=:=Ref),List),list_sum(List,Total);
	Op='ne',findall(Z,(payment(X,Y,Z),Z=\=Ref),List),list_sum(List,Total);
	Op='gt',findall(Z,(payment(X,Y,Z),Z>Ref),List),list_sum(List,Total);
	Op='ge',findall(Z,(payment(X,Y,Z),Z>=Ref),List),list_sum(List,Total);
	Op='lt',findall(Z,(payment(X,Y,Z),Z<Ref),List),list_sum(List,Total);
	Op='le',findall(Z,(payment(X,Y,Z),Z=<Ref),List),list_sum(List,Total)
	).
