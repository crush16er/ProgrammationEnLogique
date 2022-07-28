main2 :-
    open('houses.txt', read, Str), readWord(Str,Houses), close(Str),nl,nl,nl.

add_tail([],X,[X]).
add_tail([H|T],X,[H|L]):-add_tail(T,X,L).


readWord(Stream,[]):-
         at_end_of_stream(Stream).
readWord(InStream,[W|L]):-
         get_code(InStream,Char),
         checkCharAndReadRest(Char,Chars,InStream),
         atom_codes(W,Chars),
         checkWord(W),
         readWord(InStream,L).

checkWord(W) :- lastCheck(W);keyCheck(W); sepCheck(W);idCheck(W); numCheck(W).
keyCheck(W):- member(W, ['read', 'write', 'if', 'then', 'else', 'fi', 'while', 'do', 'od', 'and','or', 'mod']), write('key('),write(W), write('), ').

sepCheck(W):- member(W, [';', '+', '-', '*', '/', '(', ')', '>', '<', '=<','>=', ':=', '=', '/=']), write('sep('),write(W), write('), ').

idCheck(W) :- sub_atom(W,0,1,_,X), char_code(X, C), between(65,90,C), write('id('),write(W), write('), ').

numCheck(W) :- sub_atom(W,0,1,_,X), char_code(X, C), between(48,57,C), write('int('),write(W), write('), ').

lastCheck(W) :- sub_atom(W,_,1,0,X), char_code(X, C), C = 59,
                sub_atom(W,0,_,1,Y), checkWord(Y), write('sep(;), ').


checkCharAndReadRest(X,[],_):- (X is 10 ; X is 32 ; X is -1), !.
checkCharAndReadRest(end_of_file,[],_):-  !.
checkCharAndReadRest(Char,[Char|Chars],InStream):-
         get_code(InStream,NextChar),
        checkCharAndReadRest(NextChar,Chars,InStream).