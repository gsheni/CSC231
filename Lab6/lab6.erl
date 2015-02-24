-module(lab6).
-export([productOfPairs/1, polyadd/2, polydiff/2, polyeval/2, member/2, delete/2, insert/2, largest/1, selectionSort/1, map/2, flipSign/1, flipSigns/1, truncateWord/1, truncateWords/1]).

productOfPairs([]) -> 
	[]; %empty set product is empty set
productOfPairs([X]) -> 
	[X]; %the product of one element is the element itself
productOfPairs([X|XS]) -> 
	[X*hd(XS)]++productOfPairs(tl(XS)). %1st times 2nd and appended with next pair product

polyadd([],[]) ->
	[];
polyadd([X|XS],[]) ->
	[X|XS];
polyadd([],[Y|YS]) ->
	[Y|YS];
polyadd([X|XS],[Y|YS]) ->
	[X+Y]++polyadd(XS,YS).

polydiff([],[]) ->
	[];
polydiff([X|XS],[]) ->
	[X|XS];
polydiff([],[Y|YS]) ->
	[0-Y]++polydiff([], YS);  %[0-Y]++polydiff([],YZ);
polydiff([X|XS],[Y|YS]) ->
	[X-Y]++polydiff(XS,YS).

polyeval([],_) ->
	0;
polyeval([X|XS],Y) -> 
	X+Y*polyeval(XS,Y).%does stuff to right first

member(_,[]) ->
	false;
member(X,[X|_]) ->
	true;
member(X,[_|Y]) ->
	member(X,Y).

delete(_,[]) ->
	[];	
delete(X,S) ->
	P = member(X,S),
	if
		P ==true ->
			if
				X==hd(S) -> 
					tl(S); %the element is here
				true ->
					[hd(S)]++delete(X,tl(S)) %not here, keep searching 
			end;
		true-> % not here, return list as without delete
			S
	end.

insert(X,S) ->
	P = member(X,S),
	if
		P ==true ->
			S;
		true-> % not here, return list as without delete
			[X]++S
	end.

largest([])->
	[];
largest(L) ->
	T = tl(L),
	H = hd(L),
	if
		(T == []) -> 
			H;
		true ->
			if (H > hd(T)) ->
				largest([H|tl(T)]);
			true ->
				largest(T)
		end
	end.

selectionSort([])->
	[];
selectionSort(X)->
	L=largest(X),
	N=delete(L,X),
	[L]++selectionSort(N).

map(_,[]) ->
	[];
map(F,[X|XS]) ->
	[F(X)|map(F,XS)].

flipSign(N) ->
	0-N.
flipSigns(L) ->
	map(fun flipSign/1,L).

truncateWord(L)->
	if
		length(L) < 5 -> % it is 4 or less
			L;
		true->
			chop(L, 4)
	end.	
chop([X|XS], S) ->
	if
		S == 0 ->
			[];
		true -> 
			[X]++chop(XS,S-1)
	end.
truncateWords(L) ->
	map(fun truncateWord/1,L).

