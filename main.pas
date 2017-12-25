Uses func;

const toch=0.000001;
var
  k, case11, case12, case13, n : integer;
  x, res, etalonres, t : real;
begin
  k:=1; 
  while k=1 do
    begin
      writeln('Выберите режим работы программы');
      writeln('1 Единичный расчет функции в заданной точке');
      writeln('2 Серийный эксперимент');
      writeln('3 Закончить работу');
      readln(case11);
      case case11 of
        1 : {Режим единичного расчёта}
        begin
        writeln('Выберите функцию');
        writeln('1 sin(x)');
        writeln('2 cos(x)');
        writeln('3 exp(x)');
        writeln('4 ch(x)');
        readln(case12);
        if (case12 > 0) or (case12 < 5) then
        begin
           writeln('Введите значение точки х');
           readln(x);
           repeat
           writeln('Введите точность вычисления (должна быть меньше 0.000001)');
           readln(t);
           until t <= toch;
           writeln('Введите число элементов ряда');
           readln(n);
           writeln('Результат:');
        end;
        res:=F[case12](x,t,n); // использование процедурного типа
        etalonres := etalon(x,case12); // использование функции, выводящей эталонное значение функции
        writeln('Эталонное значение:',etalonres);
        writeln('Значение ряда Тейлора функции:',res);
        writeln('Разница между значением ряда и эталонным значением:',etalonres-res);
        end;
          
        2 : {Режим серийных экспериментов}
        begin
        writeln('Выберите функцию');
        writeln('1 sin(x)');
        writeln('2 cos(x)');
        writeln('3 exp(x)');
        writeln('4 ch(x)');
        readln(case13);
        writeln('Введите значение точки х');
        readln(x);
        writeln('Введите число элементов ряда');
        readln(n); 
        PrintTable(F[case13],x,t,n,case13); // использование процедуры вывода таблицы серийных экспериментов
        end;          
            
        3 : break; {Завершение работы}
     end;
   end;
end.
    