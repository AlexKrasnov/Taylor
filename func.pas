Unit func;

{interface

function TeilorSin(x:real;t:real;n:integer):real;

function TeilorCos(x:real;t:real;n:integer):real;

function TeilorEx(x:real;t:real;n:integer):real;

function TeilorCh(x:real;t:real;n:integer):real;

implementation} // �������� ���:)

function TeilorSin(x:real;t:real;n:integer):real; 
 var
 i:integer;
 prev, next, si : real;
 begin
  if x>0 then
  while x>(2*pi) do
  x:=x-(2*pi)
 else
  while x<0 do
  x:=x+(2*pi);
  //writeln('��������������� �������� �:',' ', x);
    i:=1;
    si:=x;
    prev:=x;
  begin
    while (i<n) do
    begin
      if abs(sin(x)-si)<>t then
      begin
      next:=prev*(-1)*x*x/(2*i)/(2*i+1);
      si:=si+next;
      prev:=next;
      inc(i);
      //writeln('����� ������������ ���������:', n);
      end
      else
      //writeln('����� ���������, �� ������� ���������� ������������:', i);
      break;
  end;
 end;
 TeilorSin:=si;
end;
 
function TeilorCos(x:real;t:real;n:integer):real;
 var
 i:integer;
 prev, next, cs : real;
 begin
  if x>0 then
  while x>(2*pi) do
  x:=x-(2*pi)
 else
  while x<0 do
  x:=x+(2*pi);
  //writeln('��������������� �������� �:',' ', x);
    i:=1;
    cs:=1;
    prev:=1;
  begin
    while (i<n) do
    begin
      if abs(sin(x)-cs)<>t then
      begin
      next:=prev*(-1)*x*x/(2*i-1)/(2*i);
      cs:=cs+next;
      prev:=next;
      inc(i);
      //writeln('����� ������������ ���������:', n);
      end
      else
      //writeln('����� ���������, �� ������� ���������� ������������:', i);
     break;
  end;
 end;
 TeilorCos:=cs;
end;

function TeilorEx(x:real;t:real;n:integer):real;
var
 i:integer;
 prev, next, ex : real;
 begin
  i:=1;
  ex:=1;
  prev:=1;
  begin
    while (i<n) do
    begin
      if abs(sin(x)-ex)<>t then
      begin    
      next:=prev*x/i*(i+1);
      ex:=ex+next;
      inc(i);
      //writeln('����� ������������ ���������:', n);
      end
      else
      //writeln('����� ���������, �� ������� ���������� ������������:', i);
     break;    
  end;
 end;
 TeilorEx:=ex;
end;

function TeilorCh(x:real;t:real;n:integer):real;
var
 i:integer;
 prev, next, ch : real;
 begin
  i:=1;
  ch:=1;
  prev:=1;
  begin
  while (i<n) do
  begin
    if abs(sin(x)-ch)<>t then
    begin    
    next:=prev*x*x/(2*i-1)/(2*i);
    ch:=ch+next;
    inc(i);
    //writeln('����� ������������ ���������:', n);
    end
    else
    //writeln('����� ���������, �� ������� ���������� ������������:', i);
    break;    
  end;
 end;
 TeilorCh:=ch;
end;

function etalon(x:real; numberfunc:integer):real; // ����� ���������� �������� �������
begin
   case numberfunc of 
   1: etalon := sin(x);
   2: etalon := cos(x);
   3: etalon := exp(x);
   4: etalon := (exp(x)+exp(-x))/2;
   end;
end;

type FuncType = function(x:real;t:real;n:integer):Real; // ���������� ������������ ����
const F: array[1..4] of FuncType = (TeilorSin, TeilorCos, TeilorEx, TeilorCh); // ������ �������

{��������� ������ ������� �������� �������}
procedure PrintTable(Func: FuncType; x:real; t:real; n:integer; numberfunc:integer);
   var j: integer;
   begin
      writeln('��������� �������� ������� �����: ', etalon(x,numberfunc));
      Write('  N', '              �������� ������� ');
      writeln;
      for j := 1 to n do
      begin
         Write('', j: 3, '             ', F[numberfunc](x,t,j), '         ');
         writeln;
      end;
   end;

begin
end.