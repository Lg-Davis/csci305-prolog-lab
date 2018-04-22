%Logan Davis
%CSCI 305 Prolog Lab 2

% Mother Rule
mother(M,C) :-
  parent(M,C),
  female(M).

% Father Rule
father(F,C) :-
  parent(F,C),
  male(F).

% Spouse Rule
spouse(S, A) :-
  married(S, A);
  married(A, S).

% Child Rule
child(C,P) :-
  parent(P,C).

% Son Rule
son(S,P) :-
  child(S, P),
  male(S).

% Daughter Rule
daughter(D, P) :-
  child(D, P),
  female(D).

% Sibling Rule
sibling(C1, C2) :-
  parent(Parent, C1),
  parent(Parent, C2),
  not(C1 = C2).

% Brother Rule
brother(C1, C2) :-
  sibling(C1, C2),
  male(C1),
  not(C1 = C2).

% Sister Rule
sister(C1, C2) :-
  sibling(C1,C2),
  female(C1),
  not(C1 = C2).

% Uncle Rule by blood
uncle(U, C) :-
  parent(Parent, C),
  brother(U, Parent).

% Uncle Rule by Marriage
uncle(U, C) :-
  parent(Parent, C),
  sibling(Sibling, Parent),
  married(Sibling, U),
  male(U).

% Aunt Rule by blood
aunt(A, C) :-
  parent(Parent, C),
  sister(A, Parent).

% Aunt Rule by marriage
aunt(A, C) :-
  parent(Parent, C),
  sibling(Sibling, Parent),
  married(Sibling, A),
  female(A).

%GrandParent Rule
grandparent(G, C) :-
  parent(G, Parent),
  parent(Parent, C),
  not(G = C).

% Grandfather Rule
grandfather(G, C) :-
  parent(G, Parent),
  parent(Parent, C),
  male(G).

% GrandMother Rule
grandmother(G, C) :-
  parent(G, Parent),
  parent(Parent, C),
  female(G).

% GrandChild Rule
grandchild(C, G) :-
  parent(Parent, C),
  parent(G, Parent).

% Ancestor Rule
% Base case for ancestor recursion
ancestor(A, B) :-
  parent(A, B).

% If ancestor was not directy the parent, Recurse to find result
ancestor(A, B) :-
  parent(A, X),
  ancestor(X, B).

% Descendent Rule
descendent(A, B) :-
  child(A, B).

descendent(A, B) :-
  child(A, X),
  descendent(X, B).

% Older Rule
older(X, Y) :-
  born(X, BirthYearX),
  born(Y, BirthYearY),
  BirthYearX < BirthYearY.

% Younger Rule
younger(X, Y) :-
  born(X, BirthYearX),
  born(Y, BirthYearY),
  BirthYearX > BirthYearY.


% regent when botn Rule
regentWhenBorn(K, C) :-
  born(C, Year),
  reigned(K, Start, End),
  Year >= Start,
  Year =< End.

cousin(X, Y) :-
  parent(Parent1, X),
  parent(Parent2, Y),
  sibling(Parent1, Parent2).
