/*---------------------------------------------------------------*/
/* Telecom Paris- J-L. Dessalles 2023                            */
/* LOGIC AND KNOWLEDGE REPRESENTATION                            */
/*            http://teaching.dessalles.fr/LKR                   */
/*---------------------------------------------------------------*/


% partial elementary English grammar
s --> np(Sem), vp(Sem).
np --> det, n(Sem).	
vp(Sem) --> v(Sem, _), np.
vp(Sem1) --> v(Sem1,Sem2), np(Sem2).
n(sentient) --> [daughter]; [sister]; [aunt]; [sister]. 
n(nonEdible) --> [door];
v(sentient, _) --> [sleeps].
v(sentient, _) --> [likes].
v(sentient, edible) --> [eats].
v(sentient, _) --> [annoys].
v(sentient, _) --> [talks].
v(sentient, _) --> [give].
v(sentient, _) --> [cries].

% --- Grammar
s --> np(Number), vp(Number).
np --> det(Number), n(Number).		% Simple noun phrase
np --> det, n, pp.		% Noun phrase + prepositional phrase 
% np --> np, pp.		% Noun phrase + prepositional phrase 
np --> [kirk].
vp(Number) --> v(Number).           % Verb phrase, intransitive verb
vp(Number) --> v(Number), np.		% Verb phrase, verb + complement:  like X
vp(Number) --> v(Number), pp.		% Verb phrase, verb + indirect complement : think of X 
vp(Number) --> v(Number), np, pp.	% Verb phrase, verb + complement + indirect complement : give X to Y 
vp(Number) --> v(Number), pp, pp.	% Verb phrase, verb + indirect complement + indirect complement : talk to X about Y

vp --> v(none).
vp --> v(transitive), np. 
vp --> v(intransitive), pp.
vp --> v(transitive), np, pp.
vp --> v(intransitive), pp, pp.

% -- Lexicon
det(singular) --> [a].
det(plural) --> [many].
det(_) --> [the].
det --> [my].
det --> [her].
det --> [his].
det --> [a].
det --> [some].
n(singular) --> [dog].
n(plural) --> [dogs].
n --> [daughter].
n --> [son].
n --> [sister].
n --> [aunt].
n --> [neighbour].
n --> [cousin].
v --> [grumbles].
v --> [likes].
v --> [gives].
v --> [talks].
v --> [annoys].
v(singular) --> [hate].
v(plural) --> [hates].

v --> [cries].
p --> [of].
p --> [to].
p --> [about].


