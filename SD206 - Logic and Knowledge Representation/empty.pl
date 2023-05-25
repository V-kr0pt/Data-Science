empty(P) :-
    retract(P),
    fail.
empty(_).