:-op(140, fy, -).    % stands for 'not'
:-op(160,xfy, [and, or, equiv, imp, impinv, nand, nor, nonimp, nonequiv, nonimpinv]).

is_true(V, X and Y) :- is_true(V,X), is_true(V,Y).
is_true(V, X or _) :- is_true(V,X).
is_true(V, _ or Y) :- is_true(V,Y).
is_true(V, -X) :-
    not(is_true(V, X)).  %link with Prologs negation

is_true(V, X imp Y) :-
    is_true(V, -X or Y).
is_true(V, X equiv Y) :-
    is_true(V, (X and Y) or (-X and -Y)).

is_true(v0,a).           %this means that v0 sends a to True and everything else (here, b and c) to false

%BooleanEvaluation (3) 

is_true(V, X) :-
    member(X,V).    % only true elements are explicitly mentioned in V

valuation(V) :-
    % we keep all elements that V sends to true.
    % all other elements are supposed to be false.
    sub_set(V, [a,b,c]).

sub_set([], []).
sub_set([X|XL], [X|YL]) :-
    sub_set(XL, YL).
sub_set(XL, [_|YL]) :-
    sub_set(XL, YL).




/*---------------------------------------------------------------*/
/* Telecom Paristech - J-L. Dessalles 2019                       */
/* LOGIC AND KNOWLEDGE REPRESENTATION                            */
/*            http://teaching.dessalles.fr/LKR                   */
/*---------------------------------------------------------------*/



:-op(140, fy, -).        
:-op(160,xfy, [and, or, imp, impinv, nand, nor, nonimp, equiv, nonimpinv]).

    %%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Conjunctive normal form %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%


/* table for unary, alpha and beta formulas */


% Predicate cnf puts more elementary processing together
cnf(Conjunction, NewConjunction) :-
	oneStep(Conjunction, C1),
	cnf(C1, NewConjunction).
cnf(C, C).

oneStep([Clause | Rest_conjunction], [ [F1, F2 | Rest_Clause] | Rest_conjunction]) :-
    % looking for a beta formula in the clause
    remove(BetaFormula, Clause, Rest_Clause),    
    components(BetaFormula, F1, F2, beta).

oneStep([Clause | Rest_conjunction], [ [F|Rest_Clause] | Rest_conjunction]) :-
    % looking for a unary formula in the clause
    remove(UnaryFormula, Clause, Rest_Clause),    
    components(UnaryFormula, F, _, unary).

oneStep([Clause | Rest_conjunction], [ [F1|Rest_Clause], [F2|Rest_Clause] | Rest_conjunction]) :-
    % looking for an alpha formula in the clause
    remove(AlphaFormula, Clause, Rest_Clause),    
    components(AlphaFormula, F1, F2, alpha).

oneStep([ F | Reste], [ F | New_Rest ]) :-
    % nothing left to do on F
    oneStep(Reste, New_Rest).



/*------------------------------------------------*/
/* Auxiliary predicates                           */
/*------------------------------------------------*/

/* remove does as select, but removes all occurrences of X */
remove(X, L, NL) :-
    member(X,L),	% so that remove fails if X absent from L
    remove1(X, L, NL).
remove1(X, L, L) :-
    not(member(X,L)).
remove1(X, L, NL) :-
	select(X, L, L1),   % available in SWI-Prolog
	remove1(X, L1, NL).
