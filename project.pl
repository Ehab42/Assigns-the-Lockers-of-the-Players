:-include('players.pl').


player_list([],0).
player_list([H|T],N):- 
length([H|T],N),getAllPlayers(ALL) ,member(H,ALL) ,N1 is N-1 ,player_list(T,N1),unique([H|T]).


team_config(L,N):-  getGoalkeepers(G),select(G,X1),append([X1],[],X2),
					getDefenders(D1),select(D1,X3),append(X2,[X3],L1),
					getDefenders(D2),select(D2,X4),append(L1,[X4],L2),
					getDefenders(D3),select(D3,X5),append(L2,[X5],L3),
					getDefenders(D4),select(D4,X6),append(L3,[X6],L4),
					getCenters(D5),select(D5,P1),append(L4,[P1],L5),
					getCenters(D6),select(D6,P2),append(L5,[P2],L6),
					getLeftwingers(D7),select(D7,P3),append(L6,[P3],L7),
					getLeftwingers(D8),select(D8,P4),append(L7,[P4],L8),
					getRightwingers(D9),select(D9,P5),append(L8,[P5],L9),
					getRightwingers(D10),select(D10,P6),append(L9,[P6],L),
					unique(L),
					length(L,N),
					print(146).
team_config([],0).
team_config([H|T],11):- length([H|T],N),getGoalkeepers(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],10):- length([H|T],N),getDefenders(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],9):- length([H|T],N),getDefenders(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],8):- length([H|T],N),getDefenders(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],7):- length([H|T],N),getDefenders(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],6):- length([H|T],N),getCenters(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],5):- length([H|T],N),getCenters(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],4):- length([H|T],N),getLeftwingers(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],3):- length([H|T],N),getLeftwingers(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],2):- length([H|T],N),getRightwingers(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).
team_config([H|T],1):- length([H|T],N),getRightwingers(ALL) ,member(H,ALL) ,N1 is N-1 ,team_config(T,N1),unique([H|T]).



/*team_config173(L,N):- getGoalkeepers(G),select(G,X1),append([X1],[],X2),
					getDefenders(D1),select(D1,X3),append(X2,[X3],L1),
					getDefenders(D2),select(D2,X4),append(L1,[X4],L2),
					getDefenders(D3),select(D3,X5),append(L2,[X5],L3),
					getDefenders(D4),select(D4,X6),append(L3,[X6],L4),
					getDefenders(D5),select(D5,P1),append(L4,[P1],L5),
					getDefenders(D6),select(D6,P2),append(L5,[P2],L6),
					getDefenders(D7),select(D7,P3),append(L6,[P3],L7),
					getCenters(D8),select(D8,P4),append(L7,[P4],L8),
					getLeftwingers(D9),select(D9,P5),append(L8,[P5],L9),
					getRightwingers(D10),select(D10,P6),append(L9,[P6],L),
					unique(L),
					length(L,N),
					print(173).*/

locker_assignment([],0).
locker_assignment([H|T],N):- 
length([H|T],N),getAllPlayers(ALL) ,member(H,ALL) ,N1 is N-1 ,locker_assignment(T,N1),unique([H|T]),check([H|T]).

banquet_talk([],0).
banquet_talk([H|T],N):-
length([H|T],N),getAllPlayers(ALL) ,member(H,ALL) ,N1 is N-1 ,banquet_talk(T,N1),unique([H|T]),(checkLanguage([H|T]);checkClub([H|T])).

checkLanguage([]).
checkLanguage([_]).
checkLanguage([H|T]):- getArabic(L), member(H,L),checkAra([H|T]).
checkLanguage([H|T]):- getEnglish(L), member(H,L),checkEng([H|T]).
checkLanguage([H|T]):- getFrench(L), member(H,L),checkFre([H|T]).
checkLanguage([H|T]):- getItalian(L), member(H,L),checkIta([H|T]).

checkAra([]).
checkAra([H1,H2|_]):-
getArabic(L),member(H1,L),member(H2,L).

checkEng([]).
checkEng([H1,H2|_]):-
getEnglish(L),member(H1,L),member(H2,L).

checkFre([]).
checkFre([H1,H2|_]):-
getFrench(L),member(H1,L),member(H2,L).

checkIta([]).
checkIta([H1,H2|_]):-
getItalian(L),member(H1,L),member(H2,L).

checkClub([]).
checkClub([_]).
checkClub([H|T]):-  getAhlyPlayers(L), member(H,L),checkClubAhly([H|T]).
checkClub([H|T]):-  getZamalekPlayers(L), member(H,L),checkClubZamalek([H|T]).
checkClub([H|T]):-  getEnppiPlayers(L), member(H,L),checkClubEnppi([H|T]).
checkClub([H|T]):-  getMasriPlayers(L), member(H,L),checkClubMasri([H|T]).
checkClub([H|T]):-  getMekawleenPlayers(L), member(H,L),checkClubMekawleen([H|T]).
checkClub([H|T]):-  getIsmailyPlayers(L), member(H,L),checkClubIsmaily([H|T]).


