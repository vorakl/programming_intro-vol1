program hanoi1;

procedure hanoi(num, src, dst: integer);
{ num is a quantity of discs }
begin
    if num = 1 then
    begin
        writeln('Move a top disk from ', src, ' to ', dst);
        exit;
    end;
    hanoi(num-1, src, 6-src-dst);
    hanoi(1, src, dst);
    hanoi(num-1, 6-src-dst, dst);
end;

begin
    hanoi(3, 1 ,3);
end.
