Uses func;

const toch=0.000001;
var
  k, case11, case12, case13, n : integer;
  x, res, etalonres, t : real;
begin
  k:=1; 
  while k=1 do
    begin
      writeln('�������� ����� ������ ���������');
      writeln('1 ��������� ������ ������� � �������� �����');
      writeln('2 �������� �����������');
      writeln('3 ��������� ������');
      readln(case11);
      case case11 of
        1 : {����� ���������� �������}
        begin
        writeln('�������� �������');
        writeln('1 sin(x)');
        writeln('2 cos(x)');
        writeln('3 exp(x)');
        writeln('4 ch(x)');
        readln(case12);
        if (case12 > 0) or (case12 < 5) then
        begin
           writeln('������� �������� ����� �');
           readln(x);
           repeat
           writeln('������� �������� ���������� (������ ���� ������ 0.000001)');
           readln(t);
           until t <= toch;
           writeln('������� ����� ��������� ����');
           readln(n);
           writeln('���������:');
        end;
        res:=F[case12](x,t,n); // ������������� ������������ ����
        etalonres := etalon(x,case12); // ������������� �������, ��������� ��������� �������� �������
        writeln('��������� ��������:',etalonres);
        writeln('�������� ���� ������� �������:',res);
        writeln('������� ����� ��������� ���� � ��������� ���������:',etalonres-res);
        end;
          
        2 : {����� �������� �������������}
        begin
        writeln('�������� �������');
        writeln('1 sin(x)');
        writeln('2 cos(x)');
        writeln('3 exp(x)');
        writeln('4 ch(x)');
        readln(case13);
        writeln('������� �������� ����� �');
        readln(x);
        writeln('������� ����� ��������� ����');
        readln(n); 
        PrintTable(F[case13],x,t,n,case13); // ������������� ��������� ������ ������� �������� �������������
        end;          
            
        3 : break; {���������� ������}
     end;
   end;
end.
    