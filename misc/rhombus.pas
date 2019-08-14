program rhombus;

function EnterRhombusHight(): integer;
var 
    d : integer;
begin
    repeat
        write('Enter a hight (an odd positive number):');
        readln(d);
    until (d > 0) and (d mod 2 = 1);
    EnterRhombusHight := d;
end;

var
    rhombus_hight, line_num, line_pos, rhombus_mid, star_shift : integer;

begin
    rhombus_hight := EnterRhombusHight;
    rhombus_mid := rhombus_hight div 2;
    line_num := 0;
    line_pos := 0;
    while line_num <= rhombus_hight -1 do begin
        star_shift := rhombus_mid - abs(line_num - rhombus_mid);
        line_pos := 0;
        while line_pos <= rhombus_mid + star_shift do begin
            if line_pos = rhombus_mid + star_shift then
                writeln('*')
            else if line_pos = rhombus_mid - star_shift then
                write('*')
            else
                write(' ');
            line_pos := line_pos + 1;
        end;
        line_num := line_num + 1;
    end;
end.
