%Simpsons
parent(marge, lisa).
parent(marge, bart).
parent(marge, maggie).
parent(homer, lisa).
parent(homer, bart).
parent(homer, maggie).
parent(abraham, homer).
parent(abraham, herb).
parent(mona, homer).
parent(jackie, marge).
parent(clancy, marge).
parent(jackie, patty).
parent(clancy, patty).
parent(jackie, selma).
parent(clancy, selma).
parent(selma, ling).


findany(Var, Pred, Results):-
    Pred,
    assert(found(Var)),
    fail.

findany(_, _, Results):-
    collect_found(Results).

collect_found([X|L]) :-
    retract(found(X)),
    !,
    collect_found(L).
collect_found([]).


