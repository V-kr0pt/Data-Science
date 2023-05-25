% pam and bob are atoms
parent(pam,bob).

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

female(mona).
female(jackie).
female(marge).
female(ann).
female(patty).
female(selma).
female(ling).
female(lisa).
female(maggie).
male(abraham).
male(herb).
male(homer).
male(bart).
male(clancy).


child(X,Y) :-
    parent(Y,X).

mother(X,Y) :-
    parent(X,Y),
    female(X).

grandparent(X,Y) :-
    parent(X,Z), % note that the a variable's scope is the clause
    parent(Z,Y). % variable Z keeps its value within the clause

sister(X,Y) :-
    parent(Z,X), % if X gets instantiated, Z gets instantiated as well
    parent(Z,Y),
    female(X),
    X \== Y. % can also be noted: not(X = Y).

ancestor(X,Y) :-
    parent(X,Y).
ancestor(X,Y) :-
    parent(X,Z),
    ancestor(Z,Y). % recursive call


aunt(X,Y) :-
    sister(X,Z),
    parent(Z,Y).


last_elt([X], X).
last_elt([_|REST], Z) :-
    last_elt(REST, Z).

attach([], L, L).
attach([X|R], L, [X|R1]) :-
    attach(R, L, R1).

% it returns true as result but not a list. 
%because i putted it a point 
assemble(L1, L2, L3, Result) :-
    attach(L1, L2, R1),
    attach(R1, L3, Result).

sub_list(IncludedList, IncludingList) :-
    attach(IncludingList, L, IncludedList).

duplicate([], []).
duplicate([X|L], [X,X|M]) :-
    duplicate(L, M).
