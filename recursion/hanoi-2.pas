program hanoi2;

procedure hanoi(num, src, dst: integer);
{ num is a number of a disc }
begin
    if num = 0 then
        exit;
    hanoi(num-1, src, 6-src-dst);
    writeln('N', num, ': ', src, ' -> ', dst);
    hanoi(num-1, 6-src-dst, dst);
end;

begin
    hanoi(3, 1 ,3);
end.
