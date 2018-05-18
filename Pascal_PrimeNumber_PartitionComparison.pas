{
1)???????????? ?????? ?????, ????????? ????? ?????????? ????????,
	???? ??????? ???????.
2)???????????? ?????? ??????? ?????,????????? ??????????, ??????? ??????
3) ??????? ?????????? ? ?????? ??????? ???????? (?????)
 ? ????? ?????? ?????????? ???? ??????? ?????????. ? ??????? 2 ????????? -
 ????????? ????? ? ??? ???????? ??????}

Program PartitionComparison;
uses crt;

type MyArray= Array[1..100] of integer;
var A:MyArray;


{Function IsPrimeNumber differs prime number from a composite number
(composite number - number that can be formed by multiplying 2 numbers).
Function's parameters:
number - number to be verified,whether it is prime number of not.}
Function IsPrimeNumber(number:integer):boolean;
var k, ostatok:integer;
begin
	k:=1;
	repeat
		inc(k);
		ostatok:=number mod k;
		if ostatok=0 then begin
			break;
		end;
	until k>sqrt(number);
	if (ostatok>0) then begin
		IsPrimeNumber:=true;
	end;
	if ostatok=0 then begin
		IsPrimeNumber:=false;
	end;
		if (number=2) then begin
		IsPrimeNumber:=true;
	end;
end;


{Boolean function DoesNotRepeat checks the array MyArray for redundant elements.
Function compares the number with each element in the array. If the number
is original, function is true.
i - number of elements in the array MyArray
A - element from the array MyArray}
Function DoesNotRepeat(i:integer):boolean;
var j:integer;
begin
	DoesNotRepeat:=true;
	WriteLn('A[i]= ', A[i]);
	for j:=1 to i do begin
		WriteLn('A[j]= ',A[j]);
		if A[i]<>A[j] then begin
			DoesNotRepeat:=true;
		end else begin
			DoesNotRepeat:=false;
		end;
	end;
end;


{Function NumberOfPrimeDivisors writes all prime divisors of
manually entered number in a global type array MyArray and counts 
the number of prime divisors.
number - number manually entered to be divided into prime numbers
		if possible
A - var parameter of a function, because function can change an
	array (can add prime numbers into an array)}
Function NumberOfPrimeDivisors(number:integer; var A:MyArray):integer;
var i, j, k, ostatok, diviation: integer;
begin
	NumberOfPrimeDivisors:=0;
	i:=0;
	k:=1;
	for k:=2 to number do begin //check if k is prime
		if (IsPrimeNumber(k)=true) then begin
			WriteLn('k= ',k);
			ostatok:= number mod k;//check if k is a divisor
			WriteLn('ostatok= ', ostatok);
			if (ostatok=0) then begin //check if k is divisor
				diviation:=number div k;
				inc(i);
				if (DoesNotRepeat(i)=true) then begin
					A[i]:=k;
					//WriteLn('A[i]= ', A[i]);
					NumberOfPrimeDivisors:=NumberOfPrimeDivisors+1;
					//WriteLn('NumberOfPrimeDivisors= ', NumberOfPrimeDivisors);
				end;
			end;
		end;
	end;
end;


var number:integer;
Begin
	WriteLn('Please enter the number greater than 1:');
	Read(number);
	if IsPrimeNumber(number)=true then begin
		WriteLn('The number you entered is prime.');
	end else begin
		WriteLn('The number of prime divisors is: ', NumberOfPrimeDivisors(number, A));
	end;
End.

