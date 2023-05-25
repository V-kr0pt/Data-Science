%is in a list?
is_in(X, [X|_]). %if is the first element
is_in(X, [_|T]) :-  %if is not, do the recursion
    is_in(X,T).

%the last element from a list 
last_element(X, [X]). %if is a list with only one element.
last_element(X, [_|T]) :- %if is not, do the recursion
    last_element(X, T). 

%two consecutives elements
cosecutive([X,Y], [X,Y|_])

%extract some element from a list
extract(X, [X|L], L).   %se for o primeiro elemento da lista
extract(X, [Y|L], [Y|L1]):-  %se não for o primeiro elemento da lista
    extract(X, L, L1).

%put some element into a list
integrate(X, L, L1):- 
    extract(X, L1, L).

%give all possibles permutation of a list
permute([],[]).
permute([Y|L], L1):-
    permute(L, L2),
    extract(Y, L1, L2). % integrate(Y, L, L1)
