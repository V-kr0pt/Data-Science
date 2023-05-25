% adapted from I. Bratko - "Prolog - Programming for Artificial Intelligence"
% Addison Wesley 1990

:- dynamic(locomotion/2).

isa(bird, animal).
isa(albert, albatross).
isa(albatross, bird).
isa(kiwi, bird).
isa(willy, kiwi).
isa(crow, bird).

food(albatross,fish).
food(bird,grain).

locomotion(bird, fly).
locomotion(kiwi, walk). % kiwis don't fly, it seems

known(Fact) :-
    Fact, % checks wether Prolog succeeds while executing Fact
    !. % no need to seek further
known(Fact) :-
    Fact =.. [Property, Concept, Value], % Fact is a foncteur, with the concept as first argument.
    isa(Concept, ParentConcept), % getting the parent concept
    SuperFact =.. [Property, ParentConcept, Value], % substituting for the parent concept
    known(SuperFact). % This will instantiate Value

habitat(Animal, continent) :-
    known(locomotion(Animal, L)),
    L \== fly,
    !.
habitat(_, unknown).