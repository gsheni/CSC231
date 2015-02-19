-module(lab5).
-export([fourthPower/1, square/1, fourthPower2/1, median3/1, factorial/1, cycleOnce/1, getNth/2, logarithm/2, largest/1, contains/2]).

fourthPower(X) -> 
	X*X*X*X.

square(N) -> 
	N * N.

fourthPower2(X) -> 
	square(X)*square(X).

median3(TUPLE) -> 
	A = element(1, TUPLE),
	B = element(2, TUPLE),
	C = element(3, TUPLE),
	if
		A > B andalso B > C -> 
			B;
		A > C andalso C > B -> 
			C;
		B > C andalso C > A -> 
			C;
		B > A andalso A > C -> 
			A;
		C > A andalso A > B -> 
			A;
		C > B andalso B > A -> 
			B;
		A == B  andalso B == C ->
			B;
		A == B  andalso B > C ->
			A;
		B == C  andalso B > A ->
			B;
		true -> % works as an 'else' branch
		    false
	end.

factorial(0) -> 1;
factorial(1) -> 1;
factorial(N) -> 
	N * factorial((N-1)).

cycleOnce(L) ->
	tl(L) ++ [hd(L) | []].

getNth(L, N) ->
	A = hd(L),
	if
		1 == N ->
			A;
		true -> % works as an 'else' branch
			getNth(cycleOnce(L), N - 1)
    	end.

logarithm(X, Y) ->
	if
		X == Y ->
			1;
		true -> % works as an 'else' branch
		    1 + logarithm(X, Y/X)
    	end.

largest(L) ->
	if
		tl(L)==[]->
			hd(L);
		hd(L)>hd(tl(L)) -> 
			largest([hd(L)]++tl(tl(L)));
		true ->
			largest(tl(L))
	end.

contains(D,L) ->
	if
		L == [] -> 
			false;	
		D == hd(L) -> 
			true;
		true ->
			contains(D,tl(L))
	end.
	

