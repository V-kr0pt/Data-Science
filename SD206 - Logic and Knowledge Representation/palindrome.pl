% better solution with accumulator:
mirror2(Left, Right) :-
	invert(Left, [ ], Right).
invert([X|L1], L2, L3) :-	% the list is 'poured'
	invert(L1, [X|L2], L3).	% into the second argument
invert([ ], L, L).	% at the deepest level, the result L is merely copied

% first palindrome
palindrome(L) :-
	mirror2(L,L). 

% second palindrome
palindrome2(L) :- 
    invert2(L,[]).
invert2(L,L).
invert2([_|L],L).  
invert2([X|L], R) :-
    invert2(L, [X|R]).