checkClubAhly([]).
checkClubAhly([H1,H2|_]):-  
getAhlyPlayers(L),member(H1,L),member(H2,L).

checkClubZamalek([]).
checkClubZamalek([H1,H2|_]):-  
getZamalekPlayers(L),member(H1,L),member(H2,L).

checkClubEnppi([]).
checkClubEnppi([H1,H2|_]):-  
getEnppiPlayers(L),member(H1,L),member(H2,L).

checkClubMasri([]).
checkClubMasri([H1,H2|_]):-  
getMasriPlayers(L),member(H1,L),member(H2,L).

checkClubMekawleen([]).
checkClubMekawleen([H1,H2|_]):-  
getMekawleenPlayers(L),member(H1,L),member(H2,L).

checkClubIsmaily([]).
checkClubIsmaily([H1,H2|_]):-  
getIsmailyPlayers(L),member(H1,L),member(H2,L).

check([]).
check([_]).
check([H|T]):- getGoalkeepers(L), member(H,L),arrangeLocker1([H|T]).
check([H|T]):- getDefenders(L), member(H,L),arrangeLocker2([H|T]).
check([H|T]):- getRightwingers(L), member(H,L),arrangeLocker3([H|T]).
check([H|T]):- getLeftwingers(L), member(H,L),arrangeLocker4([H|T]).
check([H|T]):- getCenters(L), member(H,L),arrangeLocker5([H|T]).



arrangeLocker1([]).
arrangeLocker1([H1,H2|_]):-
getGoalkeepers(L),member(H1,L), \+member(H2,L).

arrangeLocker2([]).
arrangeLocker2([_,H2|_]):-
getDefenders(L), \+member(H2,L).

arrangeLocker3([]).
arrangeLocker3([_,H2|_]):-
getRightwingers(L), \+member(H2,L).

arrangeLocker4([]).
arrangeLocker4([_,H2|_]):-
getLeftwingers(L), \+member(H2,L).

arrangeLocker5([]).
arrangeLocker5([_,H2|_]):-
getCenters(L), \+member(H2,L).


unique([]).
unique([H|T]):- \+member(H,T).


cut(H,[H|T],[H|T]).
cut(X,[_|T],R):- cut(X,T,R).

%% select(List, R) - chooses a random element
%% in List and unifies it with R.
select([], []).
select(List, R) :-
        length(List, Length),
        random(0, Length, Index),
        nth0(Index, List, R).

getAllPlayers(L):-
findall(X, (member(Y, [goalie]), position(X, Y)), Xs),
findall(X, (member(Y, [defender]), position(X, Y)), Ys),
findall(X, (member(Y, [center]), position(X, Y)), Zs),
findall(X, (member(Y, [leftwinger]), position(X, Y)), A),
findall(X, (member(Y, [rightwinger]), position(X, Y)), B),
append(Xs,Ys,Xss),
append(Xss,Zs,Yss),
append(Yss,A,Zss),
append(Zss,B,L).

getGoalkeepers(L):-
findall(X, (member(Y, [goalie]), position(X, Y)), Xs),append(Xs,[],L).

getDefenders(L):-
findall(X, (member(Y, [defender]), position(X, Y)), Xs),append(Xs,[],L).

getCenters(L):-
findall(X, (member(Y, [center]), position(X, Y)), Xs),append(Xs,[],L).

getLeftwingers(L):-
findall(X, (member(Y, [leftwinger]), position(X, Y)), Xs),append(Xs,[],L).

getRightwingers(L):-
findall(X, (member(Y, [rightwinger]), position(X, Y)), Xs),append(Xs,[],L).

%-----------------------

getAhlyPlayers(L):-
findall(X, (member(Y, [ahly]), club(X, Y)), Xs),append(Xs,[],L).

getZamalekPlayers(L):-
findall(X, (member(Y, [zamalek]), club(X, Y)), Xs),append(Xs,[],L).

getEnppiPlayers(L):-
findall(X, (member(Y, [enppi]), club(X, Y)), Xs),append(Xs,[],L).

getMasriPlayers(L):-
findall(X, (member(Y, [masri]), club(X, Y)), Xs),append(Xs,[],L).

getMekawleenPlayers(L):-
findall(X, (member(Y, [mekawleen]), club(X, Y)), Xs),append(Xs,[],L).

getIsmailyPlayers(L):-
findall(X, (member(Y, [ismaily]), club(X, Y)), Xs),append(Xs,[],L).

%------------------------

getArabic(L):- findall(X, (member(Y, [_]), position(X, Y),language(X,arabic)), L).

getEnglish(L):- findall(X, (member(Y, [_]), position(X, Y),language(X,english)), L).

getFrench(L):- findall(X, (member(Y, [_]), position(X, Y),language(X,french)), L).

getItalian(L):- findall(X, (member(Y, [_]), position(X, Y),language(X,italian)), L).



% findall(X, (member(Y, [_]), position(X, Y),language(X,arabic)), Xs). players speak arabic
