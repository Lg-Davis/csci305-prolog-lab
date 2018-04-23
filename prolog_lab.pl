%Logan Davis
%CSCI 305 Prolog Lab 2

% Mother Rule
mother(M,C) :-
  %find the parent of the given child
  parent(M,C),
  %Make sure that the parent found is a female(Mother)
  female(M).

% Father Rule
father(F,C) :-
  %find the parent of a given child
  parent(F,C),
  %make sure that the parent found is a male(Father)
  male(F).

% Spouse Rule
spouse(S, A) :-
  %Check if S is married to A
  married(S, A);
  % Vise-Versa, check if A is married to S
  married(A, S).

% Child Rule
child(C,P) :-
  %checks if P is a parent of C, then C is a child of P
  parent(P,C).

% Son Rule
son(S,P) :-
  %check if S is a child of P
  child(S, P),
  %that child should be a male (son)
  male(S).

% Daughter Rule
daughter(D, P) :-
  %check if D is child of P
  child(D, P),
  %that child should be a female(daughter)
  female(D).

% Sibling Rule
sibling(C1, C2) :-
  % Checking for the same parent for both C1 and C2
  parent(Parent, C1),
  parent(Parent, C2),

  %check that C1 and C2 are not the same person
  not(C1 = C2).

% Brother Rule
brother(C1, C2) :-
  % see if C1 and C2 are siblings
  sibling(C1, C2),
  % check if C1 is male (brother)
  male(C1),
  %check C1 and C2 are not the same person
  not(C1 = C2).

% Sister Rule
sister(C1, C2) :-
  %see if C1 and C2 are siblings
  sibling(C1,C2),
  % check that C1 is a female(sister)
  female(C1),
  %check that C1 and C2 are not the same person
  not(C1 = C2).

% Uncle Rule by blood
uncle(U, C) :-
  % Find the parent of the child 'C'
  parent(Parent, C),
  % check if the found parent has a brother, uncle to the child given
  brother(U, Parent).

% Uncle Rule by Marriage
uncle(U, C) :-
  % Find the parent of the child given 'C'
  parent(Parent, C),
  % find the sibling of the parent found
  sibling(Sibling, Parent),
  % find who is married ot the sibling found
  married(Sibling, U),
  % check if the uncle is a male
  male(U).

% Aunt Rule by blood
aunt(A, C) :-
  %find the parent of the child given 'C'
  parent(Parent, C),
  % find the sister to the parent found, aunt to the child given 'C'
  sister(A, Parent).

% Aunt Rule by marriage
aunt(A, C) :-
  % find the parent of the child given 'C'
  parent(Parent, C),
  % find the sibling of the parent found
  sibling(Sibling, Parent),
  % find out who is married to the sibling found
  married(Sibling, A),
  %make sure the aunt is a female
  female(A).

%GrandParent Rule
grandparent(G, C) :-
  % Find the child of grandparent 'G'
  parent(G, Parent),
  % find the child of the parent found from the grandparent
  parent(Parent, C),
  %check that 'G' and 'C' are not the same person
  not(G = C).

% Grandfather Rule
grandfather(G, C) :-
  % Find the child of grandparent 'G'
  parent(G, Parent),
  % find the child of the parent found from the grandparent
  parent(Parent, C),
  % make sure the grandparent 'G' is male
  male(G).

% GrandMother Rule
grandmother(G, C) :-
  % Find the child of grandparent 'G'
  parent(G, Parent),
  % find the child of the parent found from the grandparent
  parent(Parent, C),
  % make sure the grandparent 'G' is female
  female(G).

% GrandChild Rule
grandchild(C, G) :-
  % find the Parent of the child 'C'
  parent(Parent, C),
  %find the grandparent of the parent found
  parent(G, Parent).

% Ancestor Rule
% Base case for ancestor recursion
ancestor(A, B) :-
  % Direct parent relationship between 'A' and 'B', no ancestors
  parent(A, B).

% If ancestor was not directy the parent, Recurse to find result
ancestor(A, B) :-
  parent(A, X),
  ancestor(X, B).

% Descendent Rule
% Base case for ancestor recursion
descendent(A, B) :-
  % check if theres a direct child relation ship between 'A' and 'B', no decendents
  child(A, B).

% if there are descendents, recurse
descendent(A, B) :-
  child(A, X),
  descendent(X, B).

% Older Rule
older(X, Y) :-
  % Find birth year of person X and person Y
  born(X, BirthYearX),
  born(Y, BirthYearY),
  % check that person X's birth year is earlier than person Y's
  BirthYearX < BirthYearY.

% Younger Rule
younger(X, Y) :-
  % Find birth year of person X and person Y
  born(X, BirthYearX),
  born(Y, BirthYearY),
  % check that person X's birth year is greater than person Y's
  BirthYearX > BirthYearY.


% Regent when both Rule
regentWhenBorn(K, C) :-
  % find the birth year of the person born 'C'
  born(C, Year),
  % find the royalty who reigend from a start date to an end date
  reigned(K, Start, End),
  % the year born must be greater than the ruling start date
  Year >= Start,
  % the year born must be less than the ruling end date
  Year =< End.

% EXTRA CREDIT, cousin rule
cousin(X, Y) :-
  % Find the parent of X
  parent(Parent1, X),
  %find the parent of Y
  parent(Parent2, Y),
  % check if the parents found are siblings, if so then 'X' and 'Y' are cousins
  sibling(Parent1, Parent2).
