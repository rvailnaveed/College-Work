numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).

add(0, X, X).
add(s(X), Y, s(Z)) :- add(X, Y, Z).
add(p(X), Y, p(Z)) :- add(X, Y, Z).

add2(-A, B, C) :- minus(A, D), add2(D, B, C).
add2(A, -B, C) :- minus(B, D), add2(D, A, C).

%% Exercise 1
add2(s(A+B), s(C+D), s(s(E))) :- add2(A+B, C+D, E).
add2(s(A+B), C, s(D)) :- add2(A+B, C, D).
add2(A, s(B+C), s(D)) :- add2(A, B+C, D).
%% Exercise 1

%% Exercise 2
add2(p(s(A)), B, C) :- add2(A, B, C).
add2(A, p(s(B)), C) :- add2(A, B, C).
add2(s(p(A)), B, C) :- add2(A, B, C).
add2(A, s(p(B)), C) :- add2(A, B, C).
%% Exercise 2

%% Exercise 1
add2(A+B, C, D) :- add(A, B, E), add2(E, C, D).
add2(A, B+C, D) :- add(B, C, E), add2(E, A, D).
add2(A+B, C+D, E) :- add(A, B, F), add(C, D, G), add2(F, G, E).
add2(A, B, C) :- add(A, B, C).
%% Exercise 1

%% Exercise 3
minus(0,0).
minus(s(p(A)), B) :- minus(A, B).
minus(p(s(A)), B) :- minus(A, B).
minus(s(A), p(B)) :- minus(A, B).
minus(p(A), s(B)) :- minus(A, B).
%% Exercise 3